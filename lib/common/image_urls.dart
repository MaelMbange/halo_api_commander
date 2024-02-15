class ImageURL {
  String? hero;
  String? thumbnail;
  List<String>? screenshots;

  ImageURL({
    this.hero,
    this.thumbnail,
    this.screenshots,
  });

  factory ImageURL.fromJson(Map<String, dynamic> json) => ImageURL(
        hero: json['hero'],
        thumbnail: json['thumbnail'],
        screenshots: List<String>.from(json['screenshots'].map((e) => e)),
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    if (hero != null) data['hero'] = hero;
    if (thumbnail != null) data['thumbnail'] = thumbnail;
    if (screenshots != null) data['screenshots'] = screenshots;

    return data;
  }

  @override
  String toString() {
    return 'hero: $hero, thumbnail: $thumbnail, screenshots: $screenshots';
  }
}
