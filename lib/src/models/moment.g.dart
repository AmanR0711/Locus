// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Moment _$MomentFromJson(Map<String, dynamic> json) => Moment(
      json['title'] as String,
      DateTime.parse(json['createdAt'] as String),
      LocusUser.fromJson(json['creator'] as Map<String, dynamic>),
      Location.fromJson(json['location'] as Map<String, dynamic>),
      json['momentId'] as String,
      Content.fromJson(json['content'] as Map<String, dynamic>),
      json['isLiked'] as bool,
      (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MomentToJson(Moment instance) => <String, dynamic>{
      'title': instance.title,
      'momentId': instance.momentId,
      'createdAt': instance.createdAt.toIso8601String(),
      'creator': instance.creator,
      'location': instance.location,
      'content': instance.content,
      'isLiked': instance.isLiked,
      'comments': instance.comments,
    };
