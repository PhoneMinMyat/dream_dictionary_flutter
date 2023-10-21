import 'dart:convert';

import 'package:dream_dictionary/model/model.dart';
import 'package:dream_dictionary/model/vos/blog.dart';
import 'package:dream_dictionary/model/vos/blog_detail.dart';
import 'package:dream_dictionary/model/vos/blog_header.dart';
import 'package:flutter/services.dart';

class ModelImpl implements Model {
  Blog? blogData;

  static final ModelImpl _singleton = ModelImpl._internal();

  factory ModelImpl() {
    return _singleton;
  }

  ModelImpl._internal() {
    readJson();
  }

  Future<void> readJson() async {
    return rootBundle
        .loadString('assets/DreamDictionary.json')
        .then((response) async {
      final jsonData = jsonDecode(response);
      blogData = Blog.fromJson(jsonData as Map<String, dynamic>);
    });
  }

  @override
  Future<List<BlogDetail>?> getDreamDetailById(int id) {
    if (blogData != null) {
      List<BlogDetail>? result = blogData?.blogDetail
          ?.where((element) => element.blogId == id)
          .toList();
      return Future.value(result);
    } else {
      return readJson().then((value) {
        List<BlogDetail>? result = blogData?.blogDetail
            ?.where((element) => element.blogId == id)
            .toList();
        return Future.value(result);
      });
    }
  }

  @override
  Future<List<BlogDetail>?> getDreamDetailBySearch(String search) {
    if (blogData != null) {
      List<BlogDetail>? result = blogData?.blogDetail
          ?.where((element) => element.blogContent?.contains(search) ?? false)
          .toList();
      return Future.value(result);
    } else {
      return readJson().then((value) {
        List<BlogDetail>? result = blogData?.blogDetail
            ?.where((element) => element.blogContent?.contains(search) ?? false)
            .toList();
        return Future.value(result);
      });
    }
  }

  @override
  Future<List<BlogHeader>?> getDreamHeader() {
    if (blogData != null) {
      return Future.value(blogData?.blogHeader);
    } else {
      return readJson().then((value) {
        return Future.value(blogData?.blogHeader);
      });
    }
  }

  @override
  Future<List<BlogDetail>?> getAllDreamDetail() {
    if (blogData != null) {
      return Future.value(blogData?.blogDetail);
    } else {
      return readJson().then((value) {
        return Future.value(blogData?.blogDetail);
      });
    }
  }
}
