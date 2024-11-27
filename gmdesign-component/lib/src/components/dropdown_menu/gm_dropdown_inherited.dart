import 'package:flutter/cupertino.dart';

import 'gm_dropdown_item.dart';
import 'gm_dropdown_menu.dart';
import 'gm_dropdown_popup.dart';

class GMDropdownInherited extends InheritedWidget {
  const GMDropdownInherited({required Widget child, required this.popupState, required this.directionListenable, Key? key})
      : super(child: child, key: key);

  final GMDropdownPopup popupState;
  final ValueNotifier<GMDropdownMenuDirection> directionListenable;

  @override
  bool updateShouldNotify(covariant GMDropdownInherited oldWidget) {
    return true;
  }

  static GMDropdownInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GMDropdownInherited>();
  }
}
