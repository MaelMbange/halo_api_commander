import 'package:halo_api_commander/matches/details/map.dart';
import 'package:halo_api_commander/matches/details/ugc_game_variant.dart';

///Details of a specific match
class Details {
  Map_? map;
  UGCGameVariant? ugc_gameVariant;

  Details({
    this.map,
    this.ugc_gameVariant,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        map: Map_.fromJson(json['map']),
        ugc_gameVariant: UGCGameVariant.fromJson(json['ugcgamevariant']),
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    if (map != null) data['map'] = map?.toJson();
    if (ugc_gameVariant != null) {
      data['ugcgamevariant'] = ugc_gameVariant?.toJson();
    }

    return data;
  }

  @override
  String toString() {
    return 'map: $map, ugc_gameVariant: $ugc_gameVariant';
  }
}
