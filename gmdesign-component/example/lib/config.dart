import 'package:flutter/material.dart';

import 'base/example_base.dart';
import 'page/sidebar/gm_sidebar_page.dart';
import 'page/sidebar/gm_sidebar_page_anchor.dart';
import 'page/sidebar/gm_sidebar_page_custom.dart';
import 'page/sidebar/gm_sidebar_page_icon.dart';
import 'page/sidebar/gm_sidebar_page_loading.dart';
import 'page/sidebar/gm_sidebar_page_outline.dart';
import 'page/sidebar/gm_sidebar_page_pagination.dart';
import 'page/gm_avatar_page.dart';
import 'page/gm_backtop_page.dart';
import 'page/gm_badge_page.dart';
import 'page/gm_bottom_tab_bar_page.dart';
import 'page/gm_button_page.dart';
import 'page/gm_calendar_page.dart';
import 'page/gm_cascader_page.dart';
import 'page/gm_cell_page.dart';
import 'page/gm_checkbox_page.dart';
import 'page/gm_collapse.dart';
import 'page/gm_date_picker_page.dart';
import 'page/gm_dialog_page.dart';
import 'page/gm_divider_page.dart';
import 'page/gm_drawer_page.dart';
import 'page/gm_dropdown_menu_page.dart';
import 'page/gm_empty_page.dart';
import 'page/gm_fab_page.dart';
import 'page/gm_font_page.dart';
import 'page/gm_icon_page.dart';
import 'page/gm_image_page.dart';
import 'page/gm_image_viewer_page.dart';
import 'page/gm_indexes_page.dart';
import 'page/gm_input_page.dart';
import 'page/gm_link_page.dart';
import 'page/gm_loading_page.dart';
import 'page/gm_navbar_page.dart';
import 'page/gm_notice_bar_page.dart';
import 'page/gm_picker_page.dart';
import 'page/gm_popup_page.dart';
import 'page/gm_radio_page.dart';
import 'page/gm_radius_page.dart';
import 'page/gm_rate_page.dart';
import 'page/gm_refresh_page.dart';
import 'page/gm_result_page.dart';
import 'page/gm_search_bar_page.dart';
import 'page/gm_shadows_page.dart';
import 'page/gm_slider_page.dart';
import 'page/gm_stepper_page.dart';
import 'page/gm_steps_page.dart';
import 'page/gm_swipe_cell_page.dart';
import 'page/gm_swiper_page.dart';
import 'page/gm_switch_page.dart';
import 'page/gm_table_page.dart';
import 'page/gm_tabs_page.dart';
import 'page/gm_tag_page.dart';
import 'page/gm_text_page.dart';
import 'page/gm_textarea_page.dart';
import 'page/gm_theme_page.dart';
import 'page/gm_time_counter_page.dart';
import 'page/gm_toast_page.dart';
import 'page/gm_tree_select_page.dart';
import 'page/todo_page.dart';

PageBuilder _wrapInheritedTheme(WidgetBuilder builder) {
  return (context, model) {
    return ExamplePageInheritedTheme(model: model, child: builder(context));
  };
}

/// 新增的示例页面，在此增加模型即可,会自动注册增加按钮。示例页面编写参考GMTextPage()
List<ExamplePageModel> examplePageList = [];

