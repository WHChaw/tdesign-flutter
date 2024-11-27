import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../annotation/demo.dart';
import '../base/example_widget.dart';

///
/// GMRadio演示
///
class GMRadioPage extends StatefulWidget {
  const GMRadioPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GMRadioPageState();
  }
}

class GMRadioPageState extends State<GMRadioPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: tdTitle(),
      exampleCodeGroup: 'radio',
      backgroundColor: const Color(0xfff6f6f6),
      children: [
        ExampleModule(title: '组件类型', children: [
          ExampleItem(desc: '纵向单选框', builder: _verticalRadios),
          ExampleItem(desc: '横向单选框', builder: _horizontalRadios),
        ]),
        ExampleModule(title: '组件状态', children: [
          ExampleItem(desc: '单选框状态', builder: _radioStatus),
        ]),
        ExampleModule(title: '组件样式', children: [
          ExampleItem(desc: '勾选样式', builder: _checkStyle),
          ExampleItem(desc: '勾选显示位置', builder: _checkPosition),
          ExampleItem(desc: '非通栏单选样式', builder: _passThroughStyle),
        ]),
        ExampleModule(title: '特殊样式', children: [
          ExampleItem(desc: '纵向卡片单选框', builder: _verticalCardStyle),
          ExampleItem(desc: '横向卡片单选框', builder: _horizontalCardStyle),
        ]),
      ],
      test: [
        ExampleItem(desc: '横向单选框-显示下划线', builder: _showBottomLine),
        ExampleItem(desc: '横向单选框-自定义下划线', builder: _customBottomLine),
        ExampleItem(desc: '横向单选框-自定义颜色和字体尺寸', builder: _customColorAndFont),
        ExampleItem(desc: '横向单选框-自定义禁用字体颜色', builder: _customDisableColorAndFont),
        ExampleItem(desc: '横向单选框-自定义选框左侧间距', builder: _customRadioLeftSpace),
      ],
    );
  }

  @Demo(group: 'radio')
  Widget _verticalRadios(BuildContext context) {
    return GMRadioGroup(
      selectId: 'index:1',
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var title = '单选';
          var subTitle = '';
          if (index == 2) {
            title = '单选标题多行单选标题多行单选标题多行单选标题多行单选标题多行单选标题多行';
          }
          if (index == 3) {
            subTitle = '描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息';
          }
          return GMRadio(
            id: 'index:$index',
            title: title,
            titleMaxLine: 2,
            subTitleMaxLine: 2,
            subTitle: subTitle,
          );
        },
        itemCount: 4,
      ),
    );
  }

  @Demo(group: 'radio')
  Widget _horizontalRadios(BuildContext context) {
    return GMRadioGroup(
      selectId: 'index:1',
      direction: Axis.horizontal,
      directionalGMRadios: const [
        GMRadio(
          id: '0',
          title: '单选标题',
          radioStyle: GMRadioStyle.circle,
          showDivider: false,
        ),
        GMRadio(
          id: '1',
          title: '单选标题',
          radioStyle: GMRadioStyle.circle,
          showDivider: false,
        ),
        GMRadio(
          id: '2',
          title: '上限四字',
          radioStyle: GMRadioStyle.circle,
          showDivider: false,
        ),
      ],
    );
  }

  @Demo(group: 'radio')
  Widget _radioStatus(BuildContext context) {
    return GMRadioGroup(
      contentDirection: GMContentDirection.right,
      selectId: '0',
      child: Column(
        children: const [
          GMRadio(
            id: '0',
            title: '选项禁用-已选',
            radioStyle: GMRadioStyle.circle,
            enable: false,
          ),
          GMRadio(
            id: '1',
            title: '选项禁用-默认',
            radioStyle: GMRadioStyle.circle,
            enable: false,
          ),
        ],
      ),
    );
  }

  @Demo(group: 'radio')
  Widget _checkStyle(BuildContext context) {
    return Column(
      children: [
        GMRadioGroup(
          radioCheckStyle: GMRadioStyle.check,
          selectId: 'index:0',
          child: const GMRadio(
            id: 'index:0',
            title: '单选',
          ),
        ),
        const SizedBox(
          height: 17,
        ),
        GMRadioGroup(
          radioCheckStyle: GMRadioStyle.hollowCircle,
          selectId: 'index:0',
          child: const GMRadio(
            id: 'index:0',
            title: '单选',
          ),
        )
      ],
    );
  }

  @Demo(group: 'radio')
  Widget _checkPosition(BuildContext context) {
    return Column(
      children: [
        GMRadioGroup(
          contentDirection: GMContentDirection.right,
          selectId: 'index:0',
          child: const GMRadio(
            id: 'index:0',
            title: '单选',
          ),
        ),
        GMRadioGroup(
          contentDirection: GMContentDirection.left,
          selectId: 'index:0',
          child: const GMRadio(
            id: 'index:0',
            title: '单选',
            showDivider: false,
          ),
        )
      ],
    );
  }

  @Demo(group: 'radio')
  Widget _passThroughStyle(BuildContext context) {
    return GMRadioGroup(
      selectId: 'index:0',
      passThrough: true,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var title = '单选';
          return GMRadio(
            id: 'index:$index',
            title: title,
            size: GMCheckBoxSize.large,
          );
        },
        itemCount: 4,
      ),
    );
  }

  @Demo(group: 'radio')
  Widget _verticalCardStyle(BuildContext context) {
    return GMRadioGroup(
      selectId: 'index:1',
      cardMode: true,
      direction: Axis.vertical,
      directionalGMRadios: const [
        GMRadio(
          id: 'index:0',
          title: '单选',
          titleMaxLine: 2,
          subTitleMaxLine: 2,
          subTitle: '描述信息',
          cardMode: true,
        ),
        GMRadio(
          id: 'index:1',
          title: '单选',
          titleMaxLine: 2,
          subTitleMaxLine: 2,
          subTitle: '描述信息',
          cardMode: true,
        ),
        GMRadio(
          id: 'index:2',
          title: '单选',
          titleMaxLine: 2,
          subTitleMaxLine: 2,
          subTitle: '描述信息',
          cardMode: true,
        ),
        GMRadio(
          id: 'index:3',
          title: '单选',
          titleMaxLine: 2,
          subTitleMaxLine: 2,
          subTitle: '描述信息',
          cardMode: true,
        ),
      ],
    );
  }

  @Demo(group: 'radio')
  Widget _horizontalCardStyle(BuildContext context) {
    return GMRadioGroup(
      selectId: 'index:1',
      cardMode: true,
      direction: Axis.horizontal,
      rowCount: 2,
      directionalGMRadios: const [
        GMRadio(
          id: 'index:0',
          title: '单选',
          cardMode: true,
        ),
        GMRadio(
          id: 'index:1',
          title: '单选',
          cardMode: true,
        ),
        GMRadio(
          id: 'index:2',
          title: '单选',
          cardMode: true,
        ),
        GMRadio(
          id: 'index:3',
          title: '单选',
          cardMode: true,
        ),
      ],
    );
  }

  @Demo(group: 'radio')
  Widget _showBottomLine(BuildContext context) {
    return GMRadioGroup(
      selectId: 'index:1',
      direction: Axis.horizontal,
      showDivider: true,
      directionalGMRadios: const [
        GMRadio(
          id: '0',
          title: '单选标题',
          radioStyle: GMRadioStyle.circle,
          showDivider: false,
        ),
        GMRadio(
          id: '1',
          title: '单选标题',
          radioStyle: GMRadioStyle.circle,
          showDivider: false,
        ),
        GMRadio(
          id: '2',
          title: '上限四字',
          radioStyle: GMRadioStyle.circle,
          showDivider: false,
        ),
      ],
    );
  }

  @Demo(group: 'radio')
  Widget _customBottomLine(BuildContext context) {
    return GMRadioGroup(
      selectId: 'index:1',
      direction: Axis.horizontal,
      showDivider: true,
      divider: const GMDivider(
        height: 20,
        color: Colors.red,
      ),
      directionalGMRadios: const [
        GMRadio(
          id: '0',
          title: '单选标题',
          radioStyle: GMRadioStyle.circle,
          showDivider: false,
        ),
        GMRadio(
          id: '1',
          title: '单选标题',
          radioStyle: GMRadioStyle.circle,
          showDivider: false,
        ),
        GMRadio(
          id: '2',
          title: '上限四字',
          radioStyle: GMRadioStyle.circle,
          showDivider: false,
        ),
      ],
    );
  }

  @Demo(group: 'radio')
  Widget _customColorAndFont(BuildContext context) {
    return GMRadioGroup(
      selectId: 'index:1',
      child: ListView(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          GMRadio(
            id: 'index:1',
            title: '单选',
            titleMaxLine: 2,
            subTitleMaxLine: 2,
            selectColor: GMTheme.of(context).errorColor3,
            titleFont: GMTheme.of(context).fontBodySmall,
            subTitleFont: GMTheme.of(context).fontBodyExtraSmall,
          ),
          GMRadio(
            id: 'index:2',
            title: '单选',
            titleMaxLine: 2,
            subTitleMaxLine: 2,
            subTitle: '单选标题多行单选标题多行单选标题多行单选标题多行单选标题多行单选标题多行',
            selectColor: GMTheme.of(context).errorColor3,
            titleFont: GMTheme.of(context).fontBodySmall,
            subTitleFont: GMTheme.of(context).fontBodyExtraSmall,
          ),
          GMRadio(
            id: 'index:3',
            title: '单选',
            titleMaxLine: 2,
            subTitleMaxLine: 2,
            subTitle: '描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息',
            selectColor: GMTheme.of(context).errorColor3,
            titleFont: GMTheme.of(context).fontBodySmall,
            subTitleFont: GMTheme.of(context).fontBodyExtraSmall,
          ),
          GMRadio(
            id: 'index:4',
            title: '单选',
            titleMaxLine: 2,
            subTitleMaxLine: 2,
            subTitle: '单选标题多行单选标题多行单选标题多行单选标题多行单选标题多行单选标题多行',
            selectColor: GMTheme.of(context).errorColor3,
            titleFont: GMTheme.of(context).fontBodySmall,
            subTitleFont: GMTheme.of(context).fontBodyExtraSmall,
            radioStyle: GMRadioStyle.hollowCircle,
          ),
          GMRadio(
            id: 'index:6',
            title: '绿色',
            titleColor: Colors.green,
            titleMaxLine: 2,
            subTitleMaxLine: 2,
            subTitle: '我是蓝色并且有灰色背景',
            subTitleColor: Colors.blue,
            selectColor: GMTheme.of(context).errorColor3,
            titleFont: GMTheme.of(context).fontBodySmall,
            subTitleFont: GMTheme.of(context).fontBodyExtraSmall,
            backgroundColor: GMTheme.of(context).grayColor2,
          ),
          GMRadio(
            id: 'index:5',
            title: '单选',
            titleMaxLine: 2,
            subTitleMaxLine: 2,
            subTitle: '描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息',
            selectColor: GMTheme.of(context).errorColor3,
            titleFont: GMTheme.of(context).fontBodySmall,
            subTitleFont: GMTheme.of(context).fontBodyExtraSmall,
            cardMode: true,
          ),
        ],
      ),
    );
  }

  @Demo(group: 'radio')
  Widget _customDisableColorAndFont(BuildContext context) {
    return GMRadioGroup(
      contentDirection: GMContentDirection.right,
      selectId: '0',
      child: Column(
        children: [
          GMRadio(
            id: '0',
            title: '选项禁用-已选',
            subTitle: '描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息',
            radioStyle: GMRadioStyle.circle,
            enable: false,
            disableColor: GMTheme.of(context).errorColor1,
            titleFont: GMTheme.of(context).fontBodySmall,
            subTitleFont: GMTheme.of(context).fontBodyExtraSmall,
          ),
          GMRadio(
            id: '1',
            title: '选项禁用-默认',
            radioStyle: GMRadioStyle.circle,
            enable: false,
            disableColor: GMTheme.of(context).errorColor1,
            titleFont: GMTheme.of(context).fontBodySmall,
            subTitleFont: GMTheme.of(context).fontBodyExtraSmall,
          ),
        ],
      ),
    );
  }

  @Demo(group: '')
  Widget _customRadioLeftSpace(BuildContext context) {
    return  GMRadio(
        id: '0',
        title: '选项禁用-已选',
        subTitle: '描述信息',
        radioStyle: GMRadioStyle.circle,
        checkBoxLeftSpace: 0,
        disableColor: GMTheme.of(context).errorColor1,
        titleFont: GMTheme.of(context).fontBodySmall,
        subTitleFont: GMTheme.of(context).fontBodyExtraSmall,
    );
  }
}
