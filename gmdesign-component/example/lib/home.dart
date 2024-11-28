import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import 'base/example_base.dart';
import 'base/example_route.dart';
import 'base/web_md_tool.dart';
import 'config.dart';
import 'web/web.dart' if (dart.library.io) 'web/web_replace.dart' as web;

var _kShowTodoComponent = false;

/// 切换主题的回调
typedef OnThemeChange = Function(GMThemeData themeData);

/// 切换语言的回调
typedef OnLocaleChange = Function(Locale locale);

/// 示例首页
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    this.onThemeChange,
    this.locale,
    this.onLocaleChange,
  }) : super(key: key);

  final String title;

  final OnThemeChange? onThemeChange;

  final OnLocaleChange? onLocaleChange;

  final Locale? locale;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool useConch = false;

  @override
  void initState() {
    super.initState();
    GMExampleRoute.init();
    sideBarExamplePage.forEach(GMExampleRoute.add);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: GMTheme.of(context).brandNormalColor,
        titleTextStyle: TextStyle(
            color: GMTheme.of(context).whiteColor1,
            fontSize: GMTheme.of(context).fontTitleLarge?.size),
        title: Text(widget.title),
        actions: ScreenUtil.isWebLargeScreen(context)
            ? null
            : [
                GestureDetector(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: GMText(
                      widget.locale?.languageCode == 'en' ? '中文' : 'English',
                      textColor: GMTheme.of(context).whiteColor1,
                    ),
                  ),
                  onTap: () {
                    if (widget.locale?.languageCode == 'en') {
                      widget.onLocaleChange?.call(const Locale('zh'));
                    } else {
                      widget.onLocaleChange?.call(const Locale('en'));
                    }
                  },
                ),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: GMText(
                      AppLocalizations.of(context)?.about,
                      textColor: GMTheme.of(context).whiteColor1,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, GMExampleRoute.aboutPath);
                  },
                )
              ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (ScreenUtil.isWebLargeScreen(context)) {
      return const web.WebMainBody();
    }
    return SafeArea(
        child: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildChildren(context),
        ),
      ),
    ));
  }

  List<Widget> _buildChildren(BuildContext context) {
    var children = <Widget>[];

    // 添加切换主题的按钮
    children.add(Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GMTheme(
              data: GMThemeData.defaultData(),
              child: GMButton(
                text: AppLocalizations.of(context)?.defaultTheme,
                theme: GMButtonTheme.primary,
                onTap: () {
                  widget.onThemeChange?.call(GMTheme.defaultData());
                },
              )),
          GMTheme(
              data: GMThemeData.fromJson('green', greenThemeConfig) ??
                  GMThemeData.defaultData(),
              child: GMButton(
                  text: AppLocalizations.of(context)?.greenTheme,
                  theme: GMButtonTheme.primary,
                  onTap: () async {

                    widget.onThemeChange?.call(await GMTheme.loadThemeData('black'));
                  })),
          GMTheme(
              data: GMThemeData.fromJson('red', greenThemeConfig) ??
                  GMThemeData.defaultData(),
              child: GMButton(
                  text: AppLocalizations.of(context)?.redTheme,
                  theme: GMButtonTheme.danger,
                  onTap: () async {
                     widget.onThemeChange?.call(await GMTheme.loadThemeData('purple'));
                  })),
        ],
      ),
    ));

    exampleMap.forEach((key, value) {
      children.add(Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
        padding: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
            color: GMTheme.of(context).brandHoverColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(GMTheme.of(context).radiusLarge))),
        child: GMText(
          key,
          textColor: GMTheme.of(context).whiteColor1,
        ),
      ));
      value.forEach((model) {
        model.spline = WebMdTool.getSpline(key);
        if (model.isTodo) {
          if (_kShowTodoComponent) {
            children.add(Padding(
              padding:
                  const EdgeInsets.only(left: 40, right: 40, top: 8, bottom: 8),
              child: GMButton(
                  size: GMButtonSize.medium,
                  type: GMButtonType.outline,
                  shape: GMButtonShape.filled,
                  theme: GMButtonTheme.defaultTheme,
                  textStyle: TextStyle(color: GMTheme.of(context).fontGyColor4),
                  onTap: () {
                    Navigator.pushNamed(context, '${model.name}?showAction=1');
                  },
                  text: model.text),
            ));
          }
        } else {
          children.add(Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 8, bottom: 8),
            child: GMButton(
                size: GMButtonSize.medium,
                type: GMButtonType.outline,
                shape: GMButtonShape.filled,
                theme: GMButtonTheme.primary,
                onTap: () {
                  Navigator.pushNamed(context, '${model.name}?showAction=1');
                },
                text: model.text),
          ));
        }
      });
    });
    return children;
  }
}

String greenThemeConfig = '''
  {
    "green": {
        "color": {
            "brandNormalColor": "#45c58b"
        }
    },
    "red": {
        "color": {
            "brandNormalColor": "#ff0000"
        }
    }
}
  ''';