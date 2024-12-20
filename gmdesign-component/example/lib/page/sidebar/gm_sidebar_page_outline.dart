import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../../annotation/demo.dart';
import '../../base/example_widget.dart';

///
/// GMSideBarOutlinePage演示
///
class GMSideBarOutlinePage extends StatefulWidget {
  const GMSideBarOutlinePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GMSideBarOutlinePageState();
  }
}

class GMSideBarOutlinePageState extends State<GMSideBarOutlinePage> {
  var currentValue = 1;
  var itemHeight = 278.5;
  final _demoScroller = ScrollController(initialScrollOffset: 278.5);
  final _sideBarController = GMSideBarController();
  static const threshold = 50;
  var lock = false;

  @override
  void initState() {
    super.initState();

    _demoScroller.addListener(() {
      if (lock) {
        return;
      }

      var scrollTop = _demoScroller.offset;
      var index = (scrollTop + threshold) ~/ itemHeight;

      if (currentValue != index) {
        setState(() {
          _sideBarController.selectTo(index);
        });
      }
    });
  }

  Future<void> onSelected(int value) async {
    if (currentValue != value) {
      setState(() {
        currentValue = value;
      });

      lock = true;
      await _demoScroller.animateTo(value.toDouble() * itemHeight,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      lock = false;
    }
  }

  void onChanged(int value) {
    setState(() {
      currentValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var current = buildWidget(context);
    return current;
  }

  Widget buildWidget(BuildContext context) {
    return ExamplePage(
        title: 'SideBar 非通栏选项样式',
        exampleCodeGroup: 'sideBar',
        showSingleChild: true,
        singleChild: CodeWrapper(
          isCenter: false,
          builder: _buildOutlineSideBar,
        ));
  }

  @Demo(group: 'sideBar')
  Widget _buildOutlineSideBar(BuildContext context) {
    // 非通栏选项样式
    final list = <SideItemProps>[];
    final pages = <Widget>[];

    for (var i = 0; i < 20; i++) {
      list.add(SideItemProps(
        index: i,
        label: '选项',
        value: i,
      ));
      pages.add(getAnchorDemo(i));
    }

    pages.add(Container(
      height: MediaQuery.of(context).size.height - itemHeight,
      decoration: const BoxDecoration(color: Colors.white),
    ));

    list[1].badge = const GMBadge(GMBadgeType.redPoint);
    list[2].badge = const GMBadge(
      GMBadgeType.message,
      count: '8',
    );

    var demoHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        SizedBox(
          width: 110,
          child: GMSideBar(
            height: demoHeight,
            style: GMSideBarStyle.outline,
            value: currentValue,
            controller: _sideBarController,
            children: list
                .map((ele) => GMSideBarItem(
                    label: ele.label ?? '',
                    badge: ele.badge,
                    value: ele.value,
                    icon: ele.icon))
                .toList(),
            onChanged: onChanged,
            onSelected: onSelected,
          ),
        ),
        Expanded(
            child: SizedBox(
          height: demoHeight,
          child: SingleChildScrollView(
            controller: _demoScroller,
            child: Column(
              children: pages,
            ),
          ),
        ))
      ],
    );
  }

  Widget getAnchorDemo(int index) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15, right: 9),
            child: GMText('标题$index',
                style: const TextStyle(
                  fontSize: 14,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: displayImageList(),
          ),
        ],
      ),
    );
  }

  Widget displayImageList() {
    return Column(
      children: [
        displayImageItem(),
        const GMDivider(),
        displayImageItem(),
        const GMDivider(),
        displayImageItem(),
        const GMDivider(),
      ],
    );
  }

  Widget displayImageItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          GMImage(
            assetUrl: 'assets/img/empty.png',
            type: GMImageType.roundedSquare,
            width: 48,
            height: 48,
          ),
          SizedBox(
            width: 16,
          ),
          GMText(
            '标题',
            style: TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
