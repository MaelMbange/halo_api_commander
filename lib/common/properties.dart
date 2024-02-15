class Properties {
  String? level_id;
  String? owner_type;
  String? engine_variant_id;

  String? type;
  String? queue;
  String? input;
  String? experience;
  String? interaction;

  int? category_id;

  Properties({
    this.level_id,
    this.owner_type,
    this.category_id,
    this.engine_variant_id,
    this.queue,
    this.input,
    this.experience,
    this.type,
    this.interaction,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        level_id: json['level_id'],
        owner_type: json['owner_type'],
        category_id: json['category_id'],
        engine_variant_id: json['engine_variant_id'],
        queue: json['queue'],
        input: json['input'],
        experience: json['experience'],
        type: json['type'],
        interaction: json['interaction'],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    if (level_id != null) data['level_id'] = level_id;
    if (owner_type != null) data['owner_type'] = owner_type;
    if (category_id != null) data['category_id'] = category_id;
    if (engine_variant_id != null) {
      data['engine_variant_id'] = engine_variant_id;
    }
    if (queue != null) data['queue'] = queue;
    if (input != null) data['input'] = input;
    if (experience != null) data['experience'] = experience;
    if (type != null) data['type'] = type;
    if (interaction != null) data['interaction'] = interaction;

    return data;
  }

  @override
  String toString() =>
      'level_id: $level_id, owner_type: $owner_type, category_id: $category_id, engine_variant_id: $engine_variant_id, queue: $queue, input: $input, experience: $experience, type: $type, interaction: $interaction';
}
