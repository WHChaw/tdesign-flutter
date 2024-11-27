import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'gm_swipe_cell_action.dart';

class GMSwipeCellInherited extends InheritedWidget {
  const GMSwipeCellInherited({
    Key? key,
    required Widget child,
    required this.cellClick,
    required this.actionClick,
    required this.duration,
    required this.controller,
  }) : super(child: child, key: key);

  final Duration duration;
  final void Function() cellClick;
  final bool Function(GMSwipeCellAction action) actionClick;
  final SlidableController controller;

  @override
  bool updateShouldNotify(covariant GMSwipeCellInherited oldWidget) {
    return true;
  }

  static GMSwipeCellInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GMSwipeCellInherited>();
  }
}
