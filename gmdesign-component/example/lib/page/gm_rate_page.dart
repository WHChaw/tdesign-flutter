import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../annotation/demo.dart';
import '../base/example_widget.dart';

///
/// GMRadio演示
///
class GMRatePage extends StatefulWidget {
  const GMRatePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GMRatePageState();
  }
}

class GMRatePageState extends State<GMRatePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
        title: tdTitle(),
        desc: '用于对某行为/事物进行打分。',
        exampleCodeGroup: 'rate',
        backgroundColor: GMTheme.of(context).grayColor2,
        children: [
          ExampleModule(title: '组件类型', children: [
            ExampleItem(desc: '实心评分', builder: _buildFilledRate),
            ExampleItem(desc: '自定义评分', builder: _buildCusRate),
            ExampleItem(desc: '自定义评分数量', builder: _buildNumRate),
            ExampleItem(desc: '带描述评分', builder: _buildMsgRate),
            ExampleItem(desc: '评分弹框位置', builder: _buildDRate),
          ]),
          ExampleModule(title: '组件状态', children: [
            ExampleItem(desc: '只可选全星时', builder: _buildFullRate),
            ExampleItem(desc: '可选半星时', builder: _buildHalfRate),
          ]),
          ExampleModule(title: '组件样式', children: [
            ExampleItem(desc: '评分大小', builder: _buildSizeRate),
            ExampleItem(desc: '设置评分颜色', builder: _buildColorRate),
          ]),
          ExampleModule(title: '特殊样式', children: [
            ExampleItem(desc: '竖向带描述评分', builder: _buildOtherRate),
          ]),
        ]);
  }

  @Demo(group: 'rate')
  Widget _buildFilledRate(BuildContext context) {
    return const GMCell(title: '实心评分', noteWidget: GMRate(value: 3));
  }

  @Demo(group: 'rate')
  Widget _buildCusRate(BuildContext context) {
    return const GMCell(title: '自定义评分', noteWidget: GMRate(value: 3, icon: [GMIcons.thumb_up]));
  }

  @Demo(group: 'rate')
  Widget _buildNumRate(BuildContext context) {
    return const GMCell(
        title: '自定义评分数量',
        noteWidget: GMRate(
          value: 2,
          count: 3,
        ));
  }

  @Demo(group: 'rate')
  Widget _buildMsgRate(BuildContext context) {
    return Column(children: const [
      GMCell(title: '带描述评分', noteWidget: GMRate(value: 3, showText: true, texts: ['1分', '2分', '3分', '4分', '5分'])),
      SizedBox(height: 16),
      GMCell(title: '带描述评分', noteWidget: GMRate(value: 3, showText: true))
    ]);
  }

  @Demo(group: 'rate')
  Widget _buildDRate(BuildContext context) {
    return Column(children: const [
      GMCell(title: '顶部显示', noteWidget: GMRate(placement: PlacementEnum.top)),
      SizedBox(height: 16),
      GMCell(title: '不显示', noteWidget: GMRate(placement: PlacementEnum.none)),
      SizedBox(height: 16),
      GMCell(title: '底部显示', noteWidget: GMRate(placement: PlacementEnum.bottom)),
    ]);
  }

  @Demo(group: 'rate')
  Widget _buildFullRate(BuildContext context) {
    return const GMCell(title: '点击活滑动', noteWidget: GMRate(value: 3));
  }

  @Demo(group: 'rate')
  Widget _buildHalfRate(BuildContext context) {
    return const GMCell(title: '点击活滑动', noteWidget: GMRate(value: 3, allowHalf: true));
  }

  @Demo(group: 'rate')
  Widget _buildSizeRate(BuildContext context) {
    return Column(children: const [
      GMCell(title: '默认尺寸24', noteWidget: GMRate(value: 3)),
      SizedBox(height: 16),
      GMCell(title: '小尺寸20', noteWidget: GMRate(value: 3, size: 20)),
    ]);
  }

  @Demo(group: 'rate')
  Widget _buildColorRate(BuildContext context) {
    return Column(children: const [
      GMCell(
          title: '填充评分',
          noteWidget: GMRate(
            value: 2.5,
            allowHalf: true,
            color: [Color(0xFFFFC51C), Color(0xFFE8E8E8)],
          )),
      SizedBox(height: 16),
      GMCell(title: '线描评分', noteWidget: GMRate(value: 2.5, allowHalf: true, color: [Color(0xFF00A870)])),
    ]);
  }

  @Demo(group: 'rate')
  Widget _buildOtherRate(BuildContext context) {
    var texts = ['非常糟糕', '有些糟糕', '可以尝试', '可以前往', '推荐前往'];
    return Container(
      width: double.infinity,
      child: Center(
        child: GMRate(
        value: 2,
        size: 30,
        showText: true,
        // texts: ['非常糟糕', '有些糟糕', '可以尝试', '可以前往', '推荐前往'],
        direction: Axis.vertical,
        // mainAxisAlignment: MainAxisAlignment.center,
        // textWidth: 64,
        builderText: (context, value) {
          return value == 0
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(top: GMTheme.of(context).spacer8),
                  child: GMText(
                    texts[(value - 1).toInt()],
                    font: GMTheme.of(context).fontTitleMedium,
                    textColor: GMTheme.of(context).warningColor5,
                  ),
                );
        },
      ),
      ),
      
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
    );
  }
}