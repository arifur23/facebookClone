import 'package:facebook_clone/Widgets/profile_avatar.dart';
import 'package:facebook_clone/Widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/user_model.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers ;

  const Rooms({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ) : null,
      child: Container(
        height: 60,
        width: size.width,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (context, itm) {
            if(itm == 0){
              return const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[itm - 1];
            return Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ProfileAvatar(imageUrl: user.imageUrl,isActive: true,),);
          }
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        print('Create Room');
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        side: const BorderSide(width: 3.0,
            color: Colors.lightBlue
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
            child: const Icon(Icons.video_call,
            color: Colors.white,
            size: 30.0,),
          ),
          const Text('Create Room')
        ],
      ),
    );
  }
}

