import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

/// A wrapper class to represent a geographic location
@JsonSerializable()
class Location {
  /// The user-friendly name of the place
  final String place;

  /// The latitude of a geographic [Location]
  final double latitude;

  /// The longitude of a geographic [Location]
  final double longitude;

  Location({
    required this.place,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
