import 'package:flutter/material.dart';

import '../models/locus_user.dart';
import '../widgets/profile/view_follow_card.dart';

class ViewFollowScreen extends StatefulWidget {
  final String title;
  final List<LocusUser> users;
  const ViewFollowScreen(this.title, this.users, {super.key});

  @override
  State<ViewFollowScreen> createState() => _ViewFollowScreenState();
}

class _ViewFollowScreenState extends State<ViewFollowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (c, i) => ViewFollowCard(widget.users[i]),
        itemCount: widget.users.length,
      ),
    );
  }
}
