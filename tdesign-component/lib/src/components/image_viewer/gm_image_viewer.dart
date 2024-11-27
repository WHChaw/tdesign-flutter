import 'package:flutter/material.dart';

import '../../theme/gm_colors.dart';
import '../../theme/gm_theme.dart';
import '../popup/gm_popup_route.dart';
import 'gm_image_viewer_widget.dart';

/// 图片预览工具
class GMImageViewer {

  /// 显示图片预览
  static void showImageViewer({
    required BuildContext context,
    required List<dynamic> images,
    bool? closeBtn = true,
    bool? deleteBtn = false,
    bool? showIndex = false,
    int? defaultIndex,
    double? width,
    double? height,
    OnIndexChange? onIndexChange,
    OnClose? onClose,
    OnDelete? onDelete,
    OnLongPress? onLongPress,
  }) {
    var modalBarrierColor = GMTheme.of(context).fontGyColor1;
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: modalBarrierColor,
      useSafeArea: false,
      builder: (context) {
        return GMImageViewerWidget(
          images: images,
          closeBtn: closeBtn,
          deleteBtn: deleteBtn,
          showIndex: showIndex,
          defaultIndex: defaultIndex,
          onIndexChange: onIndexChange,
          width: width,
          height: height,
          onClose: onClose,
          onDelete: onDelete,
          onLongPress: onLongPress,
        );
      },
    );
  }
}
