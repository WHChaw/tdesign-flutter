import 'package:flutter/material.dart';
import '../../../gmdesign_flutter.dart';

/// Tag展示类型
enum GMTagTheme {
  /// 默认
  defaultTheme,

  /// 常规
  primary,

  /// 警告
  warning,

  /// 危险
  danger,

  /// 成功
  success,
}

/// 标签尺寸
enum GMTagSize { extraLarge, large, medium, small, custom }

/// 标签形状
enum GMTagShape { square, round, mark }

/// 标签样式
class GMTagStyle {
  GMTagStyle(
      {this.context,
      this.textColor,
      this.backgroundColor,
      this.font,
      this.fontWeight,
      this.border = 0,
      this.borderColor,
      this.borderRadius});

  /// 上下文，方便获取主题内容
  BuildContext? context;

  /// 文字颜色
  Color? textColor;

  /// 背景颜色
  Color? backgroundColor;

  /// 边框颜色
  Color? borderColor;

  /// 圆角
  BorderRadiusGeometry? borderRadius;

  /// 字体尺寸
  Font? font;

  /// 字体粗细
  FontWeight? fontWeight;

  /// 线框粗细
  double border = 0;

  /// 字体颜色，与属性不同名，方便子类自定义处理
  Color get getTextColor => textColor ?? GMTheme.of(context).fontWhColor1;

  /// 背景颜色，与属性不同名，方便子类自定义处理
  Color get getBackgroundColor =>
      backgroundColor ?? GMTheme.of(context).brandNormalColor;

  /// 线框颜色，与属性不同名，方便子类自定义处理
  Color get getBorderColor => borderColor ?? Colors.transparent;

  /// 圆角，，与属性不同名，方便子类自定义处理
  BorderRadiusGeometry get getBorderRadius =>
      borderRadius ?? BorderRadius.circular(0);

  /// 根据主题生成填充Tag样式
  GMTagStyle.generateFillStyleByTheme(
      BuildContext context, GMTagTheme? theme, bool light, GMTagShape shape) {
    this.context = context;
    switch (theme) {
      case GMTagTheme.primary:
        textColor = light
            ? GMTheme.of(context).brandNormalColor
            : GMTheme.of(context).whiteColor1;
        backgroundColor = light
            ? GMTheme.of(context).brandLightColor
            : GMTheme.of(context).brandNormalColor;
        break;
      case GMTagTheme.warning:
        textColor = light
            ? GMTheme.of(context).warningNormalColor
            : GMTheme.of(context).whiteColor1;
        backgroundColor = light
            ? GMTheme.of(context).warningLightColor
            : GMTheme.of(context).warningNormalColor;
        break;
      case GMTagTheme.danger:
        textColor = light
            ? GMTheme.of(context).errorNormalColor
            : GMTheme.of(context).whiteColor1;
        backgroundColor = light
            ? GMTheme.of(context).errorLightColor
            : GMTheme.of(context).errorNormalColor;
        break;
      case GMTagTheme.success:
        textColor = light
            ? GMTheme.of(context).successNormalColor
            : GMTheme.of(context).whiteColor1;
        backgroundColor = light
            ? GMTheme.of(context).successLightColor
            : GMTheme.of(context).successNormalColor;
        break;
      case GMTagTheme.defaultTheme:
      default:
        textColor = GMTheme.of(context).fontGyColor1;
        backgroundColor = light
            ? GMTheme.of(context).grayColor1
            : GMTheme.of(context).grayColor3;
    }
    switch(shape){
      case GMTagShape.square:
        borderRadius = BorderRadius.circular(GMTheme.of(context).radiusSmall);
        break;
      case GMTagShape.round:
        borderRadius = BorderRadius.circular(GMTheme.of(context).radiusRound);
        break;
      case GMTagShape.mark:
        borderRadius = BorderRadius.only(topRight:Radius.circular(GMTheme.of(context).radiusRound),bottomRight: Radius.circular(GMTheme.of(context).radiusRound));
        break;
    }
    borderColor = backgroundColor;
  }

  /// 根据主题生成描边Tag样式
  GMTagStyle.generateOutlineStyleByTheme(
      BuildContext context, GMTagTheme? theme, bool light, GMTagShape shape) {
    this.context = context;
    switch (theme) {
      case GMTagTheme.primary:
        borderColor = GMTheme.of(context).brandNormalColor;
        textColor = GMTheme.of(context).brandNormalColor;
        backgroundColor = light
            ? GMTheme.of(context).brandLightColor
            : GMTheme.of(context).whiteColor1;
        break;
      case GMTagTheme.warning:
        borderColor = GMTheme.of(context).warningNormalColor;
        textColor = GMTheme.of(context).warningNormalColor;
        backgroundColor = light
            ? GMTheme.of(context).warningLightColor
            : GMTheme.of(context).whiteColor1;
        break;
      case GMTagTheme.danger:
        borderColor = GMTheme.of(context).errorNormalColor;
        textColor = GMTheme.of(context).errorNormalColor;
        backgroundColor = light
            ? GMTheme.of(context).errorLightColor
            : GMTheme.of(context).whiteColor1;
        break;
      case GMTagTheme.success:
        borderColor = GMTheme.of(context).successNormalColor;
        textColor = GMTheme.of(context).successNormalColor;
        backgroundColor = light
            ? GMTheme.of(context).successLightColor
            : GMTheme.of(context).whiteColor1;
        break;
      case GMTagTheme.defaultTheme:
      default:
        borderColor = GMTheme.of(context).fontGyColor4;
        textColor = GMTheme.of(context).fontGyColor1;
        backgroundColor = light
            ? GMTheme.of(context).grayColor1
            : GMTheme.of(context).whiteColor1;
    }
    switch(shape){
      case GMTagShape.square:
        borderRadius = BorderRadius.circular(GMTheme.of(context).radiusSmall);
        break;
      case GMTagShape.round:
        borderRadius = BorderRadius.circular(GMTheme.of(context).radiusRound);
        break;
      case GMTagShape.mark:
        borderRadius = BorderRadius.only(topRight:Radius.circular(GMTheme.of(context).radiusRound),bottomRight: Radius.circular(GMTheme.of(context).radiusRound));
        break;
    }
    border = 1;
  }

  /// 根据主题生成禁用Tag样式
  GMTagStyle.generateDisableSelectStyle(
      BuildContext context, bool isOutline , GMTagShape shape) {

    borderColor = GMTheme.of(context).grayColor4;
    textColor = GMTheme.of(context).fontGyColor4;
    backgroundColor = GMTheme.of(context).grayColor2;
    switch(shape){
      case GMTagShape.square:
        borderRadius = BorderRadius.circular(GMTheme.of(context).radiusSmall);
        break;
      case GMTagShape.round:
        borderRadius = BorderRadius.circular(GMTheme.of(context).radiusRound);
        break;
      case GMTagShape.mark:
        borderRadius = BorderRadius.only(topRight:Radius.circular(GMTheme.of(context).radiusRound),bottomRight: Radius.circular(GMTheme.of(context).radiusRound));
        break;
    }
    border = isOutline ? 1 : 0;
  }
}
