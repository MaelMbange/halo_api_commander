class Medal {
  final int id;
  final String name;
  final String description;
  final String small;
  final String medium;
  final String large;
  final String difficulty;
  final String type;

  Medal({
    required this.id,
    required this.name,
    required this.description,
    required this.small,
    required this.medium,
    required this.large,
    required this.difficulty,
    required this.type,
  });

  factory Medal.fromJson(Map<String, dynamic> json) => Medal(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        small: json['image_urls']['small'],
        medium: json['image_urls']['medium'],
        large: json['image_urls']['large'],
        difficulty: json['attributes']['difficulty'],
        type: json['properties']['type'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image_urls': {
          'small': small,
          'medium': medium,
          'large': large,
        },
        'attributes': {
          'difficulty': difficulty,
        },
        'properties': {
          'type': type,
        },
      };

  @override
  String toString() {
    return 'Medal(id: $id, name: $name, description: $description, difficulty: $difficulty, type: $type)';
  }

  String getFilename() {
    return '${id}_${name.replaceAll(' ', '_')}.png';
  }
}
