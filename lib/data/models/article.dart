class Article {
  final String title;
  final String image;
  final String content;
  final String authorName;
  final String authorImage;
  final String date;
  final String category;
  final String readTime;
  final String description;

  Article({
    required this.title,
    required this.description,
    required this.image,
    required this.content,
    required this.authorName,
    required this.authorImage,
    required this.date,
    required this.category,
    required this.readTime,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      image: json['urlToImage'] ?? '',
      content: json['content'] ?? "No content",
      authorName: json['author'] ?? "Unknown author",
      date: json['publishedAt'] ?? "No date",
      category: json['title'] ?? "No category",
      authorImage: json['title'] ?? "",
      readTime: json['title'] ?? "1 min",
    );
  }
}
