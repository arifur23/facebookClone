import 'package:facebook_clone/Widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../models/user_model.dart';
import 'circle_button.dart';
import 'customtabbar.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({super.key, required this.currentUser, required this.icons, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0,2),
            blurRadius: 4.0
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          const Expanded(
            child: Text('facebook',
                style: TextStyle(
                    color: Palette.facebookBlue,
                    fontSize: 32,
                    letterSpacing: -1.5,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
          Container(
            width: 600,
            height: double.infinity,
            child: CustomTabBar(
              selectedIndex: selectedIndex,
              icons: icons,
              onTap: onTap,
              isBottomIndicator : true
            ),
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UserCard(user : currentUser),
                  const SizedBox(width:12),
                  CircleButton(
                      icon: Icons.search_rounded,
                      onPresses: ()=>print("Messenger"),
                      iconSize: 30
                  ),
                  CircleButton(
                      icon: MdiIcons.facebookMessenger,
                      onPresses: ()=>print("Messenger"),
                      iconSize: 30
                  )
                ],
              ))
        ],
      ),
    );
  }
}
