import 'package:flutter/cupertino.dart';

import '../../util/auto_size.dart';
import '../../util/map_ext.dart';
import 'gm_check_box.dart';

///
/// CheckBoxGroup变化监听器
///
typedef OnGroupChange = void Function(List<String> checkedIds);

///
/// 控制CheckBoxGroup
///
class GMCheckboxGroupController {
  GMCheckboxGroupState? _state;

  ///
  /// 选择全部
  /// 这个方法会忽略最大可够选数
  ///
  void toggleAll(bool check) {
    _state?.toggleAll(check);
  }

  ///
  /// 反选
  ///
  void reverseAll() {
    _state?._reverseAll();
  }

  ///
  /// 选中某一个选项
  ///
  void toggle(String id, bool check) {
    _state?.toggle(id, check, true);
  }

  ///
  /// 打勾的选项
  ///
  List<String> allChecked() {
    return _state?.checkBoxStates.where((k, v) => v).keys.toList() ?? [];
  }

  ///
  /// 某一项的选中状态
  ///
  bool checked(String id) {
    var list = allChecked();
    return list.contains(id);
  }
}

///
/// CheckBox组，可以通过控制器控制组内的多个CheckBox的选择状态
///
/// child的属性可以是任意包含GMCheckBox的容器组件，例如：
/// ```dart
/// GMCheckboxGroup(
///   child: Row(
///     children: [
///       GMCheckBox(),
///       Column(
///         children: [
///           GMCheckBox()
///           ...
///         ]
///       )
///       ...
///     ]
///   )
/// )
/// ```
///
///
class GMCheckboxGroup extends StatefulWidget {

  const GMCheckboxGroup(
      {required this.child,
        Key? key,
        this.onChangeGroup,
        this.controller,
        this.checkedIds,
        this.maxChecked,
        this.titleMaxLine,
        this.customContentBuilder,
        this.contentDirection,
        this.style,
        this.spacing,
        this.customIconBuilder,
        this.onOverloadChecked}) : super(key: key);

  ///
  /// 可以是任意包含GMCheckBox的容器，比如：
  /// ```
  /// Row(
  ///   children: [
  ///     GMCheckBox(),
  ///     GMCheckBox(),
  ///     ...
  ///   ]
  /// )
  /// ```
  ///
  final Widget child;

  /// 状态变化监听器
  final OnGroupChange? onChangeGroup;

  /// 可以通过控制器操作勾选状态
  final GMCheckboxGroupController? controller;

  /// 最多可以勾选多少
  final int? maxChecked;

  /// 勾选的CheckBox id列表
  final List<String>? checkedIds;

  /// 超过最大可勾选的个数
  final VoidCallback? onOverloadChecked;

  /// CheckBox标题的行数
  final int? titleMaxLine;


  /// CheckBox完全自定义内容
  final ContentBuilder? customContentBuilder;

  /// CheckBoxicon和文字的距离
  final double? spacing;

  /// CheckBox复选框样式：圆形或方形
  final GMCheckboxStyle? style;

  /// 文字相对icon的方位
  final GMContentDirection? contentDirection;

  /// 自定义选择icon的样式
  final IconBuilder? customIconBuilder;

  @override
  State<StatefulWidget> createState() {
    return GMCheckboxGroupState();
  }
}


class GMCheckboxGroupState extends State<GMCheckboxGroup> {
  ///
  /// 管理所有子CheckBox的状态
  ///
  Map<String, bool> checkBoxStates = {};

  @override
  void initState() {
    super.initState();
    // 如果有controller的话，把state设置给controller
    widget.controller?._state = this;

    _syncCheckState(widget.checkedIds);
  }

  /// 把group中配置的默认选中id，同步到状态中
  void _syncCheckState(List<String>? checkIds) {
    checkBoxStates.clear();
    checkIds?.forEach((element) {
      checkBoxStates[element] = true;
    });
  }


  @override
  void didUpdateWidget(GMCheckboxGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldCheckIds = oldWidget.checkedIds;
    final newCheckIds = widget.checkedIds;
    if (oldCheckIds != newCheckIds) {
      _syncCheckState(newCheckIds);
    }
  }


