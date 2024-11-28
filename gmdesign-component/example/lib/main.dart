import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gmdesign_flutter/src/util/log.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import 'base/example_route.dart';
import 'base/intl_resource_delegate.dart';
import 'config.dart';
import 'home.dart';

void main() async {
  Log.setCustomLogPrinter((level, tag, msg) => print('[$level] $tag ==> $msg'));

  WidgetsFlutterBinding.ensureInitialized();

  //如果app版本有更新，执行unregisterTheme
  var isNewAppVersion = true;
  if (isNewAppVersion) {
    await GMTheme.unregisterTheme();
  }
  await GMTheme.registerTheme([
    ThemeItem(name: 'black', cssPath: 'assets/theme_black.css'),
    ThemeItem(name: 'purple', cssPath: 'assets/theme_purple.css'),
  ]);

  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  exampleMap.forEach((key, value) {
    value.forEach((model) {
      examplePageList.add(model);
    });
  });
  sideBarExamplePage.forEach(examplePageList.add);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GMThemeData _themeData = GMTheme.defaultData();
  Locale? locale = const Locale('zh');

  @override
  void initState() {
    super.initState();
    _themeData = GMThemeData.defaultData();
  }

  @override
  Widget build(BuildContext context) {
    // 使用多套主题
    GMTheme.needMultiTheme();
    // 适配3.16的字体居中前,先禁用字体居中功能
    // kTextForceVerticalCenterEnable = false;
    var delegate = IntlResourceDelegate(context);
    return MaterialApp(
      title: 'GMDesign Flutter Example',
      // theme: ThemeData(extensions: [_themeData], colorScheme: ColorScheme.light(primary: _themeData.brandNormalColor)),
      theme: ThemeData(extensions: [_themeData], colorScheme: ColorScheme.light(primary: _themeData.brandNormalColor)),
      home: PlatformUtil.isWeb
          ? null
          : Builder(
              builder: (context) {
                // 设置文案代理,国际化需要在MaterialApp初始化完成之后才生效,而且需要每次更新context
                GMTheme.setResourceBuilder((context) => delegate..updateContext(context), needAlwaysBuild: true);
                return MyHomePage(
                  title: AppLocalizations.of(context)?.components ?? '',
                  locale: locale,
                  onLocaleChange: (locale) {
                    setState(() {
                      this.locale = locale;
                    });
                  },
                  onThemeChange: (themeData) {
                    setState(() {
                      _themeData = themeData;
                    });
                  },
                );
              },
            ),
      // 设置国际化处理
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateRoute: GMExampleRoute.onGenerateRoute,
      routes: _getRoutes(),
    );
  }

  Map<String, WidgetBuilder> _getRoutes() {
    if (PlatformUtil.isWeb) {
      return {for (var model in examplePageList) model.name: (context) => model.pageBuilder.call(context, model)}
        ..putIfAbsent('/', () => (context) => const MyHomePage(title: 'TDesign Flutter 组件库'));
    } else {
      return const {};
    }
  }
}