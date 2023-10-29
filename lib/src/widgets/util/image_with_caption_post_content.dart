import 'package:flutter/material.dart';

import '../../models/content.dart';

class ImageWithCaptionPostContent extends StatelessWidget {
  final Content content;
  
  const ImageWithCaptionPostContent(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            content.url!,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                final percent = loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!;
                return Column(
                  children: [
                    Text(
                      "${(100 * percent).truncate()}%",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.grey.shade50),
                    ),
                    LinearProgressIndicator(
                      value: percent,
                    ),
                  ],
                );
              } else {
                return child;
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 12.0, right: 12.0),
          child: RichText(
            text: TextSpan(
              text: content.content,
              style: TextStyle(
                color: Colors.grey.shade200,
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
