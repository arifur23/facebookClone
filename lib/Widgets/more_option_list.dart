import 'package:facebook_clone/Widgets/user_card.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/user_model.dart';

class MoreOptionList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [MdiIcons.shieldAccount,Colors.deepPurple, "COVID-19 Info Center"],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events']
  ];
  final User currentUser;

  const MoreOptionList({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      child: ListView.builder(
        itemCount: 1 + _moreOptionsList.length,
        itemBuilder: (context, index){
          if(index == 0){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8 ),
            child: UserCard(user: currentUser),
            );
          }
          final List option = _moreOptionsList[index - 1];
          return  Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _Option(label: option[2], icon: option[0], color: option[1],)
          );

            // const Padding(
            //     padding: EdgeInsets.symmetric(vertical: 8),
            //     child: _Option(label: option[2], icon: option[0], color: null,)
            // );
        }
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

   _Option({super.key, required this.icon, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print(label);
      },
      child: Row(
        children: [
          Icon(icon, size: 38, color: color,),
          const SizedBox(width: 6,),
          Flexible(
              child: Text(
                label,
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              )
          )
        ],
      ),
    );
  }
}

