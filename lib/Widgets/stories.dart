
import 'package:facebook_clone/Widgets/responsive.dart';
import 'package:facebook_clone/Widgets/story_card.dart';
import 'package:flutter/material.dart';

import '../models/story_model.dart';
import '../models/user_model.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({super.key, required this.currentUser, required this.stories});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: size.width,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:  1 + stories.length,
        itemBuilder: (context, indx) {
          if(indx == 0 ){
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: StoryCard(
                isAddStory: true,
                currentUser: currentUser
              ),
            );
          }
          final Story story = stories[indx - 1];
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: StoryCard(story: story),
          );
        }
      ),
    );
  }
}