  ///
  /// 根据id获取CheckBox的勾选状态
  ///
  ///
  bool getCheckBoxStateById(String id, bool checked) {
    if (checkBoxStates[id] == null) {
      // checkBox本身的状态
      checkBoxStates[id] = checked;
    }
    return checkBoxStates[id]!;
  }

  /// 勾选单个CheckBox
  bool toggle(String id, bool check, [bool notify = false]) {
    // 检查是否超过用户设置的最大可勾选数
    if (widget.maxChecked != null && check) {
      if (checkBoxStates.count((k, v) => v) >= widget.maxChecked!) {
        widget.onOverloadChecked?.call();
        return false;
      }
    }
    checkBoxStates[id] = check;
    if (notify) {
      setState(() {});
    }
    _notifyChange();
    return true;
  }

  /// 操作所有CheckBox
  void toggleAll(bool check, [bool notify = true]) {
    var isChanged = false;
    checkBoxStates.forEachCanBreak((k, v) {
      if (check) {
        if (!toggle(k, check)) {
          // 勾选失败，退出循环
          return true;
        }
      } else {
        toggle(k, check);
      }
      isChanged = true;
      return false;
    });

    if (isChanged && notify) {
      setState(() {});
      _notifyChange();
    }
  }

  /// 反选
  void _reverseAll() {
    final reverseValue =
    checkBoxStates.map((key, value) => MapEntry(key, !value));
    checkBoxStates.forEach((key, value) {
      checkBoxStates[key] = false;
    });
    checkBoxStates.forEach((k, v) {
      var check = reverseValue[k] ?? false;
      toggle(k, check);
    });
    setState(() {});
    _notifyChange();
  }

  void _notifyChange() {
    final change = widget.onChangeGroup;
    if (change != null) {
      final checkedIds = checkBoxStates.where((k, v) => v).keys.toList();
      change.call(checkedIds);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GMCheckboxGroupInherited(this, widget.child);
  }
}

class GMCheckboxGroupInherited extends InheritedWidget {
  final GMCheckboxGroupState state;

  ///
  /// 获取树上的Group节点
  ///
  static GMCheckboxGroupInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GMCheckboxGroupInherited>();
  }

  const GMCheckboxGroupInherited(this.state, Widget child, {Key? key}) : super(child: child, key: key);

  @override
  bool updateShouldNotify(covariant GMCheckboxGroupInherited oldWidget) {
    return true;
  }
}


class GMCheckboxGroupContainer extends GMCheckboxGroup {

