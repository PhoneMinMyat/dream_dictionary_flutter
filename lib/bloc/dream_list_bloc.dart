import 'package:dream_dictionary/model/model.dart';
import 'package:dream_dictionary/model/model_impl.dart';
import 'package:dream_dictionary/model/vos/blog_detail.dart';
import 'package:flutter/foundation.dart';

class DreamListBloc extends ChangeNotifier {
  bool isDisposed = false;
  final Model _model = ModelImpl();

  List<BlogDetail>? dreamList;

  DreamListBloc({int? headerId, String? search}) {
    if (headerId != null) {
      getDataByHeaderId(headerId);
    } else if (search != null) {
      getDataBySearch(search);
    }
  }

  void getDataByHeaderId(int headerId) async {
    await _model.getDreamDetailById(headerId).then((value) {
      dreamList = value ?? [];
      safeNotifyListeners();
    });
  }

  void getDataBySearch(String search) async {
    await _model.getDreamDetailBySearch(search).then((value) {
      dreamList = value ?? [];
      safeNotifyListeners();
    });
  }

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
