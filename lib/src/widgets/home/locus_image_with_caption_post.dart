import 'package:flutter/material.dart';

import '../util/image_with_caption_post_content.dart';
import 'locus_post.dart';

class LocusImageWithCaptionPost extends LocusPost {
  LocusImageWithCaptionPost({
    super.key,
    required super.moment,
    required BuildContext context,
  }) : super(
          children: [ImageWithCaptionPostContent(moment.content)],
        );
}
