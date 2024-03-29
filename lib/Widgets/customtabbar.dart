import 'package:flutter/material.dart';

import '../config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  const CustomTabBar({super.key, required this.icons, required this.selectedIndex, required this.onTap, required this.isBottomIndicator});


  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: isBottomIndicator ? const Border(
          bottom: BorderSide(
            color: Palette.facebookBlue,
            width: 3
          )
        ) : const Border(
            top: BorderSide(
                color: Palette.facebookBlue,
                width: 3
            )
        )
      ),
        tabs: icons
        .asMap()
        .map((i, value) =>MapEntry(i,
        Tab(
          icon: Icon(value,
          color: i == selectedIndex ? Palette.facebookBlue : Colors.black38,
            size: 30,
          ),
        ),
        ) ).values.toList(),
      onTap: onTap,
    );
  }
}
