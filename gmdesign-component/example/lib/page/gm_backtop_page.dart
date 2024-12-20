import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../annotation/demo.dart';
import '../base/example_widget.dart';


class GMBackTopPage extends StatefulWidget {
  const GMBackTopPage({Key? key}) : super(key: key);

  @override
  State<GMBackTopPage> createState() => _GMBackTopPageState();
}

class _GMBackTopPageState extends State<GMBackTopPage> {
  ScrollController controller = ScrollController();
  bool showBackTop = false;
  GMBackTopStyle style = GMBackTopStyle.circle;

  @override
  void initState() {
    super.initState();
    controller.addListener(listenCallback);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(listenCallback);
  }

  void listenCallback() {
    if (controller.offset >= 100) {
      if (!showBackTop) {
        setState(() {
          showBackTop = true;
        });
      }
    } else {
      if (showBackTop) {
        setState(() {
          showBackTop = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
        scrollController: controller,
        title: tdTitle(),
        desc: '用于当页面过长往下滑动时，帮助用户快速回到页面顶部。',
        exampleCodeGroup: 'backtop',
        floatingActionButton: Stack(
          clipBehavior: Clip.none,
          children: [
            Visibility(
                visible: showBackTop,
                child: style == GMBackTopStyle.halfCircle
                    ? Positioned(
                        right: -16,
                        bottom: 10,
                        child: GMBackTop(
                          controller: controller,
                          theme: GMBackTopTheme.dark,
                          showText: true,
                          style: style,
                        ))
                    : GMBackTop(
                        controller: controller,
                        theme: GMBackTopTheme.dark,
                        showText: true,
                        style: style,
                      ))
          ],
        ),
        children: [
          ExampleModule(title: '组件类型', children: [
            ExampleItem(desc: '圆形返回顶部', builder: _buildCircleBackTop),
            ExampleItem(desc: '半圆形返回顶部', builder: _buildHalfCircleBackTop),
          ])
        ]);
  }

  @Demo(group: 'backtop')
  Widget _buildCircleBackTop(BuildContext context) {
    return getCustomButton(context, '圆形返回顶部', () {
      setState(() {
        showBackTop = true;
        if (controller.hasClients) {
          controller.jumpTo(500);
        }
        style = GMBackTopStyle.circle;
      });
    });
  }

  @Demo(group: 'backtop')
  Widget _buildHalfCircleBackTop(BuildContext context) {
    return Column(
      children: [
        getCustomButton(context, '半圆形返回顶部', () {
          setState(() {
            showBackTop = true;
            if (controller.hasClients) {
              controller.jumpTo(500);
            }
            style = GMBackTopStyle.halfCircle;
          });
        }),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: Wrap(
            spacing: 16,
            runSpacing: 24,
            children: [
              getDemoBox(context),
              getDemoBox(context),
              getDemoBox(context),
              getDemoBox(context),
              getDemoBox(context),
              getDemoBox(context),
            ],
          ),
        )
      ],
    );
  }

  Widget getCustomButton(
      BuildContext context, String text, void Function() onTap) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GMButton(
          text: text,
          width: MediaQuery.of(context).size.width - 16 * 2,
          size: GMButtonSize.large,
          type: GMButtonType.outline,
          shape: GMButtonShape.rectangle,
          theme: GMButtonTheme.primary,
          onTap: onTap,
        ));
  }

  Widget getDemoBox(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 163,
          height: 163,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 163,
          height: 16,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(3)),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            width: 100,
            height: 16,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(3))),
      ],
    );
  }
}
