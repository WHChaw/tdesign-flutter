import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';
import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class GMCellPage extends StatelessWidget {
  const GMCellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: GMTheme.of(context).grayColor2,
        child: ExamplePage(
          title: tdTitle(context),
          desc: '一行内容/功能的垂直排列方式。一行项目左侧为主要内容展示区域，右侧可增加更多操作内容。',
          exampleCodeGroup: 'cell',
          children: [
            ExampleModule(title: '组件类型', children: [
              ExampleItem(
                ignoreCode: true,
                desc: '单行单元格',
                center: false,
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildSimple);
                },
              ),
              ExampleItem(
                ignoreCode: true,
                desc: '多行单元格',
                center: false,
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildDesSimple);
                },
              ),
            ]),
            ExampleModule(title: '组件样式', children: [
              ExampleItem(
                ignoreCode: true,
                desc: '卡片单元格',
                center: false,
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildCard);
                },
              ),
            ]),
          ],
          test: [
            ExampleItem(
              ignoreCode: true,
              desc: '自定义内边距-padding',
              center: false,
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildPadding);
              },
            ),
          ],
        ));
  }
}

@Demo(group: 'cell')
Widget _buildSimple(BuildContext context) {
  return const GMCellGroup(
    cells: [
      GMCell(arrow: true, title: '单行标题'),
      GMCell(arrow: true, title: '单行标题', required: true),
      GMCell(arrow: true, title: '单行标题', noteWidget: GMBadge(GMBadgeType.message, count: '8')),
      GMCell(arrow: false, title: '单行标题', rightIconWidget: GMSwitch(isOn: true)),
      GMCell(arrow: true, title: '单行标题', note: '辅助信息'),
      GMCell(arrow: true, title: '单行标题', leftIcon: GMIcons.lock_on),
      GMCell(arrow: false, title: '单行标题'),
    ],
  );
}

@Demo(group: 'cell')
Widget _buildDesSimple(BuildContext context) {
  return const GMCellGroup(
    cells: [
      GMCell(arrow: true, title: '单行标题', description: '一段很长很长的内容文字'),
      GMCell(arrow: true, title: '单行标题', description: '一段很长很长的内容文字', required: true),
      GMCell(
          arrow: true, title: '单行标题', description: '一段很长很长的内容文字', noteWidget: GMBadge(GMBadgeType.message, count: '8')),
      GMCell(arrow: false, title: '单行标题', description: '一段很长很长的内容文字', rightIconWidget: GMSwitch(isOn: true)),
      GMCell(arrow: true, title: '单行标题', description: '一段很长很长的内容文字', note: '辅助信息'),
      GMCell(arrow: true, title: '单行标题', description: '一段很长很长的内容文字一段很长很长的内容文字一段很长很长的内', leftIcon: GMIcons.lock_on),
      GMCell(arrow: false, title: '单行标题', description: '一段很长很长的内容文字一段很长很长的内容文字一段很长很长的内'),
      GMCell(arrow: false, title: '多行高度不定，长文本自动换行，该选项的描述是一段很长的内容', description: '一段很长很长的内容文字一段很长很长的内容文字一段很长很长的内'),
      GMCell(
        arrow: true,
        title: '多行带头像',
        description: '一段很长很长的内容文字',
        image: AssetImage('assets/img/td_avatar_1.png'),
      ),
      // NetworkImage('https://tdesign.gtimg.com/mobile/demos/avatar1.png')),
      GMCell(
        arrow: true,
        title: '多行带图片',
        description: '一段很长很长的内容文字',
        image: AssetImage('assets/img/image.png'),
        imageCircle: 8,
      ),
    ],
  );
}

@Demo(group: 'cell')
Widget _buildCard(BuildContext context) {
  return const GMCellGroup(
    theme: GMCellGroupTheme.cardTheme,
    cells: [
      GMCell(arrow: true, title: '单行标题'),
      GMCell(arrow: true, title: '单行标题', required: true),
      GMCell(arrow: true, title: '单行标题'),
    ],
  );
}

@Demo(group: 'cell')
Widget _buildPadding(BuildContext context) {
  var style = GMCellStyle.cellStyle(context);
  style.padding = const EdgeInsets.all(30);
  return GMCellGroup(
    theme: GMCellGroupTheme.cardTheme,
    cells: [
      GMCell(arrow: true, title: 'padding-all-30', style: style,),
    ],
  );
}

// @Demo(group: 'cell')
// Widget _buildBorder(BuildContext context) {
//   return const GMCellGroup(
//     theme: GMCellGroupTheme.cardTheme,
//     bordered: true,
//     cells: [
//       GMCell(arrow: true, title: '单行标题'),
//       GMCell(arrow: true, title: '单行标题', required: true),
//       GMCell(arrow: true, title: '单行标题'),
//     ],
//   );
// }

// @Demo(group: 'cell')
// Widget _buildTitle(BuildContext context) {
//   var style = GMCellStyle.cellStyle(context);
//   style.leftIconColor = GMTheme.of(context).fontGyColor1;
//   return GMCellGroup(
//     title: '标题',
//     style: style,
//     cells: const [
//       GMCell(title: 'item', leftIcon: GMIcons.app),
//       GMCell(title: 'item', leftIcon: GMIcons.app),
//       GMCell(title: 'item', leftIcon: GMIcons.app),
//     ],
//   );
// }
