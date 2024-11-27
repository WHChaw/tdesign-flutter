import 'package:flutter/material.dart';
import '../../../gmdesign_flutter.dart';

/// 日历组件样式
class GMCalendarStyle {
  GMCalendarStyle({
    this.decoration,
    this.titleStyle,
    this.titleMaxLine,
    this.titleCloseColor,
    this.weekdayStyle,
    this.monthTitleStyle,
    this.cellStyle,
    this.centreColor,
    this.cellDecoration,
    this.cellPrefixStyle,
    this.cellSuffixStyle,
  });

  BoxDecoration? decoration;

  /// header区域 [GMCalendar.title]的样式
  TextStyle? titleStyle;

  /// header区域 [GMCalendar.title]的行数
  int? titleMaxLine;

  /// header区域 关闭图标的颜色
  Color? titleCloseColor;

  /// header区域 周 文字样式
  TextStyle? weekdayStyle;

  /// body区域 年月文字样式
  TextStyle? monthTitleStyle;

  /// 日期样式
  TextStyle? cellStyle;

  /// 当天日期样式
  TextStyle? todayStyle;

  /// 日期decoration
  BoxDecoration? cellDecoration;

  /// 日期范围内背景样式
  Color? centreColor;

  /// 日期前面的字符串的样式
  TextStyle? cellPrefixStyle;

  /// 日期后面的字符串的样式
  TextStyle? cellSuffixStyle;

  /// 生成默认样式
  GMCalendarStyle.generateStyle(BuildContext context) {
    decoration = BoxDecoration(
      color: GMTheme.of(context).whiteColor1,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(GMTheme.of(context).radiusExtraLarge),
      ),
    );
    titleStyle = TextStyle(
      fontSize: GMTheme.of(context).fontTitleLarge?.size,
      fontWeight: GMTheme.of(context).fontTitleLarge?.fontWeight,
      color: GMTheme.of(context).fontGyColor1,
    );
    titleMaxLine = 1;
    titleCloseColor = titleStyle?.color;
    weekdayStyle = TextStyle(
      fontSize: GMTheme.of(context).fontTitleSmall?.size,
      color: GMTheme.of(context).fontGyColor2,
    );
    monthTitleStyle = TextStyle(
      fontSize: GMTheme.of(context).fontMarkMedium?.size,
      fontWeight: GMTheme.of(context).fontMarkMedium?.fontWeight,
      color: GMTheme.of(context).fontGyColor1,
    );
  }

  /// 日期样式
  GMCalendarStyle.cellStyle(BuildContext context, DateSelectType? type) {
    final radius6 = GMTheme.of(context).radiusDefault;
    final defStyle = TextStyle(
      fontSize: GMTheme.of(context).fontTitleMedium?.size,
      height: GMTheme.of(context).fontTitleMedium?.height,
      fontWeight: GMTheme.of(context).fontTitleMedium?.fontWeight,
    );
    final prefixStyle = TextStyle(
      fontSize: GMTheme.of(context).fontBodyExtraSmall?.size,
      height: GMTheme.of(context).fontBodyExtraSmall?.height,
      fontWeight: FontWeight.w400,
    );
    centreColor = GMTheme.of(context).brandColor1;
    switch (type) {
      case DateSelectType.empty:
        cellStyle = defStyle.copyWith(color: GMTheme.of(context).fontGyColor1);
        todayStyle = defStyle.copyWith(color: GMTheme.of(context).brandColor7);
        cellPrefixStyle = prefixStyle.copyWith(color: GMTheme.of(context).errorColor6);
        cellSuffixStyle = prefixStyle.copyWith(color: GMTheme.of(context).fontGyColor3);
        cellDecoration = null;
        break;
      case DateSelectType.disabled:
        cellStyle = defStyle.copyWith(color: GMTheme.of(context).fontGyColor4);
        todayStyle = defStyle.copyWith(color: GMTheme.of(context).brandColor3);
        cellPrefixStyle = prefixStyle.copyWith(color: GMTheme.of(context).errorColor3);
        cellSuffixStyle = prefixStyle.copyWith(color: GMTheme.of(context).fontGyColor4);
        cellDecoration = null;
        break;
      case DateSelectType.selected:
        cellStyle = defStyle.copyWith(color: GMTheme.of(context).fontWhColor1);
        cellPrefixStyle = prefixStyle.copyWith(color: GMTheme.of(context).fontWhColor1);
        cellSuffixStyle = prefixStyle.copyWith(color: GMTheme.of(context).fontWhColor1);
        cellDecoration = BoxDecoration(
          borderRadius: BorderRadius.circular(radius6),
          color: GMTheme.of(context).brandColor7,
        );
        break;
      case DateSelectType.centre:
        cellStyle = defStyle.copyWith(color: GMTheme.of(context).fontGyColor1);
        cellPrefixStyle = prefixStyle.copyWith(color: GMTheme.of(context).errorColor6);
        cellSuffixStyle = prefixStyle.copyWith(color: GMTheme.of(context).fontGyColor3);
        cellDecoration = BoxDecoration(
          color: centreColor,
        );
        break;
      case DateSelectType.start:
        cellStyle = defStyle.copyWith(color: GMTheme.of(context).fontWhColor1);
        cellPrefixStyle = prefixStyle.copyWith(color: GMTheme.of(context).fontWhColor1);
        cellSuffixStyle = prefixStyle.copyWith(color: GMTheme.of(context).fontWhColor1);
        cellDecoration = BoxDecoration(
          color: GMTheme.of(context).brandColor7,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(radius6)),
        );
        break;
      case DateSelectType.end:
        cellStyle = defStyle.copyWith(color: GMTheme.of(context).fontWhColor1);
        cellPrefixStyle = prefixStyle.copyWith(color: GMTheme.of(context).fontWhColor1);
        cellSuffixStyle = prefixStyle.copyWith(color: GMTheme.of(context).fontWhColor1);
        cellDecoration = BoxDecoration(
          color: GMTheme.of(context).brandColor7,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(radius6)),
        );
        break;
      default:
        break;
    }
  }
}
