class EventModel {
  int id;
  String name;
  String description;
  String imageUrl;
  DateTime startAt;

  EventModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.startAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      startAt: DateTime.parse(json['start_at']),
    );
  }
}
