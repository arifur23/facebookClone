import 'package:facebook_clone/Widgets/user_card.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class ContactList extends StatelessWidget {
  final List<User> users;

  const ContactList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text('Contacts',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),)
              ),
              Icon(Icons.search,
                color: Colors.grey[600],),
              const SizedBox(width: 8,),
              Icon(Icons.more_horiz,
                color: Colors.grey[600],)
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: users.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index){
                final User user = users[index];
                return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: UserCard(user:user)
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
