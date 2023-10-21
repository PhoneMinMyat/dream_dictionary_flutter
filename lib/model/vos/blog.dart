import 'dart:convert';

import 'package:dream_dictionary/model/vos/blog_detail.dart';
import 'package:dream_dictionary/model/vos/blog_header.dart';

class Blog {
  List<BlogHeader>? blogHeader;
  List<BlogDetail>? blogDetail;
  Blog({
    this.blogHeader,
    this.blogDetail,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (blogHeader != null) {
      result
          .addAll({'BlogHeader': blogHeader!.map((x) => x.toMap()).toList()});
    }
    if (blogDetail != null) {
      result
          .addAll({'BlogDetail': blogDetail!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      blogHeader: map['BlogHeader'] != null
          ? List<BlogHeader>.from(
              map['BlogHeader']?.map((x) => BlogHeader.fromMap(x)))
          : null,
      blogDetail: map['BlogDetail'] != null
          ? List<BlogDetail>.from(
              map['BlogDetail']?.map((x) => BlogDetail.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(Map<String, dynamic> source) => Blog.fromMap(source);
}
