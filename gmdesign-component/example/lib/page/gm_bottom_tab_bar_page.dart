import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../../annotation/demo.dart';
import '../../base/example_widget.dart';

Widget? _selectedIcon;

Widget? _unSelectedIcon;

class GMBottomTabBarPage extends StatefulWidget {
  const GMBottomTabBarPage({Key? key}) : super(key: key);

  @override
  State<GMBottomTabBarPage> createState() => _GMBottomTabBarPageState();
}

class _GMBottomTabBarPageState extends State<GMBottomTabBarPage> {



  void onTapTab(BuildContext context, String tabName) {
    GMToast.showText('点击了 $tabName', context: context);
  }

  @override
  Widget build(BuildContext context) {
    _selectedIcon = Icon(
      GMIcons.app,
      size: 20,
      color: GMTheme.of(context).brandNormalColor,
    );
    _unSelectedIcon = Icon(
      GMIcons.app,
      size: 20,
      color: GMTheme.of(context).brandNormalColor,
    );
    return ExamplePage(
      title: tdTitle(),
      desc: '用于在不同功能模块之间进行快速切换，位于页面底部。',
      exampleCodeGroup: 'bottomTabBar',
      children: [
        ExampleModule(
          title: '组件类型',
          children: [
            ExampleItem(
                ignoreCode: true,
                desc: '纯文本标签栏',
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CodeWrapper(builder: _textTypeTabBar),
                  );
                }),
            ExampleItem(
                ignoreCode: true,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CodeWrapper(builder: _textTypeTabBar3tabs),
                  );
                }),
            ExampleItem(
                ignoreCode: true,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CodeWrapper(builder: _textTypeTabBar4tabs),
                  );
                }),
            ExampleItem(
                ignoreCode: true,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CodeWrapper(builder: _textTypeTabBar5tabs),
                  );
                }),
            ExampleItem(
                ignoreCode: true,
                desc: '图标加文本标签栏',
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CodeWrapper(builder: _iconTextTypeTabBar),
                  );
                }),
            ExampleItem(
                ignoreCode: true,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CodeWrapper(builder: _iconTextTypeTabBar3tabs),
                  );
                }),
            ExampleItem(
                ignoreCode: true,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CodeWrapper(builder: _iconTextTypeTabBar4tabs),
                  );
                }),
            ExampleItem(
                ignoreCode: true,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CodeWrapper(builder: _iconTextTypeTabBar5tabs),
                  );
                }),
            ExampleItem(
                ignoreCode: true,
                desc: '纯图标标签栏',
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CodeWrapper(builder: _iconTypeTabBar),
                  );
                }),
            ExampleItem(
                ignoreCode: true,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CodeWrapper(builder: _iconTypeTabBar3tabs),
                  );
                }),
            ExampleItem(
                ignoreCode: true,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CodeWrapper(builder: _iconTypeTabBar4tabs),
                  );
                }),
            ExampleItem(
                ignoreCode: true,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CodeWrapper(builder: _iconTypeTabBar5tabs),
                  );
                }),
            ExampleItem(
              desc: '双层级文本标签栏',
              builder: _expansionPanelTypeTabBar,
            ),
          ],
        ),
        ExampleModule(title: '组件样式', children: [
          ExampleItem(
              ignoreCode: true,
              desc: '弱选中标签栏',
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CodeWrapper(builder: _weakSelectTextTabBar),
                );
              }),
          ExampleItem(
              ignoreCode: true,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CodeWrapper(builder: _weakSelectIconTabBar),
                );
              }),
          ExampleItem(
              ignoreCode: true,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CodeWrapper(builder: _weakSelectIconTextTabBar),
                );
              }),
          ExampleItem(
            desc: '悬浮胶囊标签栏',
            builder: _capsuleTabBar,
          ),
        ]),
      ],
      test: [
        ExampleItem(desc: '自定义上边线样式', builder: _buildCustomTopStyle),
        ExampleItem(desc: '自定义选择的背景颜色', builder: _customBgColor),
        ExampleItem(
            ignoreCode: true,
            desc: '设置文本标签栏背景',
            builder: (context) {
              return CodeWrapper(builder: _customBgTypeTabBar);
            }),
        ExampleItem(
            ignoreCode: true,
            desc: '外部设置tabbar的选中项',
            builder: (context) {
              return CodeWrapper(builder: _setCurrentIndexToTabBar);
            }),
      ],
    );
  }

  @Demo(group: 'bottomTabBar')
  Widget _textTypeTabBar(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.text, useVerticalDivider: false, navigationTabs: [
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
    ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _textTypeTabBar3tabs(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.text, useVerticalDivider: false, navigationTabs: [
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
    ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _textTypeTabBar4tabs(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.text, useVerticalDivider: false, navigationTabs: [
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
    ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _textTypeTabBar5tabs(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.text, useVerticalDivider: false, navigationTabs: [
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
    ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _iconTextTypeTabBar(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.iconText, useVerticalDivider: false, navigationTabs: [
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签2');
        },
      ),
    ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _iconTextTypeTabBar3tabs(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.iconText, useVerticalDivider: false, navigationTabs: [
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签2');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签2');
        },
      ),
    ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _iconTextTypeTabBar4tabs(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.iconText, useVerticalDivider: false, navigationTabs: [
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签2');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签2');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签2');
        },
      ),
    ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _iconTextTypeTabBar5tabs(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.iconText, useVerticalDivider: false, navigationTabs: [
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签1');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签2');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签2');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签2');
        },
      ),
      GMBottomTabBarTabConfig(
        tabText: '标签',
        selectedIcon: _selectedIcon,
        unselectedIcon: _unSelectedIcon,
        onTap: () {
          onTapTab(context, '标签2');
        },
      ),
    ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _iconTypeTabBar(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.icon, useVerticalDivider: true, navigationTabs: [
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签1');
          }),
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签2');
          })
    ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _iconTypeTabBar3tabs(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.icon, useVerticalDivider: true, navigationTabs: [
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签1');
          }),
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签2');
          }),
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签2');
          }),
    ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _iconTypeTabBar4tabs(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.icon, useVerticalDivider: true, navigationTabs: [
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签1');
          }),
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签2');
          }),
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签2');
          }),
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签2');
          }),
    ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _iconTypeTabBar5tabs(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.icon, useVerticalDivider: true, navigationTabs: [
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签1');
          }),
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签2');
          }),
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签2');
          }),
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签2');
          }),
      GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, '标签2');
          }),
    ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _expansionPanelTypeTabBar(BuildContext context) {
    return GMBottomTabBar(
      GMBottomTabBarBasicType.expansionPanel,
      useVerticalDivider: true,
      navigationTabs: [
        GMBottomTabBarTabConfig(
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签1');
          },
        ),
        GMBottomTabBarTabConfig(
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签2');
          },
        ),
        GMBottomTabBarTabConfig(
            tabText: '展开项',
            onTap: () {
              onTapTab(context, '展开项');
            },
            popUpButtonConfig: GMBottomTabBarPopUpBtnConfig(
                popUpDialogConfig: GMBottomTabBarPopUpShapeConfig(
                  radius: 10,
                  arrowWidth: 16,
                  arrowHeight: 8,
                ),
                items: [
                  '展开项一',
                  '展开项二',
                  '展开项三',
                ]
                    .reversed
                    .map((e) => PopUpMenuItem(
                          value: e,
                          itemWidget: SizedBox(
                            //height: 30,
                            child: Text(
                              e,
                              style: TextStyle(color: GMTheme.of(context).fontGyColor1, fontSize: 16),
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (v) {
                  GMToast.showText('点击了 $v', context: context);
                })),
      ],
    );
  }

  @Demo(group: 'bottomTabBar')
  Widget _weakSelectTextTabBar(BuildContext context) {
    return GMBottomTabBar(
      GMBottomTabBarBasicType.text,
      componentType: GMBottomTabBarComponentType.normal,
      useVerticalDivider: true,
      navigationTabs: [
        GMBottomTabBarTabConfig(
          badgeConfig: BadgeConfig(
            showBadge: true,
            tdBadge: const GMBadge(GMBadgeType.redPoint),
            badgeTopOffset: -2,
            badgeRightOffset: -10,
          ),
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签1');
          },
        ),
        GMBottomTabBarTabConfig(
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签2');
          },
        ),
        GMBottomTabBarTabConfig(
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签3');
          },
        ),
      ],
    );
  }

  @Demo(group: 'bottomTabBar')
  Widget _weakSelectIconTabBar(BuildContext context) {
    return GMBottomTabBar(
      GMBottomTabBarBasicType.icon,
      componentType: GMBottomTabBarComponentType.normal,
      useVerticalDivider: false,
      navigationTabs: [
        GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          badgeConfig: BadgeConfig(
            showBadge: true,
            tdBadge: const GMBadge(GMBadgeType.redPoint),
            badgeTopOffset: -2,
            badgeRightOffset: -10,
          ),
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签1');
          },
        ),
        GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签2');
          },
        ),
        GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签3');
          },
        ),
      ],
    );
  }

  @Demo(group: 'bottomTabBar')
  Widget _weakSelectIconTextTabBar(BuildContext context) {
    return GMBottomTabBar(
      GMBottomTabBarBasicType.iconText,
      componentType: GMBottomTabBarComponentType.normal,
      useVerticalDivider: false,
      navigationTabs: [
        GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          badgeConfig: BadgeConfig(
            showBadge: true,
            tdBadge: const GMBadge(GMBadgeType.redPoint),
            badgeTopOffset: -2,
            badgeRightOffset: -10,
          ),
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签1');
          },
        ),
        GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签2');
          },
        ),
        GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签3');
          },
        ),
      ],
    );
  }

  @Demo(group: 'bottomTabBar')
  Widget _capsuleTabBar(BuildContext context) {
    return GMBottomTabBar(
      GMBottomTabBarBasicType.iconText,
      componentType: GMBottomTabBarComponentType.label,
      outlineType: GMBottomTabBarOutlineType.capsule,
      useVerticalDivider: true,
      navigationTabs: [
        GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签1');
          },
        ),
        GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签2');
          },
        ),
        GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签3');
          },
        ),
      ],
    );
  }

  @Demo(group: 'bottomTabBar')
  Widget _buildCustomTopStyle(BuildContext context) {
    return GMBottomTabBar(
      GMBottomTabBarBasicType.iconText,
      topBorder: const BorderSide(color: Colors.red, width: 5),
      barHeight: 61,
      componentType: GMBottomTabBarComponentType.normal,
      useVerticalDivider: false,
      navigationTabs: [
        GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          badgeConfig: BadgeConfig(
            showBadge: true,
            tdBadge: const GMBadge(GMBadgeType.redPoint),
            badgeTopOffset: -2,
            badgeRightOffset: -10,
          ),
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签1');
          },
        ),
        GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签2');
          },
        ),
        GMBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签3');
          },
        ),
      ],
    );
  }

  @Demo(group: 'bottomTabBar')
  Widget _customBgColor(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.iconText,
        useVerticalDivider: false,
        selectedBgColor: GMTheme.of(context).errorColor3,
        unselectedBgColor: GMTheme.of(context).grayColor3,
        navigationTabs: [
          GMBottomTabBarTabConfig(
            tabText: '标签',
            selectedIcon: _selectedIcon,
            unselectedIcon: _unSelectedIcon,
            onTap: () {
              onTapTab(context, '标签1');
            },
          ),
          GMBottomTabBarTabConfig(
            tabText: '标签',
            selectedIcon: _selectedIcon,
            unselectedIcon: _unSelectedIcon,
            onTap: () {
              onTapTab(context, '标签2');
            },
          ),
          GMBottomTabBarTabConfig(
            tabText: '标签',
            selectedIcon: _selectedIcon,
            unselectedIcon: _unSelectedIcon,
            onTap: () {
              onTapTab(context, '标签2');
            },
          ),
          GMBottomTabBarTabConfig(
            tabText: '标签',
            selectedIcon: _selectedIcon,
            unselectedIcon: _unSelectedIcon,
            onTap: () {
              onTapTab(context, '标签2');
            },
          ),
          GMBottomTabBarTabConfig(
            tabText: '标签',
            selectedIcon: _selectedIcon,
            unselectedIcon: _unSelectedIcon,
            onTap: () {
              onTapTab(context, '标签2');
            },
          ),
        ]);
  }

  @Demo(group: 'bottomTabBar')
  Widget _customBgTypeTabBar(BuildContext context) {
    return GMBottomTabBar(GMBottomTabBarBasicType.text,
        backgroundColor: GMTheme.of(context).successColor6,
        selectedBgColor: GMTheme.of(context).errorColor1,
        unselectedBgColor: GMTheme.of(context).brandColor1,
        useVerticalDivider: false,
        navigationTabs: [
          GMBottomTabBarTabConfig(
            tabText: '标签',
            onTap: () {
              onTapTab(context, '标签1');
            },
          ),
          GMBottomTabBarTabConfig(
            tabText: '标签',
            unselectTabTextStyle: TextStyle(color: GMTheme.of(context).fontGyColor1),
            onTap: () {
              onTapTab(context, '标签1');
            },
          ),
        ]);
  }


  var currentIndex = 0;
  @Demo(group: 'bottomTabBar')
  Widget _setCurrentIndexToTabBar(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: PageView(
            children: const [
              Center(
                child: GMText('页面1,手指左滑查看页面2'),
              ),
              Center(
                child: GMText('页面2,手指右滑查看页面1'),
              ),
            ],
            onPageChanged: (index) {
              setState(() {
                // 修改选择index
                currentIndex = index;
              });
            },
          )),
          GMBottomTabBar(
            // 设置选择index
              currentIndex: currentIndex,
              GMBottomTabBarBasicType.icon,
              useVerticalDivider: true,
              navigationTabs: [
                GMBottomTabBarTabConfig(
                    selectedIcon: _selectedIcon,
                    unselectedIcon: _unSelectedIcon,
                    onTap: () {
                      onTapTab(context, '标签1');
                    }),
                GMBottomTabBarTabConfig(
                    selectedIcon: _selectedIcon,
                    unselectedIcon: _unSelectedIcon,
                    onTap: () {
                      onTapTab(context, '标签2');
                    })
              ])
        ],
      ),
    );
  }
}