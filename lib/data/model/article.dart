import 'package:news_app/data/model/source.dart';

/// source : {"id":"wired","name":"Wired"}
/// author : "Jessica Klein"
/// title : "Bitcoin Bros Go Wild for Donald Trump"
/// description : "At Bitcoin 2024 conference in Nashville, Trump is finally telling crypto enthusiasts what they want to hear."
/// url : "https://www.wired.com/story/bitcoin-bros-go-wild-for-donald-trump/"
/// urlToImage : "https://media.wired.com/photos/66a56f21bf2909f08a634953/191:100/w_1280,c_limit/Crypto-Bros-Business-2162975355.jpg"
/// publishedAt : "2024-07-28T12:43:07Z"
/// content : "Trumps speech is an hour behind. A half hour into the wait, restless attendees start chanting Trump. The woman sitting in front of me murmurs her own chant:\r\nBitcoin, bitcointhats what they should be… [+3147 chars]"

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Article copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) =>
      Article(
        source: source ?? this.source,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
