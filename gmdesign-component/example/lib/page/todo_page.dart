import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../base/example_widget.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollbarTheme(
            data: ScrollbarThemeData(
                trackVisibility: MaterialStateProperty.all(true)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GMNavBar(
                  title: 'TODO',
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    child: const GMText('欢迎使用TDesign，该组件已在规划中，请关注TDesign项目最新动态'),
                  ),
                )
              ],
            )));
  }
}
