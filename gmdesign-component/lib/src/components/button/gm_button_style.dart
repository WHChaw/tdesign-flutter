import 'package:flutter/material.dart';

import '../../../gmdesign_flutter.dart';

/// GMButton按钮样式
class GMButtonStyle {
  /// 背景颜色
  Color? backgroundColor;
  /// 边框颜色
  Color? frameColor;
  /// 文字颜色
  Color? textColor;
  /// 边框宽度
  double? frameWidth;
  /// 自定义圆角
  BorderRadiusGeometry? radius;

  GMButtonStyle(
      {this.backgroundColor,
      this.frameColor,
      this.textColor,
      this.frameWidth,
      this.radius});

  /// 生成不同主题的填充按钮样式
  GMButtonStyle.generateFillStyleByTheme(
      BuildContext context, GMButtonTheme? theme, GMButtonStatus status) {
    switch (theme) {
      case GMButtonTheme.primary:
        textColor = GMTheme.of(context).fontWhColor1;
        backgroundColor = _getBrandColor(context, status);
        break;
      case GMButtonTheme.danger:
        textColor = GMTheme.of(context).fontWhColor1;
        backgroundColor = _getErrorColor(context, status);
        break;
      case GMButtonTheme.light:
        textColor = _getBrandColor(context, status);
        backgroundColor = _getLightColor(context, status);
        break;
      case GMButtonTheme.defaultTheme:
      default:
        textColor = _getDefaultTextColor(context, status);
        backgroundColor = _getDefaultBgColor(context, status);
    }
    frameColor = backgroundColor;
  }

  /// 生成不同主题的描边按钮样式
  GMButtonStyle.generateOutlineStyleByTheme(
      BuildContext context, GMButtonTheme? theme, GMButtonStatus status) {
    switch (theme) {
      case GMButtonTheme.primary:
        textColor = _getBrandColor(context, status);
        backgroundColor = status == GMButtonStatus.active ? GMTheme.of(context).grayColor3 : GMTheme.of(context).whiteColor1;
        frameColor = textColor;
        break;
      case GMButtonTheme.danger:
        textColor = _getErrorColor(context, status);
        backgroundColor = status == GMButtonStatus.active ? GMTheme.of(context).grayColor3 : GMTheme.of(context).whiteColor1;
        frameColor = textColor;
        break;
      case GMButtonTheme.light:
        textColor = _getBrandColor(context, status);
        backgroundColor = _getLightColor(context, status);
        frameColor = textColor;
        break;
      case GMButtonTheme.defaultTheme:
      default:
        textColor = _getDefaultTextColor(context, status);
        backgroundColor = _getOutlineDefaultBgColor(context, status);
        frameColor = GMTheme.of(context).grayColor4;
    }
    frameWidth = 1;
  }

  /// 生成不同主题的文本按钮样式
  GMButtonStyle.generateTextStyleByTheme(
      BuildContext context, GMButtonTheme? theme, GMButtonStatus status) {
    switch (theme) {
      case GMButtonTheme.primary:
        textColor = _getBrandColor(context, status);
        backgroundColor = status == GMButtonStatus.active ? GMTheme.of(context).grayColor3 : Colors.transparent;
        break;
      case GMButtonTheme.danger:
        textColor = _getErrorColor(context, status);
        backgroundColor = status == GMButtonStatus.active ? GMTheme.of(context).grayColor3 : Colors.transparent;
        break;
      case GMButtonTheme.light:
        textColor = _getBrandColor(context, status);
        backgroundColor = status == GMButtonStatus.active ? GMTheme.of(context).grayColor3 : Colors.transparent;
        break;
      case GMButtonTheme.defaultTheme:
      default:
        textColor = _getDefaultTextColor(context, status);
        backgroundColor = status == GMButtonStatus.active ? GMTheme.of(context).grayColor3 : Colors.transparent;
    }
    frameColor = backgroundColor;
  }

  /// 生成不同主题的幽灵按钮样式
  GMButtonStyle.generateGhostStyleByTheme(
      BuildContext context, GMButtonTheme? theme, GMButtonStatus status) {
    switch (theme) {
      case GMButtonTheme.primary:
        textColor = status == GMButtonStatus.disable ? GMTheme.of(context).fontWhColor4 : _getBrandColor(context, status);
        break;
      case GMButtonTheme.danger:
        textColor = status == GMButtonStatus.disable ? GMTheme.of(context).fontWhColor4 :_getErrorColor(context, status);
        break;
      case GMButtonTheme.light:
        textColor = status == GMButtonStatus.disable ? GMTheme.of(context).fontWhColor4 :_getBrandColor(context, status);
        break;
      case GMButtonTheme.defaultTheme:
      default:
        switch(status){
          case GMButtonStatus.active:
            textColor =  GMTheme.of(context).fontWhColor2;
            break;
          case GMButtonStatus.disable:
            textColor =  GMTheme.of(context).fontWhColor4;
            break;
          default:
            textColor = GMTheme.of(context).fontWhColor1;
        }
    }
    backgroundColor = Colors.transparent;
    frameColor = textColor;
    frameWidth = 1;
  }

  Color _getBrandColor(BuildContext context, GMButtonStatus status) {
    switch(status){
      case GMButtonStatus.defaultState:
        return GMTheme.of(context).brandNormalColor;
      case GMButtonStatus.active:
        return GMTheme.of(context).brandClickColor;
      case GMButtonStatus.disable:
        return GMTheme.of(context).brandDisabledColor;
    }
  }

  Color _getLightColor(BuildContext context, GMButtonStatus status) {
    switch(status){
      case GMButtonStatus.defaultState:
      case GMButtonStatus.disable:
        return GMTheme.of(context).brandLightColor;
      case GMButtonStatus.active:
        return GMTheme.of(context).brandFocusColor;
    }
  }

  Color _getErrorColor(BuildContext context, GMButtonStatus status) {
    switch(status){
      case GMButtonStatus.defaultState:
        return GMTheme.of(context).errorNormalColor;
      case GMButtonStatus.active:
        return GMTheme.of(context).errorClickColor;
      case GMButtonStatus.disable:
        return GMTheme.of(context).errorDisabledColor;
    }
  }

  Color _getDefaultBgColor(BuildContext context, GMButtonStatus status) {
    switch(status){
      case GMButtonStatus.defaultState:
        return GMTheme.of(context).grayColor3;
      case GMButtonStatus.active:
        return GMTheme.of(context).grayColor5;
      case GMButtonStatus.disable:
        return GMTheme.of(context).grayColor2;
    }
  }

  Color _getDefaultTextColor(BuildContext context, GMButtonStatus status) {
    switch(status){
      case GMButtonStatus.defaultState:
      case GMButtonStatus.active:
        return GMTheme.of(context).fontGyColor1;
      case GMButtonStatus.disable:
        return GMTheme.of(context).fontGyColor4;
    }
  }

  Color _getOutlineDefaultBgColor(BuildContext context, GMButtonStatus status) {
    switch(status){
      case GMButtonStatus.defaultState:
        return GMTheme.of(context).whiteColor1;
      case GMButtonStatus.active:
        return GMTheme.of(context).grayColor3;
      case GMButtonStatus.disable:
        return GMTheme.of(context).grayColor2;
    }
  }

}
