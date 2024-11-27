import 'package:flutter/material.dart';

import '../../../gmdesign_flutter.dart';


enum GMBackTopTheme {
  light, // 明亮主题
  dark // 暗黑主题
}

enum GMBackTopStyle {
  circle, // 圆形
  halfCircle, // 半圆形
}

class GMBackTop extends StatefulWidget {
  const GMBackTop({
    Key? key,
    this.controller,
    this.theme = GMBackTopTheme.light,
    this.style = GMBackTopStyle.circle,
    this.showText = false,
    this.onClick,
  }) : super(key: key);

  /// 页面滚动的控制器
  final ScrollController? controller;

  /// 主题
  final GMBackTopTheme theme;

  /// 样式，圆形和半圆
  final GMBackTopStyle style;

  /// 是否展示文字
  final bool showText;

  /// 按钮点击事件
  final VoidCallback? onClick;

  @override
  State<GMBackTop> createState() => _GMBackTopState();
}

class _GMBackTopState extends State<GMBackTop> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.controller != null && widget.controller!.hasClients) {
          widget.controller!.animateTo(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        }

        if (widget.onClick != null) {
          widget.onClick!();
        }
      },
      child: widget.style == GMBackTopStyle.circle
          ? _buildCircleWidget(context)
          : _buildHalfCircleWidget(context),
    );
  }

  Widget _buildCircleWidget(BuildContext context) {
    var color = widget.theme == GMBackTopTheme.dark
        ? Colors.white
        : const Color.fromRGBO(0, 0, 0, 0.9);

    return Container(
      width: 48,
      height: 48,
      padding: EdgeInsets.symmetric(
          vertical: widget.showText ? 6 : 13, horizontal: 13),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          border:Border.all(color: widget.theme== GMBackTopTheme.dark?Color.fromRGBO(94, 94, 94, 1):Color.fromRGBO(220, 220, 220, 1),width: 0.5),
          color: widget.theme == GMBackTopTheme.light
              ? Colors.white
              : GMTheme.of(context).grayColor14),

      child: Center(
          child: Column(
        children: [
          Icon(
            GMIcons.backtop,
            size: 20,
            color: color,
          ),
          Visibility(
            visible: widget.showText,
            child: GMText(
              'TOP',
              style: TextStyle(
                  fontSize: 10, color: color, fontWeight: FontWeight.w600),
            ),
          )
        ],
      )),
    );
  }

  Widget _buildHalfCircleWidget(BuildContext context) {
    var color = widget.theme == GMBackTopTheme.dark
        ? Colors.white
        : const Color.fromRGBO(0, 0, 0, 0.9);

    return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 38),
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              color: widget.theme == GMBackTopTheme.light
                  ? Colors.white
                  : GMTheme.of(context).grayColor14,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(999),
                  bottomLeft: Radius.circular(999)
              ),
              border:Border.all(color: widget.theme== GMBackTopTheme.dark?Color.fromRGBO(94, 94, 94, 1):Color.fromRGBO(220, 220, 220, 1),width: 0.5)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                GMIcons.backtop,
                size: 22,
                color: color,
              ),
              const SizedBox(
                width: 2,
              ),
              Visibility(
                visible: widget.showText,
                child: SizedBox(
                    height: 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GMText(
                          'BACK',
                          style: TextStyle(
                              height: 1.2,
                              fontSize: 10,
                              color: color,
                              fontWeight: FontWeight.w600),
                        ),
                        GMText(
                          'TOP',
                          style: TextStyle(
                              height: 1.2,
                              fontSize: 10,
                              color: color,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
