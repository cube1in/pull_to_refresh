import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Test4 extends StatefulWidget {
  const Test4({Key? key}) : super(key: key);

  @override
  State<Test4> createState() => Test4State();
}

class Test4State extends State<Test4> with TickerProviderStateMixin {
//  RefreshMode  refreshing = RefreshMode.idle;
//  LoadMode loading = LoadMode.idle;
  ValueNotifier<double> topOffsetLis = ValueNotifier(0.0);
  ValueNotifier<double> bottomOffsetLis = ValueNotifier(0.0);
  RefreshController _refreshController = RefreshController();

  List<Widget> data = [];

  void _getData() {
    data.add(Row(
      children: <Widget>[
        TextButton(
            onPressed: () {
              _refreshController.requestRefresh();
            },
            child: const Text("请求刷新")),
        TextButton(
            onPressed: () {
              _refreshController.requestLoading();
            },
            child: const Text("请求加载数据"))
      ],
    ));
    for (int i = 0; i < 22; i++) {
      data.add(GestureDetector(
        child: Container(
          color: const Color.fromARGB(255, 250, 250, 250),
          child: Card(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            child: Center(
              child: Text('Data $i'),
            ),
          ),
        ),
        onTap: () {
          _refreshController.requestRefresh();
        },
      ));
    }
  }

  void enterRefresh() {
    _refreshController.requestLoading();
  }

  @override
  void initState() {
    // TODO: implement initState
    // for test #68 true-> false ->true
//    Future.delayed(Duration(milliseconds: 3000), () {
//      _enablePullDown = false;
//      _enablePullUp = false;
//      if (mounted) setState(() {});
//    });
//    Future.delayed(Duration(milliseconds: 6000), () {
//      _enablePullDown = true;
//      _enablePullUp = true;
//      if (mounted) setState(() {});
//    });

//    // for test #68 false-> true ->false
//    Future.delayed(Duration(milliseconds: 3000),(){
//      _enablePullDown = false;
//      _enablePullUp = true;
//    if(mounted)
//      setState(() {
//
//      });
//    });
//    Future.delayed(Duration(milliseconds: 6000),(){
//      _enablePullDown = true;
//      _enablePullUp = false;
//    if(mounted)
//      setState(() {
//
//      });
//    });
//    Future.delayed(Duration(milliseconds: 3000),(){
//      _enablePullDown = true;
//      _enablePullUp = false;
//    if(mounted)
//      setState(() {
//
//      });
//    });
//    Future.delayed(Duration(milliseconds: 6000),(){
//      _enablePullDown = false;
//      _enablePullUp = true;
//    if(mounted)
//      setState(() {
//
//      });
//    });
//    final NetworkImage provider = AssetImage("images/animate.gif");
//    provider.obtainKey(ImageConfiguration()).then((k) async{
//        final ByteData data = await k.bundle.load(k.name);
//         ui.Codec codec= await PaintingBinding.instance.instantiateImageCodec(data.buffer.asUint8List());
//         ui.FrameInfo info;
//         for(int i = 0 ;i<54;i++){
//           info = await codec.getNextFrame();
//         }
//         print(codec.frameCount);
//        return ;
//    });

    _getData();
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    // Check that a second resolve of the same image is synchronous.
//    final ImageStream stream = provider.resolve(provider.);
//    bool isSync;
//    stream.addListener(ImageStreamListener((ImageInfo image, bool sync) { isSync = sync; }));
    return RefreshConfiguration.copyAncestor(
      context: context,
      hideFooterWhenNotFull: false,
      child: SmartRefresher.builder(
        enablePullUp: true,
        enablePullDown: true,
        builder: (context, physics) {
          return CustomScrollView(physics: physics, slivers: [
            const MaterialClassicHeader(),
            const SliverAppBar(),
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 3000,
                    color: Colors.red,
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        ElevatedButton(
                          child: const Text("主动刷新(移动)"),
                          onPressed: () {
                            _refreshController.requestRefresh();
                          },
                        ),
                        ElevatedButton(
                          child: const Text("主动加载"),
                          onPressed: () {
                            _refreshController.requestLoading();
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 3000,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            const ClassicFooter(),
          ]);
        },
        onRefresh: () async {
          if (kDebugMode) {
            print("onRefresh");
          }
          await Future.delayed(const Duration(milliseconds: 1300));
          _refreshController.refreshCompleted();
        },
        onLoading: () async {
          await Future.delayed(const Duration(milliseconds: 1300));
          _refreshController.loadComplete();
        },
        controller: _refreshController,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}

class CirclePainter extends CustomClipper<Path> {
  final double offset;
  final bool up;

  CirclePainter({required this.offset, required this.up});

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    final path = Path();
    if (!up) path.moveTo(0.0, size.height);
    path.cubicTo(0.0, up ? 0.0 : size.height, size.width / 2,
        up ? offset * 2.3 : size.height - offset * 2.3, size.width, up ? 0.0 : size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper != this;
  }
}

class RefreshListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RefreshListViewState();
  }

  final ScrollPhysics physics;
  final List<Widget> slivers;

  const RefreshListView({Key? key, required this.slivers, required this.physics}) : super(key: key);
}

class _RefreshListViewState extends State<RefreshListView> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return show
        ? CustomScrollView(
            slivers: widget.slivers,
            physics: const AlwaysScrollableScrollPhysics(),
          )
        : const CupertinoActivityIndicator();
  }
}
