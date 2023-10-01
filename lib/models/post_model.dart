class PostModel {
  final int id;
  final String title;
  final String content;
  final String createdAt;
  
  PostModel({required this.id, required this.title, required this.content, required this.createdAt});
  
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['ID'],
      title: json['title'],
      createdAt: json['date'],
      content: json['content'],
    );
  }
}
