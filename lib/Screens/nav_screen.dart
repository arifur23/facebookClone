
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../Widgets/custom_app_bar.dart';
import '../Widgets/customtabbar.dart';
import '../Widgets/responsive.dart';
import '../data/data.dart';
import 'my_home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screen = [
    MYHomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context) ?
        PreferredSize(
            preferredSize: Size(size.width, 100.0),
            child: CustomAppBar(
              currentUser : currentUser,
              icons: _icons,
              selectedIndex : _selectedIndex,
              onTap : (index) => setState(()=> _selectedIndex = index),
            )) : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screen,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context) ?  Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CustomTabBar(
            icons : _icons,
            selectedIndex : _selectedIndex,
            onTap : (index) => setState(() => _selectedIndex = index), isBottomIndicator: true,
          ),
        ) : const SizedBox.shrink(),
      ),
    );
  }
}
