import 'dart:convert';

class BlogDetail {
  int? blogDetailId;
  int? blogId;
  String? blogContent;
  BlogDetail({
    this.blogDetailId,
    this.blogId,
    this.blogContent,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (blogDetailId != null) {
      result.addAll({'BlogDetailId': blogDetailId});
    }
    if (blogId != null) {
      result.addAll({'BlogId': blogId});
    }
    if (blogContent != null) {
      result.addAll({'BlogContent': blogContent});
    }

    return result;
  }

  factory BlogDetail.fromMap(Map<String, dynamic> map) {
    return BlogDetail(
      blogDetailId: map['BlogDetailId']?.toInt(),
      blogId: map['BlogId']?.toInt(),
      blogContent: map['BlogContent'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogDetail.fromJson(String source) =>
      BlogDetail.fromMap(json.decode(source));
}
