import 'package:flutter/material.dart';

import '../../../gmdesign_flutter.dart';
import 'gm_cell_inherited.dart';

typedef CellBuilder = Widget Function(BuildContext context, GMCell cell, int index);

enum GMCellGroupTheme { defaultTheme, cardTheme }

/// 单元格组组件
class GMCellGroup extends StatefulWidget {
  const GMCellGroup({
    Key? key,
    this.bordered = false,
    this.theme = GMCellGroupTheme.defaultTheme,
    this.title,
    required this.cells,
    this.builder,
    this.style,
    this.titleWidget,
    this.scrollable = false,
    this.isShowLastBordered = false,
  }) : super(key: key);

  /// 是否显示组边框
  final bool? bordered;

  /// 单元格组风格。可选项：default/card
  final GMCellGroupTheme? theme;

  /// 单元格组标题
  final String? title;

  /// 单元格组标题组件
  final Widget? titleWidget;

  /// 单元格列表
  final List<GMCell> cells;

  /// cell构建器，可自定义cell父组件，如Dismissible
  final CellBuilder? builder;

  /// 自定义样式
  final GMCellStyle? style;

  /// 可滚动
  final bool? scrollable;

  /// 是否显示最后一个cell的下边框
  final bool? isShowLastBordered;

  @override
  _GMCellGroupState createState() => _GMCellGroupState();
}

class _GMCellGroupState extends State<GMCellGroup> {
  @override
  Widget build(BuildContext context) {
    var style = widget.style ?? GMCellStyle.cellStyle(context);
    var spacer16 = GMTheme.of(context).spacer16;
    var itemCount = widget.cells.length;
    var radius = _getBorderRadius();
    return GMCellInherited(
      style: style,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.title != null || widget.titleWidget != null)
            Container(
              width: double.infinity,
              color: style.backgroundColor,
              padding: EdgeInsets.only(
                left: spacer16,
                right: spacer16,
                top: GMTheme.of(context).spacer24,
                bottom: GMTheme.of(context).spacer8,
              ),
              child: widget.titleWidget ?? GMText(widget.title!, style: style.groupTitleStyle),
            ),
          Flexible(
            child: Container(
              padding: widget.theme == GMCellGroupTheme.cardTheme
                  ? EdgeInsets.only(left: spacer16, right: spacer16)
                  : EdgeInsets.zero,
              decoration: BoxDecoration(border: _getBordered(style), borderRadius: radius),
              child: ClipRRect(
                borderRadius: radius,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: widget.scrollable == false, // 设置为true以避免无限制地增长
                  physics: widget.scrollable == false ? const NeverScrollableScrollPhysics() : null, // 禁用ListView的滚动
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    final item = widget.cells[index];
                    final cell = widget.builder == null ? item : widget.builder!(context, item, index);
                    if (itemCount - 1 == index && (widget.isShowLastBordered ?? false)) {
                      return Column(children: [cell, _borderWidget(style)]);
                    }
                    return cell;
                  },
                  separatorBuilder: (context, index) {
                    if (!(widget.cells[index].bordered ?? true)) {
                      return const SizedBox.shrink();
                    }
                    return _borderWidget(style);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxBorder? _getBordered(GMCellStyle style) {
    if (!(widget.bordered ?? false)) {
      return null;
    }
    var color = style.groupBorderedColor ?? GMTheme.of(context).grayColor3;
    return Border.all(
      color: color,
      width: 1,
    );
  }

  BorderRadiusGeometry _getBorderRadius() {
    if (widget.theme == GMCellGroupTheme.cardTheme) {
      return BorderRadius.all(Radius.circular(GMTheme.of(context).radiusLarge));
    }
    return BorderRadius.zero;
  }

  Widget _borderWidget(GMCellStyle style) {
    return Row(
      children: [
        Container(height: 0.5, width: GMTheme.of(context).spacer16, color: style.backgroundColor),
        Expanded(
          child: Container(height: 0.5, color: style.borderedColor ?? GMTheme.of(context).grayColor3),
        ),
      ],
    );
  }
}
