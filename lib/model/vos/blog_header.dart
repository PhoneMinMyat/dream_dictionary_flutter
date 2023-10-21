import 'dart:convert';

class BlogHeader {
  int? blogId;
  String? blogTitle;
  BlogHeader({
    this.blogId,
    this.blogTitle,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (blogId != null) {
      result.addAll({'BlogId': blogId});
    }
    if (blogTitle != null) {
      result.addAll({'BlogTitle': blogTitle});
    }

    return result;
  }

  factory BlogHeader.fromMap(Map<String, dynamic> map) {
    return BlogHeader(
      blogId: map['BlogId']?.toInt(),
      blogTitle: map['BlogTitle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogHeader.fromJson(String source) =>
      BlogHeader.fromMap(json.decode(source));
}
