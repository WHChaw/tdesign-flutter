import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../util/list_ext.dart';
import '../cell/gm_cell.dart';
import 'gm_swipe_cell_action.dart';
import 'gm_swipe_cell_inherited.dart';
import 'gm_swipe_cell_panel.dart';

export 'package:flutter_slidable/flutter_slidable.dart';

enum GMSwipeDirection { right, left }

/// 滑动单元格组件
class GMSwipeCell extends StatefulWidget {
  const GMSwipeCell({
    Key? key,
    this.slidableKey,
    required this.cell,
    this.disabled = false,
    this.opened = const [false, false],
    this.right,
    this.left,
    this.onChange,
    this.controller,
    this.groupTag,
    this.closeWhenOpened = true,
    this.closeWhenTapped = true,
    this.dragStartBehavior = DragStartBehavior.start,
    this.direction = Axis.horizontal,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  /// 滑动组件的 Key
  final Key? slidableKey;

  /// 单元格 [GMCell]
  final Widget cell;

  /// 是否禁用滑动
  final bool? disabled;

  /// 默认打开，[left, right]
  final List<bool>? opened;

  /// 右侧滑动操作项面板
  final GMSwipeCellPanel? right;

  /// 左侧滑动操作项面板
  final GMSwipeCellPanel? left;

  /// 滑动展开事件
  final Function(GMSwipeDirection direction, bool open)? onChange;

  /// 自定义控制滑动窗口
  final SlidableController? controller;

  /// 组，配置后，[closeWhenOpened]、[closeWhenTapped]才起作用
  final Object? groupTag;

  /// 当同一组（[groupTag]）中的一个[GMSwipeCell]打开时，是否关闭组中的所有其他[GMSwipeCell]
  final bool? closeWhenOpened;

  /// 当同一组（[groupTag]）中的一个[GMSwipeCell]被点击时，是否应该关闭组中的所有[GMSwipeCell]
  ///
  /// [cell]组件被点击时必须传递点击事件，执行`GMSwipeCellInherited.of(context)?.cellClick()`
  final bool? closeWhenTapped;

  /// 处理拖动开始行为的方式[GestureDetector.dragStartBehavior]
  final DragStartBehavior? dragStartBehavior;

  /// 可拖动的方向
  final Axis? direction;

  /// 打开关闭动画时长
  final Duration? duration;

  Duration get getDuration => duration ?? const Duration(milliseconds: 200);

  static final Map<Object, List<SlidableController>> _controllers = {};

  static void _pushController(SlidableController controller, Object? tag, {bool del = false}) {
    if (tag == null) {
      return;
    }
    if (del) {
      if (_controllers.keys.contains(tag)) {
        _controllers[tag]!.remove(controller);
      }
    } else {
      if (_controllers.keys.contains(tag)) {
        if (!_controllers[tag]!.contains(controller)) {
          _controllers[tag]!.add(controller);
        }
      } else {
        _controllers[tag] = [controller];
      }
    }
  }

  /// 根据[groupTag]关闭[GMSwipeCell]
  /// 
  /// current：保留当前不关闭
  static void close(Object? tag, {SlidableController? current}) {
    if (tag == null || !_controllers.keys.contains(tag)) {
      return;
    }
    _controllers[tag]!.forEach((element) {
      if (element != current) {
        element.close();
      }
    });
  }

  /// 获取上下文最近的[controller]
  static SlidableController? of(BuildContext context) {
    return Slidable.of(context);
  }

  @override
  _GMSwipeCellState createState() => _GMSwipeCellState();

}

class _GMSwipeCellState extends State<GMSwipeCell> with TickerProviderStateMixin {
  late final SlidableController controller;
  final confirmListenable = ValueNotifier<GMSwipeCellAction?>(null);
  GMSwipeDirection? openDirection;

  @override
  void initState() {
    super.initState();
    controller = (widget.controller ?? SlidableController(this))
      ..actionPaneType.addListener(_handleActionPanelTypeChanged)
      ..animation.addStatusListener((status) {
        confirmListenable.value = null;
      });
    GMSwipeCell._pushController(controller, widget.groupTag);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if ((widget.opened?.length ?? 0) > 0 && widget.opened![0] == true) {
        controller.openStartActionPane(duration: widget.getDuration);
      }
      if ((widget.opened?.length ?? 0) > 1 && widget.opened![1] == true) {
        controller.openEndActionPane(duration: widget.getDuration);
      }
    });
  }