Map<String, List<ExamplePageModel>> exampleMap = {
  '基础': [
    ExamplePageModel(
        text: 'Button 按钮', name: 'button', pageBuilder: _wrapInheritedTheme((context) => const GMButtonPage())),
    ExamplePageModel(
        text: 'Divider 分割线', name: 'divider', pageBuilder: _wrapInheritedTheme((context) => const GMDividerPage())),
    ExamplePageModel(
        text: 'Fab 悬浮按钮', name: 'fab',  pageBuilder: _wrapInheritedTheme((context) => const GMFabPage())),
    ExamplePageModel(text: 'Icon 图标', name: 'icon', pageBuilder: _wrapInheritedTheme((context) => const GMIconPage())),
    ExamplePageModel(
        text: 'Link 链接', name: 'link', pageBuilder: _wrapInheritedTheme((context) => const GMLinkViewPage())),
    ExamplePageModel(text: 'Text 文本', name: 'text', pageBuilder: _wrapInheritedTheme((context) => const GMTextPage())),
  ],
  '导航': [
    ExamplePageModel(
        text: 'BackTop 返回顶部',
        name: 'back-top',
        pageName: 'backtop',
        pageBuilder: _wrapInheritedTheme((context) => const GMBackTopPage())),
    ExamplePageModel(
        text: 'Drawer 抽屉',
        name: 'drawer',
        pageBuilder: _wrapInheritedTheme((context) => const GMDrawerPage())),
    ExamplePageModel(
        text: 'Indexes 索引',
        name: 'indexes',
        pageBuilder: _wrapInheritedTheme((context) => const GMIndexesPage())),
    ExamplePageModel(
        text: 'NavBar 导航栏', name: 'navbar', pageBuilder: _wrapInheritedTheme((context) => const GMNavBarPage())),
    ExamplePageModel(
        text: 'SideBar 侧边栏', name: 'side-bar',pageBuilder: _wrapInheritedTheme((context) => const GMSideBarPage())),
    ExamplePageModel(text: 'Steps 步骤条', name: 'steps', pageBuilder: _wrapInheritedTheme((context) => const GMStepsPage())),
    ExamplePageModel(
        text: 'TabBar 标签栏', name: 'tab-bar',
        pageName: 'bottom_tab_bar',pageBuilder: _wrapInheritedTheme((context) => const GMBottomTabBarPage())),
    ExamplePageModel(text: 'Tabs 选项卡', name: 'tabs', pageBuilder: _wrapInheritedTheme((context) => const GMTabsPage())),
  ],
  '输入': [
    ExamplePageModel(
        text: 'Calendar 日历',
        name: 'calendar',
        pageBuilder: _wrapInheritedTheme((context) => const GMCalendarPage())),
    ExamplePageModel(
        text: 'Cascader 级联选择器',
        name: 'cascader',
        pageBuilder: _wrapInheritedTheme((context) => const GMCascaderPage())),
    ExamplePageModel(
        text: 'Checkbox 多选框', name: 'checkbox', pageBuilder: _wrapInheritedTheme((context) => const GMCheckboxPage())),
    ExamplePageModel(
        text: 'DateTimePicker 时间选择器',
        name: 'date-time-picker',
        pageName: 'data_picker',
        pageBuilder: _wrapInheritedTheme((context) => const GMDatePickerPage())),
    ExamplePageModel(
        text: 'Input 输入框', name: 'input', pageBuilder: _wrapInheritedTheme((context) => const GMInputViewPage())),
    ExamplePageModel(
        text: 'Picker 选择器', name: 'picker', pageBuilder: _wrapInheritedTheme((context) => const GMPickerPage())),
    ExamplePageModel(
        text: 'Radio 单选框', name: 'radio', pageBuilder: _wrapInheritedTheme((context) => const GMRadioPage())),
    ExamplePageModel(
        text: 'Rate 评分', name: 'rate', pageBuilder: _wrapInheritedTheme((context) => const GMRatePage())),
    ExamplePageModel(
        text: 'Search 搜索框', name: 'search', pageBuilder: _wrapInheritedTheme((context) => const GMSearchBarPage())),
    ExamplePageModel(
        text: 'Slider 滑动选择器', name: 'slider', pageBuilder: _wrapInheritedTheme((context) => const GMSliderPage())),
    ExamplePageModel(
        text: 'Stepper 步进器', name: 'stepper', pageBuilder: _wrapInheritedTheme((context) => const GMStepperPage())),
    ExamplePageModel(
        text: 'Switch 开关', name: 'switch', pageBuilder: _wrapInheritedTheme((context) => const GMSwitchPage())),
    ExamplePageModel(
        text: 'Textarea 多行文本框',
        name: 'textarea',
        pageBuilder: _wrapInheritedTheme((context) => const GMTextareaPage())),
    ExamplePageModel(
        text: 'TreeSelect 树形选择器',
        name: 'tree-select',
        pageName: 'tree_select',
        pageBuilder: _wrapInheritedTheme((context) => const GMTreeSelectPage())),
    ExamplePageModel(
        text: 'Upload 上传',
        name: 'upload',
        isTodo: true,
        pageBuilder: _wrapInheritedTheme((context) => const TodoPage())),
  ],
  '数据展示': [
    ExamplePageModel(
        text: 'Avatar 头像', name: 'avatar', pageBuilder: _wrapInheritedTheme((context) => const GMAvatarPage())),
    ExamplePageModel(
        text: 'Badge 徽标', name: 'badge', pageBuilder: _wrapInheritedTheme((context) => const GMBadgePage())),
    ExamplePageModel(
        text: 'Cell 单元格', name: 'cell', pageBuilder: _wrapInheritedTheme((context) => const GMCellPage())),
    ExamplePageModel(
        text: 'TimeCounter 计时器',
        name: 'time-counter',
        pageBuilder: _wrapInheritedTheme((context) => const GMTimeCounterPage())),
    ExamplePageModel(
        text: 'Collapse 折叠面板',
        name: 'collapse',
        pageBuilder: _wrapInheritedTheme((context) => const GMCollapsePage())),
    ExamplePageModel(
        text: 'Empty 空状态', name: 'empty', pageBuilder: _wrapInheritedTheme((context) => const GMEmptyPage())),
    ExamplePageModel(
        text: 'Footer 页脚',
        name: 'footer',
        isTodo: true,
        pageBuilder: _wrapInheritedTheme((context) => const TodoPage())),
    ExamplePageModel(
        text: 'Grid 宫格', name: 'grid', isTodo: true, pageBuilder: _wrapInheritedTheme((context) => const TodoPage())),
    ExamplePageModel(
        text: 'Image 图片', name: 'image', pageBuilder: _wrapInheritedTheme((context) => const GMImagePage())),
    ExamplePageModel(
        text: 'ImageViewer 图片预览',
        name: 'image-viewer',
        pageName: 'image_viewer',
        pageBuilder: _wrapInheritedTheme((context) => const GMImageViewerPage())),
    ExamplePageModel(
        text: 'Progress 进度条',
        name: 'progress',
        isTodo: true,
        pageBuilder: _wrapInheritedTheme((context) => const TodoPage())),
    ExamplePageModel(
        text: 'Result 结果',
        name: 'result',
        pageBuilder: _wrapInheritedTheme((context) => const GMResultPage())),
    ExamplePageModel(
        text: 'Skeleton 骨架屏',
        name: 'skeleton',
        isTodo: true,
        pageBuilder: _wrapInheritedTheme((context) => const TodoPage())),
    ExamplePageModel(
        text: 'Sticky 吸顶',
        name: 'sticky',
        isTodo: true,
        pageBuilder: _wrapInheritedTheme((context) => const TodoPage())),
    ExamplePageModel(
        text: 'Swiper 轮播图', name: 'swiper', pageBuilder: _wrapInheritedTheme((context) => const GMSwiperPage())),
    ExamplePageModel(text: 'Table 表格', name: 'table', pageBuilder: _wrapInheritedTheme((context) => const GMTablePage())),
    ExamplePageModel(text: 'Tag 标签', name: 'tag', pageBuilder: _wrapInheritedTheme((context) => const GMTagPage())),
  ],
  '反馈': [
    ExamplePageModel(
        text: 'ActionSheet 动作面板',
        name: 'action_sheet',
        isTodo: true,
        pageBuilder: _wrapInheritedTheme((context) => const TodoPage())),
    ExamplePageModel(
        text: 'Dialog 对话框', name: 'dialog', pageBuilder: _wrapInheritedTheme((context) => const GMDialogPage())),
    ExamplePageModel(
        text: 'DropdownMenu 下拉菜单',
        name: 'dropdown-menu',
        pageName: 'dropdown_menu',
        pageBuilder: _wrapInheritedTheme((context) => const GMDropdownMenuPage())),
    ExamplePageModel(
        text: 'Loading 加载', name: 'loading', pageBuilder: _wrapInheritedTheme((context) => const GMLoadingPage())),
    ExamplePageModel(
        text: 'Message 消息通知',
        name: 'message',
        isTodo: true,
        pageBuilder: _wrapInheritedTheme((context) => const TodoPage())),
    ExamplePageModel(
        text: 'NoticeBar 公告栏', name: 'notice-bar', pageBuilder: _wrapInheritedTheme((context) => const GMNoticeBarPage())),
    ExamplePageModel(
        text: 'Overlay 遮罩层',
        name: 'overlay',
        isTodo: true,
        pageBuilder: _wrapInheritedTheme((context) => const TodoPage())),
    ExamplePageModel(
        text: 'Popup 弹出层', name: 'popup', pageBuilder: _wrapInheritedTheme((context) => const GMPopupPage())),
    ExamplePageModel(
        text: 'PullDownRefresh 下拉刷新',
        name: 'pull-down-refresh',
        pageName: 'refresh',
        pageBuilder: _wrapInheritedTheme((context) => const GMPullDownRefreshPage())),
    ExamplePageModel(
        text: 'Swipecell 滑动操作',
        name: 'swipe-cell',
        pageName: 'swipe_cell',
        pageBuilder: _wrapInheritedTheme((context) => const GMSwipeCellPage())),
    ExamplePageModel(
        text: 'Toast 轻提示', name: 'toast', pageBuilder: _wrapInheritedTheme((context) => const GMToastPage())),
  ],
  '主题': [
    ExamplePageModel(
        text: '颜色', name: 'theme_colors', pageBuilder: _wrapInheritedTheme((context) => const GMThemeColorsPage())),
    ExamplePageModel(text: '字体', name: 'font', pageBuilder: _wrapInheritedTheme((context) => const GMFontPage())),
    ExamplePageModel(text: '圆角', name: 'radius', pageBuilder: _wrapInheritedTheme((context) => const GMRadiusPage())),
    ExamplePageModel(text: '阴影', name: 'shadows', pageBuilder: _wrapInheritedTheme((context) => const GMShadowsPage())),
  ],
};

