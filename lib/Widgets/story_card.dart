import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/Widgets/profile_avatar.dart';
import 'package:facebook_clone/Widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/story_model.dart';
import '../models/user_model.dart';

class StoryCard extends StatelessWidget {
  final bool? isAddStory;
  final User? currentUser;
  final Story? story;

  const StoryCard({super.key, this.isAddStory = false,  this.currentUser,  this.story});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 110.0,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage( imageUrl : isAddStory! ? currentUser!.imageUrl : story!.imageUrl,
            height: double.infinity,
              width: 110.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: 110,
            decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: Responsive.isDesktop(context) ? const [BoxShadow(color: Colors.black26,offset: Offset(0, 2))] :
                  null
            ),
          ),
          Positioned(
            top: 8,
              left: 8,
              child: isAddStory! ?
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.add),
                  iconSize: 30,
                  color: Palette.facebookBlue,
                  onPressed: (){
                    print('Add to Story');
                  },
                ),
              ) : ProfileAvatar(imageUrl: story!.user.imageUrl, hasBorder: story!.isViewed,)
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(isAddStory! ? 'Add to Story' : story!.user.name,
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          )
        ],
      ),
    );
  }
}
