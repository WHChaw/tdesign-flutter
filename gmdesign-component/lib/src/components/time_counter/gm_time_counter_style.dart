import 'package:flutter/material.dart';
import '../../../gmdesign_flutter.dart';

/// 计时组件计时方向
enum GMTimeCounterDirection {
  /// 倒计时
  down,
  /// 正向计时
  up
}

/// 计时组件尺寸
enum GMTimeCounterSize {
  /// 小
  small,

  /// 中等
  medium,

  /// 大
  large,
}

/// 计时组件风格
enum GMTimeCounterTheme {
  /// 默认
  defaultTheme,

  /// 圆形
  round,

  /// 方形
  square,
}

/// 计时组件样式
class GMTimeCounterStyle {
  GMTimeCounterStyle({
    this.timeWidth,
    this.timeHeight,
    this.timePadding,
    this.timeMargin,
    this.timeBox,
    this.timeFontFamily,
    this.timeFontSize,
    this.timeFontHeight,
    this.timeFontWeight,
    this.timeColor,
    this.splitFontSize,
    this.splitFontHeight,
    this.splitFontWeight,
    this.splitColor,
    this.space,
  });

  /// 时间容器宽度
  double? timeWidth;

  /// 时间容器高度
  double? timeHeight;

  /// 时间容器内边距
  EdgeInsets? timePadding;

  /// 时间容器外边距
  EdgeInsets? timeMargin;

  /// 时间容器装饰
  BoxDecoration? timeBox;

  /// 时间字体
  FontFamily? timeFontFamily;

  /// 时间字体尺寸
  double? timeFontSize;

  /// 时间字体行高
  double? timeFontHeight;

  /// 时间字体粗细
  FontWeight? timeFontWeight;

  /// 时间字体颜色
  Color? timeColor;

  /// 分隔符字体尺寸
  double? splitFontSize;

  /// 分隔符字体行高
  double? splitFontHeight;

  /// 分隔符字体粗细
  FontWeight? splitFontWeight;

  /// 分隔符字体颜色
  Color? splitColor;

  /// 时间与分隔符的间隔
  double? space;

  /// 生成默认样式
  GMTimeCounterStyle.generateStyle(
    BuildContext context, {
    GMTimeCounterSize? size,
    GMTimeCounterTheme? theme,
    bool? splitWithUnit,
  }) {
    timeFontFamily = GMTheme.defaultData().numberFontFamily;
    late Font? font;
    switch (size ?? GMTimeCounterSize.medium) {
      case GMTimeCounterSize.small:
        if (theme == GMTimeCounterTheme.defaultTheme) {
          timeWidth = timeHeight = null;
          font = GMTheme.of(context).fontBodyMedium;
          timeFontSize = splitFontSize = font?.size ?? 14;
          timeFontHeight = splitFontHeight = font?.height ?? (22 / timeFontSize!);
        } else {
          timeWidth = timeHeight = 20;
          font = GMTheme.of(context).fontBodySmall;
          timeFontSize = splitFontSize = font?.size ?? 12;
          timeFontHeight = splitFontHeight = null;
        }
        space = GMTheme.of(context).spacer4 / 2;
        break;
      case GMTimeCounterSize.medium:
        if (theme == GMTimeCounterTheme.defaultTheme) {
          timeWidth = timeHeight = null;
          font = GMTheme.of(context).fontBodyLarge;
          timeFontSize = splitFontSize = font?.size ?? 16;
          timeFontHeight = splitFontHeight = font?.height ?? (24 / timeFontSize!);
        } else {
          timeWidth = timeHeight = 24;
          font = GMTheme.of(context).fontBodyMedium;
          timeFontSize = splitFontSize = font?.size ?? 14;
          timeFontHeight = splitFontHeight = null;
        }
        space = GMTheme.of(context).spacer8 / 2;
        break;
      case GMTimeCounterSize.large:
        if (theme == GMTimeCounterTheme.defaultTheme) {
          timeWidth = timeHeight = null;
          font = GMTheme.of(context).fontBodyExtraLarge;
          timeFontSize = splitFontSize = font?.size ?? 18;
          timeFontHeight = splitFontHeight = font?.height ?? (26 / timeFontSize!);
        } else {
          timeWidth = timeHeight = 28;
          font = GMTheme.of(context).fontBodyLarge;
          timeFontSize = splitFontSize = font?.size ?? 16;
          timeFontHeight = splitFontHeight = null;
        }
        space = GMTheme.of(context).spacer12 / 2;
    }

    switch (theme ?? GMTimeCounterTheme.defaultTheme) {
      case GMTimeCounterTheme.round:
        timeBox = BoxDecoration(
          shape: BoxShape.circle,
          color: GMTheme.of(context).errorColor6,
        );
        timeColor = GMTheme.of(context).fontWhColor1;
        splitColor = GMTheme.of(context).errorColor6;
        break;
      case GMTimeCounterTheme.square:
        timeBox = BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(GMTheme.of(context).radiusSmall),
          color: GMTheme.of(context).errorColor6,
        );
        timeColor = GMTheme.of(context).fontWhColor1;
        splitColor = GMTheme.of(context).errorColor6;
        break;
      case GMTimeCounterTheme.defaultTheme:
        timeBox = null;
        timeColor = splitColor = GMTheme.of(context).fontGyColor1;
        timeWidth = null;
        timeHeight = null;
    }

    if (splitWithUnit ?? false) {
      splitColor = GMTheme.of(context).fontGyColor1;
    }
  }
}
