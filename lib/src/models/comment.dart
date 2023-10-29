import 'package:json_annotation/json_annotation.dart';

import 'locus_user.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final LocusUser user;
  final String comment;

  Comment(this.user, this.comment);

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}