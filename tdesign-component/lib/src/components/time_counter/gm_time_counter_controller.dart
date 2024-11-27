import 'package:flutter/cupertino.dart';

/// 计时组件控制器转态
enum GMTimeCounterStatus {
  /// 开始
  start,

  /// 暂停
  pause,

  /// 继续
  resume,

  /// 重置
  reset,

  /// 空，默认值
  idle,
}

/// 倒计时组件控制器，可控制开始(`start()`)/暂停(`pause()`)/继续(`resume()`)/重置(`reset([int? time])`)
class GMTimeCounterController extends ValueNotifier<GMTimeCounterStatus> {
  GMTimeCounterController() : super(GMTimeCounterStatus.idle);

  int? _time;

  int? get time => _time;

  /// 开始
  void start() {
    value = GMTimeCounterStatus.start;
  }

  /// 暂停
  void pause() {
    value = GMTimeCounterStatus.pause;
  }

  /// 继续
  void resume() {
    value = GMTimeCounterStatus.resume;
  }

  /// 重置
  void reset([int? time]) {
    if (value == GMTimeCounterStatus.reset) {
       _time = time;
      notifyListeners();
    } else {
      _time = time;
      value = GMTimeCounterStatus.reset;
    }
  }
}