List<ExamplePageModel> sideBarExamplePage = [
  ExamplePageModel(
      text: 'SideBar 切页',
      name: 'SideBarPagination',
      isTodo: false,
      pageBuilder: _wrapInheritedTheme((context) => const GMSideBarPaginationPage())),
  ExamplePageModel(
      text: 'SideBar 锚点',
      name: 'SideBarAnchor',
      isTodo: false,
      pageBuilder: _wrapInheritedTheme((context) => const GMSideBarAnchorPage())),
  ExamplePageModel(
      text: 'SideBar 带图标',
      name: 'SideBarIcon',
      isTodo: false,
      pageBuilder: _wrapInheritedTheme((context) => const GMSideBarIconPage())),
  ExamplePageModel(
      text: 'SideBar 非通栏选项样式',
      name: 'SideBarOutline',
      isTodo: false,
      pageBuilder: _wrapInheritedTheme((context) => const GMSideBarOutlinePage())),
  ExamplePageModel(
      text: 'SideBar 自定义样式',
      name: 'SideBarCustom',
      isTodo: false,
      pageBuilder: _wrapInheritedTheme((context) => const GMSideBarCustomPage())),
  ExamplePageModel(
      text: 'SideBar 延迟加载',
      name: 'SideBarLoading',
      isTodo: false,
      pageBuilder: _wrapInheritedTheme((context) => const GMSideBarLoadingPage()))
];
