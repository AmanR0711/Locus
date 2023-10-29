import 'package:flutter/material.dart';

import '../util/text_only_post_content.dart';
import 'locus_post.dart';

class LocusTextOnlyPost extends LocusPost {
  LocusTextOnlyPost({
    super.key,
    required BuildContext context,
    required super.moment,
  }) : super(children: [TextOnlyPostContent(moment.content.content)]);
}
