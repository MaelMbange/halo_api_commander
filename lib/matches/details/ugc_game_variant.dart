import 'package:halo_api_commander/common/image_urls.dart';
import 'package:halo_api_commander/common/properties.dart';

///Representation of the match game mode / variant
class UGCGameVariant {
  String? id;
  String? version;
  String? name;

  ImageURL? image_urls;
  Properties? properties;

  UGCGameVariant({
    this.id,
    this.version,
    this.name,
    this.image_urls,
    this.properties,
  });

  factory UGCGameVariant.fromJson(Map<String, dynamic> json) => UGCGameVariant(
        id: json['id'],
        version: json['version'],
        name: json['name'],
        image_urls: ImageURL.fromJson(json['image_urls']),
        properties: Properties.fromJson(json['properties']),
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    if (id != null) data['id'] = id;
    if (version != null) data['version'] = version;
    if (name != null) data['name'] = name;
    if (image_urls != null) data['image_urls'] = image_urls?.toJson();
    if (properties != null) data['properties'] = properties?.toJson();

    return data;
  }

  @override
  String toString() {
    return 'id: $id, version: $version, name: $name, image_urls: $image_urls, properties: $properties';
  }
}
