import 'package:flutter/material.dart';

import '../../../gmdesign_flutter.dart';

/// 单元格组件样式
class GMCellStyle {
  GMCellStyle({
    this.leftIconColor,
    this.titleStyle,
    this.requiredStyle,
    this.descriptionStyle,
    this.noteStyle,
    this.arrowColor,
    this.borderedColor,
    this.groupBorderedColor,
    this.backgroundColor,
    this.padding
  });

  /// 左侧图标颜色
  Color? leftIconColor;

  /// 右侧图标颜色
  Color? rightIconColor;

  /// 标题文字样式
  TextStyle? titleStyle;

  /// 必填星号文字样式
  TextStyle? requiredStyle;

  /// 内容描述文字样式
  TextStyle? descriptionStyle;

  /// 说明文字样式
  TextStyle? noteStyle;

  /// 箭头颜色
  Color? arrowColor;

  /// 单元格边框颜色
  Color? borderedColor;

  /// 单元格组边框颜色
  Color? groupBorderedColor;

  /// 默认状态背景颜色
  Color? backgroundColor;

  /// 点击状态背景颜色
  Color? clickBackgroundColor;

  /// 单元组标题文字样式
  TextStyle? groupTitleStyle;

  /// 单元格内边距
  EdgeInsets? padding;

  /// 生成单元格默认样式
  GMCellStyle.cellStyle(BuildContext context) {
    backgroundColor = Colors.white;
    clickBackgroundColor = GMTheme.of(context).grayColor1;
    leftIconColor = GMTheme.of(context).brandColor7;
    rightIconColor = GMTheme.of(context).brandColor7;
    titleStyle = TextStyle(
      color: GMTheme.of(context).fontGyColor1,
      fontSize: GMTheme.of(context).fontBodyLarge?.size ?? 16,
      height: GMTheme.of(context).fontBodyLarge?.height ?? 24,
      fontWeight: FontWeight.w400,
    );
    requiredStyle = titleStyle!.copyWith(color: GMTheme.of(context).errorColor6);
    descriptionStyle = TextStyle(
      color: GMTheme.of(context).fontGyColor2,
      fontSize: GMTheme.of(context).fontBodyMedium?.size ?? 14,
      height: GMTheme.of(context).fontBodyMedium?.height ?? 22,
      fontWeight: FontWeight.w400,
    );
    noteStyle = titleStyle!.copyWith(color: GMTheme.of(context).fontGyColor3);
    arrowColor = GMTheme.of(context).fontGyColor3;

    groupBorderedColor = GMTheme.of(context).grayColor3;
    borderedColor = GMTheme.of(context).grayColor3;
    groupTitleStyle = TextStyle(
      color: GMTheme.of(context).fontGyColor1,
      fontSize: GMTheme.of(context).fontTitleLarge?.size ?? 18,
      height: GMTheme.of(context).fontTitleLarge?.height ?? 26,
      fontWeight: GMTheme.of(context).fontTitleLarge?.fontWeight ?? FontWeight.w600,
    );

    padding = EdgeInsets.all(GMTheme.of(context).spacer16);
  }
}
