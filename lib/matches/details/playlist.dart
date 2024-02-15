import 'package:halo_api_commander/common/attributes.dart';
import 'package:halo_api_commander/common/image_urls.dart';
import 'package:halo_api_commander/common/properties.dart';

///Represent the match playlist
class Playlist {
  String? id;
  String? version;
  String? name;

  ImageURL? image_urls;
  Attributes? attributes;
  Properties? properties;

  Playlist({
    this.id,
    this.version,
    this.name,
    this.image_urls,
    this.attributes,
    this.properties,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        id: json['id'],
        version: json['version'],
        name: json['name'],
        image_urls: ImageURL.fromJson(json['image_urls']),
        attributes: Attributes.fromJson(json['attributes']),
        properties: Properties.fromJson(json['properties']),
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['version'] = version;
    data['name'] = name;
    data['image_urls'] = image_urls?.toJson();
    data['attributes'] = attributes?.toJson();
    data['properties'] = properties?.toJson();

    return data;
  }

  @override
  String toString() {
    return 'id: $id, version: $version, name: $name, image_urls: $image_urls, attributes: $attributes, properties: $properties';
  }
}
