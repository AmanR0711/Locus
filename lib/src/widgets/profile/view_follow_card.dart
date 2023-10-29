import 'package:flutter/material.dart';

import '../../models/locus_user.dart';
import '../../screens/profile_screen.dart';

class ViewFollowCard extends StatelessWidget {
  final LocusUser user;

  const ViewFollowCard(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
        title: Text(user.name),
        subtitle: Text(user.username),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => ProfileScreen(user),
            ),
          ),
        ),
      ),
    );
  }
}
