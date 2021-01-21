class NewsModel {
  int id;
  String title;
  String description;
  String imageUrl;
  String availableAt;
  String createdAt;
  String updatedAt;

  NewsModel({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.availableAt,
    this.createdAt,
    this.updatedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      availableAt: json['available_at'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}
