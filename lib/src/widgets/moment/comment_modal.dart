import 'package:flutter/material.dart';

import '../../models/comment.dart';
import 'locus_comment.dart';

class CommentModal extends StatelessWidget {
  final List<Comment> comments;
  const CommentModal(this.comments, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Comments",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.grey.shade50,
                ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemBuilder: (c, i) => LocusComment(comments[i]),
            itemCount: comments.length,
          ),
        ),
      ],
    );
  }
}
