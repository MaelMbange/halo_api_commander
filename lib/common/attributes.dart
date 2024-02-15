class Attributes {
  bool? active;
  bool? featured;
  bool? ranked;

  Attributes({
    this.active,
    this.featured,
    this.ranked,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      active: json['active'],
      featured: json['featured'],
      ranked: json['ranked'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    if (active != null) data['active'] = active;
    if (featured != null) data['featured'] = featured;
    if (ranked != null) data['ranked'] = ranked;

    return data;
  }

  @override
  String toString() => 'active: $active, featured: $featured, ranked: $ranked';
}
