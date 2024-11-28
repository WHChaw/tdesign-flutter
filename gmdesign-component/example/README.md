# gmdesign_flutter_example

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 主题加载及切换

#### 加载css配置文件

1.  注册theme.css

    1.  在pubspec.yaml中配置`assets/theme\_black.css\`
        
    2.  在main函数中


```dart
void main() async {

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
}
```

2.  设置theme


```dart
//初始化ThemeData 
@override
void initState() {
  super.initState();
  _themeData = GMThemeData.defaultData();
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    theme: ThemeData(extensions: [_themeData], colorScheme: ColorScheme.light(primary: _themeData.brandNormalColor)),
    home: MyHomePage(...),  
  );
}
```

3.  根据name生成theme


通过GMTheme.loadThemeData('ThemeName')，获取themeData

```dart
GMButton(
  text: AppLocalizations.of(context)?.greenTheme,
  theme: GMButtonTheme.primary,
  onTap: () async {

    widget.onThemeChange?.call(await GMTheme.loadThemeData('black'));
  })
```

4.  切换theme


```dart
setState(() {
  _themeData = themeData;
});
```

#### 加载json配置文件

*   获取默认的ThemeData


```dart
 GMThemeData.defaultData();
```

*   从theme.json读取


```dart
 var jsonString = await rootBundle.loadString('assets/theme.json');
                    var newData = GMThemeData.fromJson('green', jsonString);
```