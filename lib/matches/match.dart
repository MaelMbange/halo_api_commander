import 'package:halo_api_commander/common/properties.dart';
import 'package:halo_api_commander/matches/details/details.dart';

///Representation of a match request

class Match {
  Details? details;
  Properties? properties;

  Match({
    this.details,
    this.properties,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        details: Details.fromJson(json['details']),
        properties: Properties.fromJson(json['properties']),
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    if (details != null) data['details'] = details!.toJson();
    if (properties != null) data['properties'] = properties!.toJson();

    return data;
  }

  @override
  String toString() => 'details: $details, properties: $properties';
}
