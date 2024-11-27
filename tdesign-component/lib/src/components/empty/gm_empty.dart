import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../tdesign_flutter.dart';

typedef GMTapEvent = void Function();

enum GMEmptyType { plain, operation }

class GMEmpty extends StatelessWidget {
  const GMEmpty(
      {this.type = GMEmptyType.plain,
        this.image,
        this.emptyText,
        this.operationText,
        this.operationTheme,
        this.onTapEvent,
        this.emptyTextColor,
        this.emptyTextFont,
        Key? key})
      : super(key: key);

  /// 点击事件
  final GMTapEvent? onTapEvent;
  /// 展示图片
  final Widget? image;
  /// 描述文字
  final String? emptyText;
  /// 描述文字颜色
  final Color?  emptyTextColor;
  /// 描述文字大小
  final Font?  emptyTextFont;
  /// 操作按钮文案
  final String? operationText;
  /// 操作按钮文案主题色
  final GMButtonTheme? operationTheme;
  /// 类型，为operation有操作按钮，plain无按钮
  final GMEmptyType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image ?? Icon(
            GMIcons.info_circle_filled,
            size: 96,
            color: GMTheme.of(context).fontGyColor3,
          ),
          Padding(padding: EdgeInsets.only(top: image == null ? 22 : 16)),
          GMText(
            emptyText ?? '',
            fontWeight: FontWeight.w400,
            font: emptyTextFont??GMTheme.of(context).fontBodyMedium,
            textColor: emptyTextColor??GMTheme.of(context).fontGyColor2.withOpacity(0.6),
          ),
          (type == GMEmptyType.operation)
              ? Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: GMButton(
                    text: operationText ?? '',
                    size: GMButtonSize.large,
                    theme: operationTheme??GMButtonTheme.primary,
                    width: 179,
                    onTap: () {
                      if (onTapEvent != null) {
                        onTapEvent!();
                      }
                    },
                  ))
              : Container()
        ],
      ),
    );
  }
}