  GMCheckboxGroupContainer({
    Key? key,
    Widget? child, // 使用child 则请勿设置direction
    Axis? direction, // direction 对 directionalGMRadios 起作用
    List<GMCheckbox>? directionalGMCheckboxes,
    List<String>? selectIds, // 默认选择项的id组
    bool? passThrough, // 非通栏单选样式 用于使用child 或 direction == Axis.vertical 场景
    bool cardMode = false,
    int? titleMaxLine, // item的行数
    int? maxSelected, // 最大勾选数
    GMCheckboxStyle? style,// 勾选样式
    GMCheckboxGroupController? controller,
    IconBuilder? customIconBuilder,
    ContentBuilder? customContentBuilder,
    double? spacing, // icon和文字距离
    GMContentDirection? contentDirection,
    OnCheckBoxGroupChange? onCheckBoxGroupChange,
    VoidCallback? onOverloadChecked,
  })  : assert(() {
    // 使用direction属性则必须配合directionalGMCheckboxes，child字段无效
    if (direction != null && directionalGMCheckboxes == null) {
      throw FlutterError(
          '[GMCheckboxGroupContainer] direction and directionalGMCheckboxes must set at the same time');
    }
    // 未使用direction则必须设置child
    if (direction == null && child == null) {
      throw FlutterError(
          '[GMCheckboxGroupContainer] direction means use child as the exact one, but child is null');
    }
    // 横向单选框 每个选项有字数限制
    if (direction == Axis.horizontal && directionalGMCheckboxes != null) {
      directionalGMCheckboxes.forEach((element) {
        if (element.subTitle != null) {
          throw FlutterError(
              'horizontal checkbox style should not have subTilte, '
                  'because there left no room for it');
        }
      });
      var maxWordCount = 2;
      var tips =
          '[GMCheckboxGroupContainer] checkbox title please not exceed $maxWordCount words.\n'
          '2tabs: 7words maximum\n'
          '3tabs: 4words maximum\n'
          '4tabs: 2words maximum';
      if (directionalGMCheckboxes.length == 2) {
        maxWordCount = 7;
      }
      if (directionalGMCheckboxes.length == 3) {
        maxWordCount = 4;
      }
      if (directionalGMCheckboxes.length == 4) {
        maxWordCount = 2;
      }
      directionalGMCheckboxes.forEach((checkbox) {
        if ((checkbox.title?.length ?? 0) > maxWordCount) {
          throw FlutterError(tips);
        }
      });
    }
    // 卡片模式要求每个GMRadio必须设置cardMode属性为true，且不能有子标题（空间不够）
    if (cardMode == true) {
      assert(direction != null && directionalGMCheckboxes != null);
      directionalGMCheckboxes!.forEach((element) {
        // if use cardMode at GMRadioGroup, then every GMRadio should
        // set it's own carMode to true.
        if (element.cardMode == false) {
          throw FlutterError(
              'if use cardMode at GMCheckboxGroupContainer, then every '
                  'GMCheckbox should set it\'s own carMode to true.');
        }
        if (element.subTitle != null && direction == Axis.horizontal) {
          throw FlutterError(
              'horizontal card style should not have subTilte, '
                  'because there left no room for it');
        }
      });
    }
    return true;
  }()),
        super(
        child: Container(
          clipBehavior: (passThrough ?? false) && direction != Axis.horizontal
              ? Clip.hardEdge
              : Clip.none,
          decoration: (passThrough ?? false) && direction != Axis.horizontal
              ? BoxDecoration(borderRadius: BorderRadius.circular(10))
              : null,
          margin: (passThrough ?? false) && direction != Axis.horizontal
              ? const EdgeInsets.symmetric(horizontal: 16)
              : null,
          child: direction == null
              ? child!
              : (direction == Axis.vertical
              ? ListView.separated(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: cardMode
                    ? const EdgeInsets.symmetric(horizontal: 16)
                    : null,
                height: cardMode ? 82 : null,
                child: directionalGMCheckboxes[index],
              );
            },
            itemCount: directionalGMCheckboxes!.length,
            separatorBuilder: (BuildContext context, int index) {
              if (cardMode) {
                return const SizedBox(
                  height: 12,
                );
              }
              return const SizedBox.shrink();
            },
          )
              : Container(
            margin: cardMode
                ? EdgeInsets.symmetric(horizontal: 16.scale)
                : null,
            alignment: cardMode ? Alignment.topLeft : null,
            child: cardMode
                ? Wrap(
              spacing: 12.scale,
              runSpacing: 12,
              runAlignment: WrapAlignment.spaceEvenly,
              children: directionalGMCheckboxes!.map((element) {
                return SizedBox(
                  width: 106.3.scale,
                  height: 56,
                  child: element,
                );
              }).toList(),
            )
                : Row(
              mainAxisSize: MainAxisSize.min,
              children: directionalGMCheckboxes!
                  .map((e) => Expanded(child: e))
                  .toList(),
            ),
          )),
        ),
        key: key,
        onChangeGroup: (ids) {
          selectIds = ids;
          onCheckBoxGroupChange?.call(ids);
        },
        onOverloadChecked: onOverloadChecked,
        controller: controller,
        checkedIds: selectIds,
        maxChecked: maxSelected,
        titleMaxLine: titleMaxLine,
        contentDirection: contentDirection,
        customIconBuilder: customIconBuilder,
        customContentBuilder: customContentBuilder,
        style: style,
        spacing: spacing,
      );

  @override
  State<StatefulWidget> createState() {
    return GMCheckboxGroupContainerState();
  }
}

class GMCheckboxGroupContainerState extends GMCheckboxGroupState {

}

typedef OnCheckBoxGroupChange = void Function(List<String> ids);