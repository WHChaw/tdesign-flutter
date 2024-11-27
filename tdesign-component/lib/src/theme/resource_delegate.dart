import 'package:flutter/cupertino.dart';

import '../../tdesign_flutter.dart';

typedef GMGMResourceBuilder = GMResourceDelegate? Function(BuildContext context);

/// 资源管理器
class GMResourceManager {
  /// 代理构建器
  GMGMResourceBuilder? _builder;

  /// 每次都调用build方法
  bool _needAlwaysBuild = false;

  GMResourceDelegate? _delegate;

  /// 获取资源
  GMResourceDelegate delegate(BuildContext context) {
    if (_builder == null) {
      return _defaultDelegate;
    }
    if (_needAlwaysBuild) {
      // 每次都调用,适用于全局有多个GMResourceDelegate的情况
      var delegate = _builder?.call(context);
      if (delegate != null) {
        return delegate;
      }
    }
    _delegate ??= _builder?.call(context);
    return _delegate ?? _defaultDelegate;
  }

  static GMResourceManager? _instance;

  /// 单例对象
  static GMResourceManager get instance {
    _instance ??= GMResourceManager();
    return _instance!;
  }

  /// 获取资源
  static final _defaultDelegate = _DefaultResourceDelegate();

  /// 设置资源代理
  void setResourceBuilder(GMGMResourceBuilder delegate, needAlwaysBuild) {
    _builder = delegate;
    _needAlwaysBuild = needAlwaysBuild;
  }
}

/// 资源管理器,允许外部重写,设计成抽象类,防止有新增字段时,用户没有感知
abstract class GMResourceDelegate {
  /// [GMSwitch]的打开状态文案
  String get open;

  /// [GMSwitch]的关闭状态文案
  String get close;

  /// [GMBadge]为0时的默认文案
  String get badgeZero;

  /// [GMAlertDialog]等 取消
  String get cancel;

  /// [GMAlertDialog]等 确认
  String get confirm;

  /// [GMDropdownMenu] 其他
  String get other;

  /// [GMDropdownMenu] 重置
  String get reset;

  /// [GMLoading] 加载中
  String get loading;

  /// [GMToast] 加载中...
  String get loadingWithPoint;

  /// [GMConfirmDialog] 知道了
  String get knew;

  /// [GMRefreshHeader] 正在刷新
  String get refreshing;

  /// [GMRefreshHeader] 松开刷新
  String get releaseRefresh;

  /// [GMTimeCounter] 天
  String get days;

  /// [GMTimeCounter] 时
  String get hours;

  /// [GMTimeCounter] 分
  String get minutes;

  /// [GMTimeCounter] 秒
  String get seconds;

  /// [GMTimeCounter] 毫秒
  String get milliseconds;

  /// [GMCalendarHeader] 星期日
  String get sunday;

  /// [GMCalendarHeader] 星期一
  String get monday;

  /// [GMCalendarHeader] 星期二
  String get tuesday;

  /// [GMCalendarHeader] 星期三
  String get wednesday;

  /// [GMCalendarHeader] 星期四
  String get thursday;

  /// [GMCalendarHeader] 星期五
  String get friday;

  /// [GMCalendarHeader] 星期六
  String get saturday;

  /// [GMCalendarBody] 年
  String get year;

  /// [GMCalendarBody] 一月
  String get january;

  /// [GMCalendarBody] 二月
  String get february;

  /// [GMCalendarBody] 三月
  String get march;

  /// [GMCalendarBody] 四月
  String get april;

  /// [GMCalendarBody] 五月
  String get may;

  /// [GMCalendarBody] 六月
  String get june;

  /// [GMCalendarBody] 七月
  String get july;

  /// [GMCalendarBody] 八月
  String get august;

  /// [GMCalendarBody] 九月
  String get september;

  /// [GMCalendarBody] 十月
  String get october;

  /// [GMCalendarBody] 十一月
  String get november;

  /// [GMCalendarBody] 十二月
  String get december;

  /// [GMCalendar] 时间
  String get time;

  /// [GMCalendar] 开始
  String get start;

  /// [GMCalendar] 结束
  String get end;

  /// [GMRate] 未评分
  String get notRated;

  /// [GMRate] 选择选项
  String get cascadeLabel;
}

/// 如果用户要重写,就应该全部重写,不开放只重新部分资源
class _DefaultResourceDelegate extends GMResourceDelegate {
  @override
  String get open => '开';

  @override
  String get close => '关';

  @override
  String get badgeZero => '0';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确定';

  @override
  String get other => '其它';

  @override
  String get reset => '重置';

  @override
  String get loading => '加载中';

  @override
  String get loadingWithPoint => '加载中...';

  @override
  String get knew => '知道了';

  @override
  String get refreshing => '正在刷新';

  @override
  String get releaseRefresh => '松开刷新';

  @override
  String get days => '天';

  @override
  String get hours => '时';

  @override
  String get minutes => '分';

  @override
  String get seconds => '秒';

  @override
  String get milliseconds => '毫秒';

  @override
  String get sunday => '日';

  @override
  String get monday => '一';

  @override
  String get tuesday => '二';

  @override
  String get wednesday => '三';

  @override
  String get thursday => '四';

  @override
  String get friday => '五';

  @override
  String get saturday => '六';

  @override
  String get year => ' 年';

  @override
  String get january => '1 月';

  @override
  String get february => '2 月';

  @override
  String get march => '3 月';

  @override
  String get april => '4 月';

  @override
  String get may => '5 月';

  @override
  String get june => '6 月';

  @override
  String get july => '7 月';

  @override
  String get august => '8 月';

  @override
  String get september => '9 月';

  @override
  String get october => '10 月';

  @override
  String get november => '11 月';

  @override
  String get december => '12 月';

  @override
  String get time => '时间';

  @override
  String get start => '开始';

  @override
  String get end => '结束';

  @override
  String get notRated => '未评分';

  @override
  String get cascadeLabel => '选择选项';
}
