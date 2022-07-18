
import 'package:facebook_clone/Widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/Widgets/responsive.dart';
import '../models/user_model.dart';

class CreatePostWidget extends StatelessWidget {
  final User currentUser;

  const CreatePostWidget({super.key, required this.currentUser});


  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ) : null
      ,
      child: Container(
        padding: const  EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 8,),
                const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "What\'s is in your mind?",
                      ),
                    )
                )
              ],
            ),
            const Divider(height: 10, thickness: .5,),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.video_camera_back),
                      onPressed: null,
                      label: const Text('Live'),),
                  TextButton.icon(
                    icon: const Icon(Icons.photo_library),
                    onPressed: null,
                    label: const Text('Photos/Video'),),
                  TextButton.icon(
                    icon: const Icon(Icons.video_call),
                    onPressed: null,
                    label: const Text('Room'),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
