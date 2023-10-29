import 'package:flutter/material.dart';

import '../../models/content.dart';
import '../util/image_with_caption_post_content.dart';
import '../util/text_only_post_content.dart';

class LocusPostContent extends StatelessWidget {
  final Content content;

  const LocusPostContent(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    if(content.url == null){
      return TextOnlyPostContent(content.content);
    } else {
      return ImageWithCaptionPostContent(content);
    }
  }
}
