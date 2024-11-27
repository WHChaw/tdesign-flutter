import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class GMStepsPage extends StatefulWidget {
  const GMStepsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GMStepsPageState();
}

class _GMStepsPageState extends State<GMStepsPage> {
  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      backgroundColor: GMTheme.of(context).whiteColor1,
      title: tdTitle(),
      exampleCodeGroup: 'steps',
      desc: 'Steps步骤条',
      children: [
        ExampleModule(title: '水平默认步骤条', children: [
          ExampleItem(
              desc: '水平默认步骤条1',
              builder: _buildBasicHSteps1),
          ExampleItem(
              desc: '水平默认步骤条2',
              builder: _buildBasicHSteps2),
          ExampleItem(
              desc: '水平默认步骤条3',
              builder: _buildBasicHSteps3),
        ]),
        ExampleModule(title: '水平图标步骤条', children: [
          ExampleItem(
              desc: '水平图标步骤条1',
              builder: _buildHIconSteps1),
          ExampleItem(
              desc: '水平图标步骤条2',
              builder: _buildHIconSteps2),
          ExampleItem(
              desc: '水平图标步骤条3',
              builder: _buildHIconSteps3),
        ]),
        ExampleModule(title: '水平简略步骤条', children: [
          ExampleItem(
              desc: '水平简略步骤条1',
              builder: _buildSimpleHSteps1),
          ExampleItem(
              desc: '水平简略步骤条2',
              builder: _buildSimpleHSteps2),
          ExampleItem(
              desc: '水平简略步骤条3',
              builder: _buildSimpleHSteps3),
        ]),
        ExampleModule(title: '水平错误状态步骤条', children: [
          ExampleItem(
              desc: '水平错误状态基本步骤条',
              builder: _buildHErrorSteps1),
          ExampleItem(
              desc: '水平错误状态图标步骤条',
              builder: _buildHErrorSteps2),
          ExampleItem(
              desc: '水平错误状态简略步骤条',
              builder: _buildHErrorSteps3),
        ]),

        ExampleModule(title: '垂直步骤条', children: [
          ExampleItem(
              desc: '垂直默认步骤条',
              builder: _buildVBasicSteps),
          ExampleItem(
              desc: '垂直图标步骤条',
              builder: _buildVIconSteps),
          ExampleItem(
              desc: '垂直简略步骤条',
              builder: _buildVSimpleSteps),
          ExampleItem(
              desc: '垂直错误状态基本步骤条',
              builder: _buildVErrorBasicSteps),
          ExampleItem(
              desc: '垂直错误状态图标步骤条',
              builder: _buildVErrorIconSteps),
          ExampleItem(
              desc: '垂直错误状态简略步骤条',
              builder: _buildVErrorSimpleSteps),
          ExampleItem(
              desc: '垂直自定义内容基本步骤条',
              builder: _buildVCustomContentBaseSteps),
        ]),
        ExampleModule(title: 'Extension步骤条', children: [
          ExampleItem(
              desc: 'Read-only Steps 纯展示水平步骤条',
              builder: _buildHReadOnlySteps),
          ExampleItem(
              desc: 'Read-only Steps 纯展示垂直步骤条',
              builder: _buildVReadOnlySteps),
          ExampleItem(
              desc: 'Vertical Customize Steps 垂直自定义步骤条',
              builder: _buildVCustomizeSteps),
        ]),
      ],
    );
  }

  List<GMStepsItemData> basicHStepsListData1 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1'),
    GMStepsItemData(title: 'Steps2', content: 'Content2'),
  ];
  /// 基本步骤1
  @Demo(group: 'steps')
  Widget _buildBasicHSteps1(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: basicHStepsListData1,
            ),
          )
        ],
      ),
    );
  }
  List<GMStepsItemData> basicHStepsListData2 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1'),
    GMStepsItemData(title: 'Steps2', content: 'Content2'),
    GMStepsItemData(title: 'Steps3', content: 'Content3'),
  ];
  /// 基本步骤2
  @Demo(group: 'steps')
  Widget _buildBasicHSteps2(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: basicHStepsListData2,
              direction: GMStepsDirection.horizontal,
              activeIndex: 1,
            ),
          )
        ],
      ),
    );
  }
  List<GMStepsItemData> basicHStepsListData3 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1'),
    GMStepsItemData(title: 'Steps2', content: 'Content2'),
    GMStepsItemData(title: 'Steps3', content: 'Content3'),
    GMStepsItemData(title: 'Steps4', content: 'Content4'),
  ];
  List<GMStepsItemData> basicStepsListData4 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1', successIcon: GMIcons.call),
    GMStepsItemData(title: 'Steps2', content: 'Content2'),
    GMStepsItemData(title: 'Steps3', content: 'Content3', successIcon: GMIcons.call),
    GMStepsItemData(title: 'Steps4', content: 'Content4', successIcon: GMIcons.call),
  ];
  /// 基本步骤3
  @Demo(group: 'steps')
  Widget _buildBasicHSteps3(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: basicHStepsListData3,
              direction: GMStepsDirection.horizontal,
              activeIndex: 1,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> hIconStepsListData1 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1', successIcon: GMIcons.call),
    GMStepsItemData(title: 'Steps2', content: 'Content2', successIcon: GMIcons.call),
  ];
  /// 水平图标步骤条1
  @Demo(group: 'steps')
  Widget _buildHIconSteps1(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: hIconStepsListData1,
              direction: GMStepsDirection.horizontal,
              activeIndex: 0,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> hIconStepsListData2 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1', successIcon: GMIcons.call),
    GMStepsItemData(title: 'Steps2', content: 'Content2', successIcon: GMIcons.call),
    GMStepsItemData(title: 'Steps3', content: 'Content3', successIcon: GMIcons.call),
  ];
  /// 水平图标步骤条1
  @Demo(group: 'steps')
  Widget _buildHIconSteps2(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: hIconStepsListData2,
              direction: GMStepsDirection.horizontal,
              activeIndex: 1,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> hIconStepsListData3 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1', successIcon: GMIcons.call),
    GMStepsItemData(title: 'Steps2', content: 'Content2', successIcon: GMIcons.call),
    GMStepsItemData(title: 'Steps3', content: 'Content3', successIcon: GMIcons.call),
    GMStepsItemData(title: 'Steps4', content: 'Content4', successIcon: GMIcons.call),
  ];
  /// 水平图标步骤条1
  @Demo(group: 'steps')
  Widget _buildHIconSteps3(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: hIconStepsListData3,
              direction: GMStepsDirection.horizontal,
              activeIndex: 1,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> simpleHStepsListData1 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1'),
    GMStepsItemData(title: 'Steps2', content: 'Content2'),
  ];
  /// 水平简略步骤条1
  @Demo(group: 'steps')
  Widget _buildSimpleHSteps1(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: simpleHStepsListData1,
              direction: GMStepsDirection.horizontal,
              activeIndex: 0,
              simple: true,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> simpleHStepsListData2 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1'),
    GMStepsItemData(title: 'Steps2', content: 'Content2'),
    GMStepsItemData(title: 'Steps3', content: 'Content3'),
  ];
  /// 水平简略步骤条2
  @Demo(group: 'steps')
  Widget _buildSimpleHSteps2(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: simpleHStepsListData2,
              direction: GMStepsDirection.horizontal,
              activeIndex: 1,
              simple: true,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> simpleHStepsListData3 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1'),
    GMStepsItemData(title: 'Steps2', content: 'Content2'),
    GMStepsItemData(title: 'Steps3', content: 'Content3'),
    GMStepsItemData(title: 'Steps4', content: 'Content4'),
  ];
  /// 水平简略步骤条3
  @Demo(group: 'steps')
  Widget _buildSimpleHSteps3(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: simpleHStepsListData3,
              direction: GMStepsDirection.horizontal,
              activeIndex: 1,
              simple: true,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> hErrorStepsListData1 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1'),
    GMStepsItemData(title: 'Error', content: 'Content2'),
    GMStepsItemData(title: 'Steps3', content: 'Content3'),
    GMStepsItemData(title: 'Steps4', content: 'Content4'),
  ];
  /// 水平简略步骤条3
  @Demo(group: 'steps')
  Widget _buildHErrorSteps1(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: hErrorStepsListData1,
              direction: GMStepsDirection.horizontal,
              activeIndex: 1,
              status: GMStepsStatus.error,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> hErrorStepsListData2 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1', successIcon: GMIcons.call),
    GMStepsItemData(title: 'Error', content: 'Content2', successIcon: GMIcons.call, errorIcon: GMIcons.close_circle),
    GMStepsItemData(title: 'Steps3', content: 'Content3', successIcon: GMIcons.call),
    GMStepsItemData(title: 'Steps4', content: 'Content4', successIcon: GMIcons.call),
  ];
  /// 水平简略步骤条3
  @Demo(group: 'steps')
  Widget _buildHErrorSteps2(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: hErrorStepsListData2,
              direction: GMStepsDirection.horizontal,
              activeIndex: 1,
              status: GMStepsStatus.error,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> hErrorStepsListData3 = [
    GMStepsItemData(title: 'Steps1', content: 'Content1', successIcon: GMIcons.call),
    GMStepsItemData(title: 'Error', content: 'Content2', successIcon: GMIcons.call, errorIcon: GMIcons.close_circle),
    GMStepsItemData(title: 'Steps3', content: 'Content3', successIcon: GMIcons.call),
    GMStepsItemData(title: 'Steps4', content: 'Content4', successIcon: GMIcons.call),
  ];
  /// 水平简略步骤条3
  @Demo(group: 'steps')
  Widget _buildHErrorSteps3(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: hErrorStepsListData3,
              direction: GMStepsDirection.horizontal,
              activeIndex: 1,
              status: GMStepsStatus.error,
              simple: true,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> vBasicStepsListData = [
    GMStepsItemData(title: 'Filish', content: 'Customize content'),
    GMStepsItemData(title: 'Process', content: 'Customize content'),
    GMStepsItemData(title: 'Default', content: 'Customize content'),
    GMStepsItemData(title: 'Default', content: 'Customize content'),
  ];
  /// 垂直默认步骤条
  @Demo(group: 'steps')
  Widget _buildVBasicSteps(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: vBasicStepsListData,
              direction: GMStepsDirection.vertical,
              activeIndex: 1,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> vIconStepsListData = [
    GMStepsItemData(title: 'Filish', content: 'Customize content', successIcon: GMIcons.cart),
    GMStepsItemData(title: 'Process', content: 'Customize content', successIcon: GMIcons.cart),
    GMStepsItemData(title: 'Default', content: 'Customize content', successIcon: GMIcons.cart),
    GMStepsItemData(title: 'Default', content: 'Customize content', successIcon: GMIcons.cart),
  ];
  /// 垂直图标步骤条
  @Demo(group: 'steps')
  Widget _buildVIconSteps(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: vIconStepsListData,
              direction: GMStepsDirection.vertical,
              activeIndex: 1,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> vSimpleStepsListData = [
    GMStepsItemData(title: 'Filish', content: 'Customize content', successIcon: GMIcons.cart),
    GMStepsItemData(title: 'Process', content: 'Customize content', successIcon: GMIcons.cart),
    GMStepsItemData(title: 'Default', content: 'Customize content', successIcon: GMIcons.cart),
    GMStepsItemData(title: 'Default', content: 'Customize content', successIcon: GMIcons.cart),
  ];
  /// 垂直简略步骤条
  @Demo(group: 'steps')
  Widget _buildVSimpleSteps(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: vSimpleStepsListData,
              direction: GMStepsDirection.vertical,
              activeIndex: 1,
              simple: true,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> vErrorBasicStepsListData = [
    GMStepsItemData(title: 'Filish', content: 'Customize content'),
    GMStepsItemData(title: 'Process', content: 'Customize content'),
    GMStepsItemData(title: 'Default', content: 'Customize content'),
    GMStepsItemData(title: 'Default', content: 'Customize content'),
  ];
  /// 垂直错误状态基本步骤条
  @Demo(group: 'steps')
  Widget _buildVErrorBasicSteps(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: vErrorBasicStepsListData,
              direction: GMStepsDirection.vertical,
              activeIndex: 1,
              status: GMStepsStatus.error,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> vErrorIconStepsListData = [
    GMStepsItemData(title: 'Filish', content: 'Customize content', successIcon: GMIcons.cart),
    GMStepsItemData(title: 'Process', content: 'Customize content', successIcon: GMIcons.cart, errorIcon: GMIcons.close_circle),
    GMStepsItemData(title: 'Default', content: 'Customize content', successIcon: GMIcons.cart),
    GMStepsItemData(title: 'Default', content: 'Customize content', successIcon: GMIcons.cart),
  ];
  /// 垂直错误状态图标步骤条
  @Demo(group: 'steps')
  Widget _buildVErrorIconSteps(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: vErrorIconStepsListData,
              direction: GMStepsDirection.vertical,
              activeIndex: 1,
              status: GMStepsStatus.error,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> vErrorSimpleStepsListData = [
    GMStepsItemData(title: 'Filish', content: 'Customize content', successIcon: GMIcons.cart),
    GMStepsItemData(title: 'Process', content: 'Customize content', successIcon: GMIcons.cart),
    GMStepsItemData(title: 'Default', content: 'Customize content', successIcon: GMIcons.cart),
    GMStepsItemData(title: 'Default', content: 'Customize content', successIcon: GMIcons.cart),
  ];
  /// 垂直错误状态图标步骤条
  @Demo(group: 'steps')
  Widget _buildVErrorSimpleSteps(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: vErrorSimpleStepsListData,
              direction: GMStepsDirection.vertical,
              activeIndex: 1,
              simple: true,
              status: GMStepsStatus.error,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> vCustomContentBasicStepsListData = [
    GMStepsItemData(title: 'Filish', content: 'Customize content'),
    GMStepsItemData(title: 'Process', content: 'Customize content', customContent: Container(
      margin: const EdgeInsets.only(bottom: 16, top: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: const GMImage(
          assetUrl: 'assets/img/image.png',
          type: GMImageType.square,
        ),
      ),
    )),
    GMStepsItemData(title: 'Default', content: 'Customize content'),
    GMStepsItemData(title: 'Default', content: 'Customize content'),
  ];
  /// 垂直自定义内容基本步骤条
  @Demo(group: 'steps')
  Widget _buildVCustomContentBaseSteps(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: vCustomContentBasicStepsListData,
              direction: GMStepsDirection.vertical,
              activeIndex: 1,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> hReadOnlyStepsListData = [
    GMStepsItemData(title: 'Filish', content: 'content'),
    GMStepsItemData(title: 'Process', content: 'content'),
    GMStepsItemData(title: 'Default', content: 'content'),
    GMStepsItemData(title: 'Default', content: 'content'),
  ];
  /// 水平自定义内容基本步骤条
  @Demo(group: 'steps')
  Widget _buildHReadOnlySteps(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: hReadOnlyStepsListData,
              readOnly: true,
            ),
          )
        ],
      ),
    );
  }


  List<GMStepsItemData> vReadOnlyStepsListData = [
    GMStepsItemData(title: 'Filish', content: 'Customize content'),
    GMStepsItemData(title: 'Process', content: 'Customize content'),
    GMStepsItemData(title: 'Default', content: 'Customize content'),
    GMStepsItemData(title: 'Default', content: 'Customize content'),
  ];
  /// 垂直自定义内容基本步骤条
  @Demo(group: 'steps')
  Widget _buildVReadOnlySteps(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: vReadOnlyStepsListData,
              direction: GMStepsDirection.vertical,
              activeIndex: 0,
              readOnly: true,
            ),
          )
        ],
      ),
    );
  }

  List<GMStepsItemData> vCustomizeStepsListData = [
    GMStepsItemData(title: 'Selected', content: ''),
    GMStepsItemData(title: 'Selected', content: ''),
    GMStepsItemData(title: 'Selected', content: ''),
    GMStepsItemData(title: 'Please Selected', content: ''),
  ];
  /// Vertical Customize Steps 垂直自定义步骤条
  @Demo(group: 'steps')
  Widget _buildVCustomizeSteps(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GMSteps(
              steps: vCustomizeStepsListData,
              direction: GMStepsDirection.vertical,
              simple: true,
              activeIndex: 3,
              verticalSelect: true,
            ),
          )
        ],
      ),
    );
  }

}
