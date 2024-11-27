
import 'package:flutter/material.dart';

import '../../../gmdesign_flutter.dart';


enum GMFabTheme { primary, defaultTheme, light, danger }

enum GMFabShape {
  circle, // 圆形
  square // 矩形
}

enum GMFabSize {
  large, // 大
  medium, // 中
  small, // 小
  extraSmall // 特小
}

class GMFab extends StatelessWidget {
  const GMFab(
      {Key? key,
      this.theme = GMFabTheme.defaultTheme,
      this.shape = GMFabShape.circle,
      this.size = GMFabSize.large,
      this.text,
      this.onClick,
      this.icon})
      : super(key: key);

  /// 主题
  final GMFabTheme theme;

  /// 形状
  final GMFabShape shape;

  /// 大小
  final GMFabSize size;

  /// 文本
  final String? text;

  /// 图标
  final Icon? icon;

  /// 点击事件
  final VoidCallback? onClick;

  bool get showText => text != null && text != '';

  EdgeInsets getPadding() {
    switch (size) {
      case GMFabSize.large:
        return showText
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12)
            : const EdgeInsets.all(12);
      case GMFabSize.medium:
        return showText
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
            : const EdgeInsets.all(10);
      case GMFabSize.small:
        return showText
            ? const EdgeInsets.symmetric(horizontal: 12, vertical: 5)
            : const EdgeInsets.all(7);
      case GMFabSize.extraSmall:
        return showText
            ? const EdgeInsets.symmetric(horizontal: 8, vertical: 3)
            : const EdgeInsets.all(5);
      default:
        return showText
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12)
            : const EdgeInsets.all(12);
    }
  }

  double getMinWidthOrHeight() {
    switch (size) {
      case GMFabSize.large:
        return 48.0;
      case GMFabSize.medium:
        return 40.0;
      case GMFabSize.small:
        return 32.0;
      case GMFabSize.extraSmall:
        return 28.0;
      default:
        return 48.0;
    }
  }

  Color getBackgroundColor(BuildContext context) {
    switch (theme) {
      case GMFabTheme.primary:
        return GMTheme.of(context).brandColor7;
      case GMFabTheme.defaultTheme:
        return GMTheme.of(context).grayColor3;
      case GMFabTheme.light:
        return GMTheme.of(context).brandColor1;
      case GMFabTheme.danger:
        return GMTheme.of(context).errorColor6;
      default:
        return GMTheme.of(context).grayColor3;
    }
  }

  Color getIconColor(BuildContext context) {
    switch (theme) {
      case GMFabTheme.primary:
        return Colors.white;
      case GMFabTheme.defaultTheme:
        return GMTheme.of(context).fontGyColor1.withOpacity(0.9);
      case GMFabTheme.light:
        return GMTheme.of(context).brandColor7;
      case GMFabTheme.danger:
        return Colors.white;
      default:
        return GMTheme.of(context).fontGyColor1.withOpacity(0.9);
    }
  }

  double getIconSize() {
    switch (size) {
      case GMFabSize.large:
        return 24.0;
      case GMFabSize.medium:
        return 20.0;
      case GMFabSize.small:
        return 18.0;
      case GMFabSize.extraSmall:
        return 18.0;
      default:
        return 24.0;
    }
  }

  double getFontSize() {
    switch (size) {
      case GMFabSize.large:
        return 16.0;
      case GMFabSize.medium:
        return 16.0;
      case GMFabSize.small:
        return 14.0;
      case GMFabSize.extraSmall:
        return 14.0;
      default:
        return 16.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) {
          onClick!();
        }
      },
      child: InkWell(
        child: Container(
          padding: getPadding(),
          decoration: BoxDecoration(
              color: getBackgroundColor(context),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 2.5,
                    spreadRadius:-1.5,
                    color: Colors.black.withOpacity(0.1)),
                BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 5,
                    spreadRadius:0.5,
                    color: Colors.black.withOpacity(0.06)),
                BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 7,
                    spreadRadius:1,
                    color: Colors.black.withOpacity(0.05))
              ],
              borderRadius: shape == GMFabShape.circle
                  ? BorderRadius.circular(24)
                  : BorderRadius.circular(6)),
          height: getMinWidthOrHeight(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon ??
                  Icon(
                    GMIcons.add,
                    size: getIconSize(),
                    color: getIconColor(context),
                  ),
              Visibility(
                  visible: showText,
                  child: const SizedBox(
                    width: 4,
                  )),
              Visibility(
                  visible: showText,
                  child: GMText(
                    text ?? '',
                    style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                        fontSize: getFontSize(),
                        color: getIconColor(context),
                        leadingDistribution: TextLeadingDistribution.even),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
