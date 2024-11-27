import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class GMTabsPage extends StatefulWidget {
  const GMTabsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GMTabsPageState();
}

class _GMTabsPageState extends State<GMTabsPage>
    with TickerProviderStateMixin {
  TabController? _tabController1;
  TabController? _tabController2;
  TabController? _tabController3;
  TabController? _tabController4;
  List<GMTab> tabs = [];
  List<Widget> tabViews = [];

  List<GMTab> _getTabs() {
    tabs = const [
      GMTab(
        text: '选项',
      ),
      GMTab(
        text: '选项',
      ),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
      GMTab(text: '选项'),
    ];
    return tabs;
  }

  List<Widget> _getTabViews() {
    tabViews = const [
      Center(child: GMText('内容区')),
      Center(child: GMText('内容区')),
      Center(child: GMText('内容区')),
    ];
    return tabViews;
  }

  @override
  void initState() {
    _initTabController();
    _getTabs();
    super.initState();
  }

  List<GMTab> subList(int length) {
    var temp = <GMTab>[];
    for (var i = 0; i < length; i++) {
      temp.add(tabs[i]);
    }
    switch (length) {
      case 3:
        temp[temp.length - 1] = const GMTab(text: '上限六个字');
        break;
      case 4:
        temp[temp.length - 1] = const GMTab(text: '上限四字');
        break;
      case 5:
        temp[temp.length - 1] = const GMTab(text: '上限三');
        break;
    }
    return temp;
  }

  //初始化tab
  void _initTabController() {
    _tabController1 = TabController(length: 2, vsync: this);
    _tabController2 = TabController(length: 3, vsync: this);
    _tabController3 = TabController(length: 4, vsync: this);
    _tabController4 = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
        title: tdTitle(),
        desc: '用于内容分类后的展示切换。',
        exampleCodeGroup: 'tabs',
        children: [
          ExampleModule(
            title: '组件类型',
            children: [
              ExampleItem(desc: '均分选项卡', builder: _buildItemWithSplit1),
              ExampleItem(builder: _buildItemWithSplit2, padding: const EdgeInsets.only(top: 16)),
              ExampleItem(builder: _buildItemWithSplit3, padding: const EdgeInsets.only(top: 16)),
              ExampleItem(builder: _buildItemWithSplit4, padding: const EdgeInsets.only(top: 16)),
              ExampleItem(desc: '等距选项卡', builder: _buildItemWithSpace),
              ExampleItem(desc: '带图标选项卡', builder: _buildItemWithIcon),
              ExampleItem(desc: '带微标选项卡', builder: _buildItemWithLogo),
              ExampleItem(desc: '带内容区选项卡', builder: _buildItemWithContent),
            ],
          ),
          ExampleModule(title: '组件状态', children: [
            ExampleItem(desc: '选项卡状态', builder: _buildItemWithStatus),
          ]),
          ExampleModule(title: '组件样式', children: [
            ExampleItem(desc: '选项卡尺寸', builder: _buildItemWithSizeSmall),
            ExampleItem(builder: _buildItemWithSizeBig, padding: const EdgeInsets.only(top: 16)),
            ExampleItem(desc: '选项卡样式', builder: _buildItemWithOutlineNormal),
            ExampleItem(builder: _buildItemWithOutlineCard, padding: const EdgeInsets.only(top: 16)),
          ]),
        ],
    test: [
      ExampleItem(desc: '自定义下标属性', builder: _customIndicatorStyle),
      ExampleItem(desc: '自定义下划线样式', builder: _customDividerStyle),
      ExampleItem(desc: '不展示下划线-高度为0', builder: _hideBottomDivider),
    ],);
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithSplit1(BuildContext context) {
    return GMTabBar(
      tabs: subList(2),
      controller: _tabController1,
      backgroundColor: Colors.white,
      showIndicator: true,
    );
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithSplit2(BuildContext context) {
    return GMTabBar(
      tabs: subList(3),
      controller: _tabController2,
      backgroundColor: Colors.white,
      showIndicator: true,
    );
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithSplit3(BuildContext context) {
    return GMTabBar(
      tabs: subList(4),
      controller: _tabController3,
      backgroundColor: Colors.white,
      showIndicator: true,
    );
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithSplit4(BuildContext context) {
    return GMTabBar(
      tabs: subList(5),
      controller: _tabController4,
      backgroundColor: Colors.white,
      showIndicator: true,
    );
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithSpace(BuildContext context) {
    return GMTabBar(
      tabs: subList(16),
      controller: TabController(length: 16, vsync: this),
      backgroundColor: Colors.white,
      labelPadding: const EdgeInsets.all(10),
      showIndicator: true,
      isScrollable: true,
    );
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithIcon(BuildContext context) {
    var tabs = [
      const GMTab(
        text: '选项',
        icon: Icon(
          GMIcons.app,
          size: 18,
        ),
      ),
      const GMTab(
        text: '选项',
        icon: Icon(
          GMIcons.app,
          size: 18,
        ),
      ),
      const GMTab(
        text: '选项',
        icon: Icon(
          GMIcons.app,
          size: 18,
        ),
      ),
    ];
    return GMTabBar(
        tabs: tabs,
        controller: TabController(length: 3, vsync: this),
        backgroundColor: Colors.white,
        showIndicator: true);
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithLogo(BuildContext context) {
    var tabs = [
      const GMTab(
        text: '选项',
        contentHeight: 48,
        textMargin: EdgeInsets.only(right: 8),
        badge: GMBadge(GMBadgeType.redPoint),
      ),
      const GMTab(
        text: '选项',
        contentHeight: 42,
        textMargin: EdgeInsets.only(right: 16, top: 2, bottom: 2),
        badge: GMBadge(
          GMBadgeType.message,
          message: '8',
        ),
      ),
      const GMTab(
        text: '选项',
        height: 48,
        icon: Icon(
          GMIcons.app,
          size: 18,
        ),
      ),
    ];
    return GMTabBar(
        tabs: tabs,
        controller: TabController(length: 3, vsync: this),
        backgroundColor: Colors.white,
        showIndicator: true);
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithContent(BuildContext context) {
    var tabController = TabController(length: 3, vsync: this);
    return SizedBox(
      height: 120 + 48,
      child: Column(
        children: [
          GMTabBar(
              tabs: subList(3),
              controller: tabController,
              showIndicator: true,
              backgroundColor: Colors.white,
              isScrollable: false,),
          Container(
            height: 120,
            color: Colors.white,
            child: GMTabBarView(
              children: _getTabViews(),
              controller: tabController,
            ),
          )
        ],
      ),
    );
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithStatus(BuildContext context) {
    var tabs = [
      const GMTab(
        text: '选中',
      ),
      const GMTab(
        text: '默认',
      ),
      const GMTab(
        text: '禁用',
        enable: false,
      ),
    ];
    return GMTabBar(
        tabs: tabs,
        controller: TabController(length: 3, vsync: this),
        backgroundColor: Colors.white,
        showIndicator: true);
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithSizeSmall(BuildContext context) {
    var tabs = [
      const GMTab(
        text: '小尺寸',
      ),
      const GMTab(
        text: '选项',
      ),
      const GMTab(
        text: '选项',
      ),
      const GMTab(
        text: '选项',
      ),
    ];
    return GMTabBar(
        tabs: tabs,
        controller: TabController(length: 4, vsync: this),
        backgroundColor: Colors.white,
        showIndicator: true);
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithSizeBig(BuildContext context) {
    var tabs = [
      const GMTab(
        text: '大尺寸',
        size: GMTabSize.large,
      ),
      const GMTab(
        text: '选项',
        size: GMTabSize.large,
      ),
      const GMTab(
        text: '选项',
        size: GMTabSize.large,
      ),
      const GMTab(
        text: '选项',
        size: GMTabSize.large,
      ),
    ];
    return GMTabBar(
        tabs: tabs,
        controller: TabController(length: 4, vsync: this),
        backgroundColor: Colors.white,
        showIndicator: true);
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithOutlineNormal(BuildContext context) {
    var tabs = [
      const GMTab(
        text: '选项',
      ),
      const GMTab(
        text: '选项',
      ),
      const GMTab(
        text: '选项',
      ),
      const GMTab(
        text: '选项',
      ),
    ];
    return GMTabBar(
        tabs: tabs,
        outlineType: GMTabBarOutlineType.capsule,
        controller: TabController(length: 4, vsync: this),
        backgroundColor: Colors.white,
        showIndicator: false);
  }

  @Demo(group: 'tabs')
  Widget _buildItemWithOutlineCard(BuildContext context) {
    var tabs = [
      const GMTab(
        text: '选项',
      ),
      const GMTab(
        text: '选项',
      ),
      const GMTab(
        text: '选项',
      ),
      const GMTab(
        text: '选项',
      ),
    ];
    return GMTabBar(
        tabs: tabs,
        outlineType: GMTabBarOutlineType.card,
        controller: TabController(length: 4, vsync: this),
        backgroundColor: Colors.white,
        showIndicator: false);
  }

  @Demo(group: 'tabs')
  Widget _customIndicatorStyle(BuildContext context) {
    return GMTabBar(
      tabs: subList(2),
      controller: _tabController1,
      backgroundColor: Colors.white,
      showIndicator: true,
      indicatorColor: Colors.red,
      indicatorHeight: 20,
      indicatorWidth: 10,
      indicatorPadding: const EdgeInsets.only(left: 20),
    );
  }

  @Demo(group: 'tabs')
  Widget _customDividerStyle(BuildContext context) {
    return GMTabBar(
      tabs: subList(2),
      controller: _tabController1,
      backgroundColor: Colors.white,
      showIndicator: true,
      dividerColor: Colors.red,
      dividerHeight: 5,
    );
  }

  @Demo(group: 'tabs')
  Widget _hideBottomDivider(BuildContext context) {
    return GMTabBar(
      tabs: subList(2),
      controller: _tabController1,
      backgroundColor: Colors.white,
      showIndicator: true,
      dividerColor: Colors.red,
      dividerHeight: 0,
    );
  }
}
