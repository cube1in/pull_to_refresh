import 'package:example/ui/example/customindicator/footer_underscroll.dart';
import 'package:example/ui/example/customindicator/shimmer_indicator.dart';
import 'package:example/ui/example/useStage/force_full_one_page.dart';
import 'package:flutter/material.dart';
import 'otherwidget/refresh_staggered_and_sticky.dart';
import 'package:example/ui/example/useStage/empty_view.dart';
import 'customindicator/gif_indicator_example1.dart';
import 'package:example/ui/example/useStage/hidefooter_bycontent.dart';
import 'package:example/ui/example/otherwidget/refesh_expansiopn_panel_list_example.dart';
import 'package:example/ui/example/useStage/horizontal+reverse.dart';
import 'package:example/ui/example/useStage/nested.dart';
import 'package:example/ui/example/otherwidget/refresh_animatedlist_example.dart';
import 'package:example/ui/example/customindicator/spinkit_header.dart';
import 'package:example/ui/example/useStage/basic.dart';
import 'package:example/ui/example/otherwidget/refresh_pageView_example.dart';
import 'package:example/ui/example/customindicator/link_header_example.dart';
import 'package:example/ui/example/useStage/twolevel_refresh.dart';
import 'useStage/qq_chat_list.dart';
import 'otherwidget/refresh_recordable_listview_example.dart';
import 'otherwidget/draggable_bottomsheet_loadmore.dart';
import 'useStage/tapbutton_refresh.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExamplePageState();
  }
}

class ExampleItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExampleItemState();
  }

  final void Function() onClick;

  final String title;

  const ExampleItem({Key? key, required this.title, required this.onClick}) : super(key: key);
}

class _ExampleItemState extends State<ExampleItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onClick,
      child: SizedBox(
        height: 100.0,
        child: Card(
          child: Center(
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}

class _ExamplePageState extends State<ExamplePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final List<ExampleItem> items1 = [
      ExampleItem(
          title: "????????????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return BasicExample();
            }));
          }),
      ExampleItem(
          title: "????????????footer",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: HideFooterManual(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "????????????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: HorizontalRefresh(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "????????????????????????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return TapButtonRefreshExample();
            }));
          }),
      ExampleItem(
          title: "NestedScrollView?????????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return NestedRefresh();
            }));
          }),
      ExampleItem(
          title: "??????qq??????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return QQChatList();
            }));
          }),
      ExampleItem(
          title: "????????????+??????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: RefreshWithEmptyView(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "??????????????????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return TwoLevelExample();
            }));
          }),
      ExampleItem(
          title: "??????????????????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: ForceFullExample(),
                appBar: AppBar(),
              );
            }));
          }),
    ];
    final List<ExampleItem> items2 = [
      ExampleItem(
          title: "animatedlist??????refresher",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: AnimatedListExample(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "ExpansionPanelList????????????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(),
                body: RefreshExpansionPanelList(),
              );
            }));
          }),
      ExampleItem(
          title: "loadmore+draggablesheet",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(),
                body: DraggableLoadingBottomSheet(),
              );
            }));
          }),
      ExampleItem(
          title: "stickyHeader+StaggeredGridView",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(),
                body: RefreshStaggeredAndSticky(),
              );
            }));
          }),
      ExampleItem(
          title: "pageView??????SmartRefresher",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: PageViewExample(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "RecordableListView",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: const ReorderableListDemo(),
                appBar: AppBar(),
              );
            }));
          }),
    ];

    final List<ExampleItem> items3 = [
      ExampleItem(
          title: "??????????????????????????????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                body: CustomHeaderExample(),
                appBar: AppBar(),
              );
            }));
          }),
      ExampleItem(
          title: "LinkHeader??????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return LinkHeaderExample();
            }));
          }),
      ExampleItem(
          title: "Shimmer???????????????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(),
                body: ShimmerIndicatorExample(),
              );
            }));
          }),
      ExampleItem(
          title: "Gif???????????????1",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(),
                body: GifIndicatorExample1(),
              );
            }));
          }),
      ExampleItem(
          title: "footer?????????header????????????",
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ConvertFooter();
            }));
          }),
    ];

    return Column(
      children: <Widget>[
        Container(
          height: 50.0,
          color: Colors.greenAccent,
          child: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                text: "????????????",
              ),
              Tab(
                text: "??????????????????", //?????????
              ),
              Tab(
                text: "??????????????????",
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListView(children: items1),
              ListView(children: items2),
              ListView(children: items3)
            ],
          ),
        )
      ],
    );
  }
}
