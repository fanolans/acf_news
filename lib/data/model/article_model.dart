class ArticlesResult {
  final String status;
  final int totalResults;
  final List<Article> articles;

  ArticlesResult({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticlesResult.fromJson(Map<String, dynamic> json) => ArticlesResult(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
          (json["articles"] as List).map((x) => Article.fromJson(x)).where(
              (article) =>
                  article.author != null &&
                  article.description != null &&
                  article.urlToImage != null &&
                  article.publishedAt != null &&
                  article.content != null),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(
          articles.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Article {
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"],
        title: json["title"],
        description: json["description"] ?? "-",
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}

class ArticleSearch {
  ArticleSearch({
    required this.error,
    required this.founded,
    required this.articles,
  });

  bool error;
  int founded;
  List<Article> articles;

  factory ArticleSearch.fromJson(Map<String, dynamic> json) => ArticleSearch(
        error: json["error"],
        founded: json["founded"],
        articles: List<Article>.from(
          json["restaurants"].map(
            (x) => Article.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "founded": founded,
        "restaurants": List<dynamic>.from(
          articles.map(
            (x) => x.toJson(),
          ),
        ),
      };
}
