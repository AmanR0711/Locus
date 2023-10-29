import 'package:json_annotation/json_annotation.dart';

import 'comment.dart';
import 'content.dart';
import 'location.dart';
import 'locus_user.dart';

part 'moment.g.dart';

/// A Locus [Moment]
///
/// Analogous to an Instagram Post or a Twitter Tweet
@JsonSerializable()
class Moment {
  final String title;
  final String momentId;
  final DateTime createdAt;
  final LocusUser creator;
  final Location location;
  final Content content;
  final bool isLiked;
  final List<Comment> comments;

  Moment(
    this.title,
    this.createdAt,
    this.creator,
    this.location,
    this.momentId,
    this.content,
    this.isLiked,
    this.comments,
  );

  factory Moment.fromJson(Map<String, dynamic> json) => _$MomentFromJson(json);

  Map<String, dynamic> toJson() => _$MomentToJson(this);
}
