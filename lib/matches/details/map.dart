import 'package:halo_api_commander/common/properties.dart';
import 'package:halo_api_commander/common/image_urls.dart';

///Map played during a match
class Map_ {
  String? id;
  String? version;
  String? name;
  ImageURL? image_urls;
  Properties? properties;

  Map_({
    this.id,
    this.version,
    this.name,
    this.image_urls,
    this.properties,
  });

  factory Map_.fromJson(Map<String, dynamic> json) => Map_(
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

void main() {
  Map_ a = Map_(
    id: "667072ae-ba00-4414-adda-8203e8c49295",
    version: "80303a60-6b4d-4227-802d-63fd7f67f18e",
    name: "Aquarius",
    image_urls: ImageURL(
      hero:
          "https://content.halocdn.com/media/Default/games/halo-infinite/maps/aquarius/aquarius-small-1x-1f",
      thumbnail:
          "https://content.halocdn.com/media/Default/games/halo-infinite/maps/aquarius/aquarius-thumbnail-1x-1f",
      screenshots: [
        "https://blobs-infiniteugc.svc.halowaypoint.com/ugcstorage/map/667072ae-ba00-4414-adda-8203e8c49295/80303a60-6b4d-4227-802d-63fd7f67f18e/images/screenshot1.jpg"
      ],
    ),
    properties: Properties(
      level_id: "fc878857-e778-4daf-b0ef-5d826b922f3f",
      //owner_type: "player",
    ),
  );

  print(a.toJson());
}
