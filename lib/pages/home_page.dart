import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class  HomePage extends  StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  final PageController _controller = PageController(
    initialPage: 0,
  );

  double appBarAlpha = 0;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  @override
  Widget build(BuildContext context) {
    List _imageUrls = [
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566917123673&di=57c6b5354ceac6efbc53ffe2503f9845&imgtype=0&src=http%3A%2F%2Fimg.bimg.126.net%2Fphoto%2FgtuhXjhGXSiZSGPfPPjXtA%3D%3D%2F4786481978965201252.jpg',
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566917123673&di=b60a48df32330e6b21da6b8690f40fee&imgtype=0&src=http%3A%2F%2Fwww.myhawaii.cn%2Fgetattachment%2FGuides%2FHotels%2FBest-Reasons-to-make-Reservation-from-Hotel-Offici%2FMK_02.jpg',
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566917123672&di=ee7792b1c0bb28c68735d0a062f86895&imgtype=0&src=http%3A%2F%2Fs3.lvjs.com.cn%2Fuploads%2Fpc%2Fplace2%2F2015-07-02%2F6f61133c-b97c-4658-ac3e-563bb15f3639.jpg'
    ];

    return Scaffold(
      body:Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                    // 滚动且是列表滚动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160.0,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context,int  index){
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Container(
                      height: 800.0,
                      child: ListTile(
                        title: Text('somethig'),
                      ),
                    )
                  ],
                ),
              ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding:EdgeInsets.only(top:20),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}