import 'package:flutter/material.dart';
import '../../../other/shimmer_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShimmerIndicatorExample extends StatefulWidget {
  const ShimmerIndicatorExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShimmerIndicatorExampleState();
  }
}

/*

      @required Color baseColor,
      @required Color highlightColor,
      this.period = const Duration(milliseconds: 1500),
      this.direction = ShimmerDirection.ltr,

 */
class _ShimmerIndicatorExampleState extends State<ShimmerIndicatorExample> {
  final RefreshController _refreshController = RefreshController();
  List<String> data = ["1", "2", "1", "2", "1", "2", "1", "2", "1", "2", "1", "2"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SmartRefresher(
        header: const ShimmerHeader(
          text: Text(
            "PullToRefresh",
            style: TextStyle(color: Colors.grey, fontSize: 22),
          ),
        ),
        footer: const ShimmerFooter(
          text: Text(
            "PullToRefresh",
            style: TextStyle(color: Colors.grey, fontSize: 22),
          ),
        ),
        controller: _refreshController,
        enablePullUp: true,
        child: ListView.builder(
          itemCount: data.length,
          itemExtent: 100.0,
          itemBuilder: (c, i) => const Card(),
        ),
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 2000));
          _refreshController.refreshCompleted();
        },
        onLoading: () async {
          await Future.delayed(const Duration(milliseconds: 2000));
          for (int i = 0; i < 10; i++) {
            data.add("1");
          }
          setState(() {});
          _refreshController.loadComplete();
        });
  }
}
