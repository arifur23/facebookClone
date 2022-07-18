import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../Widgets/circle_button.dart';
import '../Widgets/contact_list.dart';
import '../Widgets/create_post_widget.dart';
import '../Widgets/more_option_list.dart';
import '../Widgets/post_container.dart';
import '../Widgets/responsive.dart';
import '../Widgets/rooms.dart';
import '../Widgets/stories.dart';
import '../config/palette.dart';
import '../data/data.dart';
import '../models/post_model.dart';

class MYHomeScreen extends StatefulWidget {

  @override
  State<MYHomeScreen> createState() => _MYHomeScreenState();
}

class _MYHomeScreenState extends State<MYHomeScreen> {
  final TrackingScrollController trackingScrollController = TrackingScrollController();

  @override
  void dispose(){
    trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(trackingScrollController: trackingScrollController,),
          desktop: _HomeScreenDesktop(trackingScrollController: trackingScrollController,),
          tablet: const Center(child: Text('Tablet Mode')),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController trackingScrollController;

  const _HomeScreenMobile({super.key, required this.trackingScrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: trackingScrollController,
      slivers: [
        SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          title: const Text('facebook',style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28,
              letterSpacing: -1.5,
              fontWeight: FontWeight.bold
          ),),
          actions: [
            CircleButton(icon: Icons.search_rounded, iconSize: 30.00, onPresses: (){ print("search");},),
            CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 30.00, onPresses: (){ print("messenger");},)
          ],
        ),
        const SliverToBoxAdapter(
          child: CreatePostWidget(currentUser: currentUser,),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context, indx){
          final Post post = posts[indx];
          return PostContainer(post : post );
        },
            childCount: posts.length))
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController trackingScrollController;

  const _HomeScreenDesktop({super.key, required this.trackingScrollController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: MoreOptionList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: trackingScrollController,
            slivers: [
              // SliverAppBar(
              //   systemOverlayStyle: SystemUiOverlayStyle.light,
              //   backgroundColor: Colors.white,
              //   title: const Text('facebook',style: TextStyle(
              //       color: Palette.facebookBlue,
              //       fontSize: 28,
              //       letterSpacing: -1.5,
              //       fontWeight: FontWeight.bold
              //   ),),
              //   actions: [
              //     CircleButton(icon: Icons.search_rounded, iconSize: 30.00, onPresses: (){ print("search");},),
              //     CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 30.00, onPresses: (){ print("messenger");},)
              //   ],
              // ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories),
                ),
              ),
              const SliverToBoxAdapter(
                child: CreatePostWidget(currentUser: currentUser,),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),

              SliverList(delegate: SliverChildBuilderDelegate((context, indx){
                final Post post = posts[indx];
                return PostContainer(post : post );
              },
                  childCount: posts.length))
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ContactList(users:onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}


