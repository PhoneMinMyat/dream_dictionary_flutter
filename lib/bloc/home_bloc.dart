import 'package:dream_dictionary/model/model.dart';
import 'package:dream_dictionary/model/model_impl.dart';
import 'package:dream_dictionary/model/vos/blog_detail.dart';
import 'package:dream_dictionary/model/vos/blog_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeBloc extends ChangeNotifier {
  bool isDisposed = false;
  final Model _model = ModelImpl();
  List<BlogHeader>? dreamHeader;
  List<BlogDetail> dreamDetailList = [];
  List<String> autofillList = [];
  TextEditingController searchController = TextEditingController();
  HomeBloc() {
    getDreamHeader();
    getDreamDetail();
  }

  void getDreamHeader() async {
    await _model.getDreamHeader().then((value) {
      dreamHeader = value;
      safeNotifyListeners();
    });
  }

  void getDreamDetail() async {
    await _model.getAllDreamDetail().then((value) {
      dreamDetailList = value ?? [];
      safeNotifyListeners();
    });
  }

  // void makeSearchClear() {
  //   searchController.clear();
  //   autofillList.clear();
  //   safeNotifyListeners();
  // }

  // void changeSearchField(String search) async {
  //   if (search.isEmpty) {
  //     autofillList.clear();
  //     autocompleteDetailList?.clear();

  //     safeNotifyListeners();
  //   } else {
  //     await _model.getDreamDetailBySearch(search).then((detaiList) {
  //       autocompleteDetailList = detaiList ?? [];

  //       safeNotifyListeners();
  //       // for (BlogDetail blog in detaiList ?? []) {
  //       //   autofillList.add(blog.blogContent ?? '');
  //       // }

  //       // safeNotifyListeners();
  //     });
  //   }
  // }

  // Future<List<String>> changeAutoComplete(String search) async {
  //   if (search.isEmpty) {
  //     return Future.value([]);
  //   } else {
  //     await _model.getDreamDetailBySearch(search).then((detaiList) {
  //       return Future.value(detaiList?.map((e) => e.blogContent ?? ''));
  //     });
  //   }
  // }

  void safeNotifyListeners() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
