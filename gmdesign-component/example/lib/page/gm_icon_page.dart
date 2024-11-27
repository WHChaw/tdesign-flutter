import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../../base/example_widget.dart';
import '../annotation/demo.dart';


class GMIconPage extends StatefulWidget {
  const GMIconPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GMIconPageState();
}

class _GMIconPageState extends State<GMIconPage> {

  bool showBorder = false;

  @override
  Widget build(BuildContext context) {
    return ExamplePage(title: tdTitle(),
        exampleCodeGroup: 'icon',
        children: [
        ExampleModule(title: 'icon示例',
        children: [
          ExampleItem(
              desc: 'icon数量: ${GMIcons.all.length}',
              builder: _showAllIcons)
    ])
        ]);

  }

  @Demo(group: 'icon')
  Widget _showAllIcons(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Wrap(
        children: [
          Container(
            child: GMButton(text: showBorder? '隐藏边框':'显示边框',
              shape: GMButtonShape.filled,
              onTap: (){
                setState(() {
                  showBorder = !showBorder;
                });
              },),
            margin: const EdgeInsets.only(bottom: 16),
          ),
          for (var iconData in GMIcons.all.values) SizedBox(
            height: 100,
            width: 175,

            child: Column(
              children: [
                Container(
                  color: showBorder ? GMTheme.of(context).brandDisabledColor : Colors.transparent,
                  child: Icon(iconData),
                ),
                GMText(iconData.name)
              ],
            ),
          )
        ],
      ),
    );
  }
}
