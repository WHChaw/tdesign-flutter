import 'package:flutter/cupertino.dart';

import 'gm_cell_style.dart';

class GMCellInherited extends InheritedWidget {
  const GMCellInherited({required Widget child, required this.style, Key? key})
      : super(child: child, key: key);

  final GMCellStyle style;

  @override
  bool updateShouldNotify(covariant GMCellInherited oldWidget) {
    return true;
  }

  static GMCellInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GMCellInherited>();
  }
}
