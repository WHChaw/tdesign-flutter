import 'package:flutter/material.dart';
import '../../util/context_extension.dart';
import 'gm_loading.dart';

class GMLoadingController {
  static BuildContext? _context;
  static OverlayEntry? _overlayEntry;

  static bool _isShowing = false;

  // 展示
  static void show(BuildContext context,
      {Widget? child,
      GMLoadingSize size = GMLoadingSize.medium,
      GMLoadingIcon? icon = GMLoadingIcon.circle,
      Color? iconColor,
      String? text,
      Widget? refreshWidget,
      Color textColor = Colors.black,
      Axis axis = Axis.vertical,
      Widget? customIcon,
      int duration = 2000}) {

    if (_isShowing) {
      print('warn: GMLoading is showing!');
      return;
    }

    _overlayEntry = OverlayEntry(builder: (context) {
      return Center(
        child: child ??
            GMLoading(
              size: size,
              icon: icon,
              customIcon: customIcon,
              text: text ?? context.resource.loading,
              textColor: textColor,
              refreshWidget: refreshWidget,
              duration: duration,
              iconColor: iconColor,
              axis: axis,
            ),
      );
    });

    _context = context;
    if (_context == null || _overlayEntry == null) {
      print('error: GMLoading is not init!:${_context} ${_overlayEntry}');
      return;
    }
    _isShowing = true;
    Overlay.of(_context!).insert(_overlayEntry!);
  }

  // 消失
  static void dismiss() {
    if (_isShowing) {
     if (_overlayEntry != null) {
       _overlayEntry?.remove();
       _overlayEntry = null;
     }
      _isShowing = false;
    }
  }
}
