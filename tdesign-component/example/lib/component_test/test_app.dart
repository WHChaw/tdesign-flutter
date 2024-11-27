import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'tabbar_test.dart';

void main() async {
  kTextNeedGlobalFontFamily = true;
  WidgetsFlutterBinding.ensureInitialized();
  var jsonString = await rootBundle.loadString('assets/theme.json');
  print('jsonString:$jsonString');
  GMTheme.needMultiTheme(true);
  GMTheme.defaultData();
  var themeData = GMThemeData.fromJson('green', jsonString);
  await GMFontLoader.load(
      name: 'test1',
      fontFamilyUrl:
          'https://xinyue.qq.com/m/flutter_web/assets/packages/flutter_component/fonts/FZLanTingHeiS-EB-GB.ttf');
  runApp(MaterialApp(
    home: GMTextConfiguration(
      globalFontFamily: FontFamily(
        fontFamily: 'test1',
      ),
      child: Theme(
          data: ThemeData(extensions: [themeData!]),
          child: Builder(
            builder: (context) {

              ScreenUtil.init(context);
              return Scaffold(
                appBar: _buildAppBar(context),
                // appBar: _buildAppBar(context),
                // body: StudyDetail(),
                body: body(context),
                bottomNavigationBar: _buildBottomTabBar(),
              );
            },
          )),
    ),
  ));
}

Padding body(BuildContext context) {
  return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    GMButton(text: "ixanshi ",onTap: (){
                      GMLoadingController.show(context);

                      GMLoadingController.dismiss();
                    },),
                    // 先显示再加载
                    GMText(
                      '测试文案',
                      textColor: GMTheme.of(context).brandNormalColor,
                      fontFamilyUrl:
                          'https://xinyue.qq.com/m/flutter_web/assets/packages/flutter_component/fonts/FZLanTingHeiS-EB-GB.ttf',
                      fontFamily: FontFamily(fontFamily: 'test'),
                    ),
                    //  // 先加载再显示
                    // child: FutureBuilder(
                    //     future:GMFontLoader.load(name: 'test1', fontFamilyUrl: 'https://xinyue.qq.com/m/flutter_web/assets/packages/flutter_component/fonts/FZLanTingHeiS-EB-GB.ttf'),
                    //   initialData: false,
                    //   builder: (_,data)=>GMText(
                    //     (data.data ?? false) ? '测试文案' : '',
                    //     textColor: GMTheme.of(context).brandNormalColor,
                    //     fontFamilyUrl: 'https://xinyue.qq.com/m/flutter_web/assets/packages/flutter_component/fonts/FZLanTingHeiS-EB-GB.ttf',
                    //     fontFamily: FontFamily(fontFamily: 'test1'),
                    //   ),
                    // ),
                    GMInput(
                      // leftLabel: '标签文字',
                      // controller: controller[0],
                      type: GMInputType.cardStyle,
                      backgroundColor: Colors.white,
                      cardStyle: GMCardStyle.topTextWithBlueBorder,
                      hintText: '请输入文字',
                      cardStyleTopText: '标签文字',
                      // onChanged: (text) {
                      //   setState(() {});
                      // },
                      // onClearTap: () {
                      //   controller[0].clear();
                      //   setState(() {});
                      // },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const GMTextarea(
                      label: '标签文字',
                      hintText: '请输入文字',
                      maxLines: 4,
                      minLines: 4,
                      maxLength: 500,
                      padding: EdgeInsets.zero,
                      indicator: true,
                      // backgroundColor: Colors.white,
                      // textInputBackgroundColor: Colors.white,
                      layout: GMTextareaLayout.vertical,
                      bordered: true,
                    )
                  ],
                ),
              );
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return GMNavBar(
      useDefaultBack: false,
      // screenAdaptation: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.red, Colors.green
              ]
          )
        ),
      ),
      // opacity: 0,
      backgroundColor: Colors.red,
      centerTitle: false,
      titleMargin: 0,
      titleWidget: GMSearchBar(
        needCancel: false,
        autoHeight: true,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
        placeHolder: '搜索预设文案',
        mediumStyle: true,
        style: GMSearchStyle.round,
        onTextChanged: (String text) {
          print('input：$text');
        },
      ),
      rightBarItems: [
        GMNavBarItem(icon: GMIcons.home, iconSize: 24),
        GMNavBarItem(icon: GMIcons.ellipsis, iconSize: 24)
      ]);
}

GMBottomTabBar _buildBottomTabBar() {
  var iconSize = 39 * 60 / 98;
  var textSize = 8.0;
  return GMBottomTabBar(
    GMBottomTabBarBasicType.iconText,
    componentType: GMBottomTabBarComponentType.normal,
    useVerticalDivider: false,
    barHeight: 98 * 60 / 98,
    navigationTabs: [
      GMBottomTabBarTabConfig(
        selectedIcon: Icon(GMIcons.home, size: iconSize, color: Colors.red),
        unselectedIcon: Icon(GMIcons.home, size: iconSize, color: const Color(0xFF383838)),
        tabText: '首页',
        selectTabTextStyle: TextStyle(fontSize: textSize, color: Colors.red),
        unselectTabTextStyle: TextStyle(fontSize: textSize, color: Colors.black),
        onTap: () {
          // context.read<CurrentIndexProvider>().changeIndex(0);
        },
      ),
      GMBottomTabBarTabConfig(
        selectedIcon: Icon(GMIcons.app, size: iconSize, color: Colors.red),
        unselectedIcon: Icon(GMIcons.app, size: iconSize, color: const Color(0xFF383838)),
        tabText: '办事',
        selectTabTextStyle: TextStyle(fontSize: textSize, color: Colors.red),
        unselectTabTextStyle: TextStyle(fontSize: textSize, color: Colors.black),
        onTap: () {
          // context.read<CurrentIndexProvider>().changeIndex(1);
        },
      ),
      GMBottomTabBarTabConfig(
        selectedIcon: Icon(GMIcons.user, size: iconSize, color: Colors.red),
        unselectedIcon: Icon(GMIcons.user, size: iconSize, color: Color(0xFF383838)),
        tabText: '我的',
        selectTabTextStyle: TextStyle(fontSize: textSize, color: Colors.red),
        unselectTabTextStyle: TextStyle(fontSize: textSize, color: Colors.black),
        onTap: () {
          // context.read<CurrentIndexProvider>().changeIndex(2);
        },
      ),
    ],
  );
}