  @override
  void didUpdateWidget(covariant GMSwipeCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      controller.actionPaneType.removeListener(_handleActionPanelTypeChanged);
      GMSwipeCell._pushController(controller, widget.groupTag, del: true);
      controller = (widget.controller ?? SlidableController(this))
        ..actionPaneType.addListener(_handleActionPanelTypeChanged);
      GMSwipeCell._pushController(controller, widget.groupTag);
    }
  }

  @override
  void dispose() {
    controller.actionPaneType.removeListener(_handleActionPanelTypeChanged);
    controller.dispose();
    GMSwipeCell._pushController(controller, widget.groupTag, del: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rightConfirmLength = widget.right?.confirms?.length ?? 0;
    final leftConfirmLength = widget.left?.confirms?.length ?? 0;

    final slidable = Slidable(
      key: widget.slidableKey ?? UniqueKey(),
      closeOnScroll: false,
      child: widget.cell,
      controller: controller,
      enabled: !(widget.disabled ?? false),
      groupTag: widget.groupTag,
      startActionPane: widget.left?.build(context),
      endActionPane: widget.right?.build(context),
      dragStartBehavior: widget.dragStartBehavior ?? DragStartBehavior.start,
      direction: widget.direction ?? Axis.horizontal,
    );
    return GMSwipeCellInherited(
      duration: widget.getDuration,
      controller: controller,
      cellClick: () {
        if (widget.closeWhenTapped == true) {
          GMSwipeCell.close(widget.groupTag);
        }
      },
      actionClick: (action) {
        final isLeft = openDirection == GMSwipeDirection.left;
        final panel = isLeft ? widget.left! : widget.right!;
        final index = panel.children.indexOf(action);
        final confirm = panel.confirms?.find((element) => element.confirmIndex?.contains(index) == true);
        confirmListenable.value = confirm;
        return confirm != null;
      },
      child: rightConfirmLength > 0 || leftConfirmLength > 0
          ? ValueListenableBuilder(
              valueListenable: confirmListenable,
              builder: (BuildContext context, value, Widget? child) {
                return Stack(
                  children: [
                    slidable,
                    _confirmWidget(),
                  ],
                );
              },
            )
          : slidable,
    );
  }

  Widget _confirmWidget() {
    final isHorizontal = widget.direction == Axis.horizontal;
    final isLeft = openDirection == GMSwipeDirection.left;
    final pane = isLeft ? widget.left : widget.right;
    final extentRatio = pane?.extentRatio ?? 0.3;
    return Positioned.fill(
      child: FractionallySizedBox(
        alignment: isHorizontal
            ? (isLeft ? Alignment.centerLeft : Alignment.centerRight)
            : (isLeft ? Alignment.topCenter : Alignment.bottomCenter),
        widthFactor: isHorizontal ? extentRatio : null,
        heightFactor: isHorizontal ? null : extentRatio,
        child: AnimatedSwitcher(
          duration: widget.getDuration,
          transitionBuilder: (child, animation) {
            return SlideTransition(
              child: child,
              position: Tween<Offset>(
                begin: isLeft ? const Offset(-1, 0) : const Offset(1, 0),
                end: isLeft ? const Offset(0, 0) : const Offset(0, 0),
              ).animate(animation),
            );
          },
          child: confirmListenable.value ?? const SizedBox.shrink(),
        ),
      ),
    );
  }

  void _handleActionPanelTypeChanged() {
    switch (controller.actionPaneType.value) {
      case ActionPaneType.none:
        widget.onChange?.call(openDirection!, false);
        openDirection = null;
        break;
      case ActionPaneType.start:
        if (widget.closeWhenOpened == true) {
          GMSwipeCell.close(widget.groupTag, current: controller);
        }
        openDirection = GMSwipeDirection.left;
        widget.onChange?.call(openDirection!, true);
        break;
      case ActionPaneType.end:
        if (widget.closeWhenOpened == true) {
          GMSwipeCell.close(widget.groupTag, current: controller);
        }
        openDirection = GMSwipeDirection.right;
        widget.onChange?.call(openDirection!, true);
        break;
    }
  }
}
