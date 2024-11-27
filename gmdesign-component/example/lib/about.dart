import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  String? version;

  @override
  void initState() {
    super.initState();
    _getVersion();
  }

  Future<void> _getVersion() async {
    version = await rootBundle.loadString('assets/version');
    setState(() {});
  }
  
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GMTheme.of(context).grayColor1,
      appBar: AppBar(title: GMText('关于我们', textColor: GMTheme.of(context).whiteColor1,),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            demoRow(context, '版本号：',desc: version)
          ],
        ),
      ),
    );
  }

  Widget demoRow(
      BuildContext context,
      String? title, {
        String? desc,
        bool on = true,
        bool enable = true,
        Color? onColor,
        Color? offColor,
      }) {
    final theme = GMTheme.of(context);
    Widget current = Row(
      children: [
        Expanded(
            child: GMText(
              title,
              textColor: theme.fontGyColor1,
            )),
        GMText(
          desc ?? '',
          textColor: theme.grayColor6,
          forceVerticalCenter: true,
        ),
      ],
    );
    current = Container(
      color: GMTheme.of(context).whiteColor1,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 1, top: 1),
      child: current,
      height: 44,
    );
    return current;
  }
}
