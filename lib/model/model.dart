import 'package:dream_dictionary/model/vos/blog_detail.dart';
import 'package:dream_dictionary/model/vos/blog_header.dart';

abstract class Model {
  Future<List<BlogHeader>?> getDreamHeader();
  Future<List<BlogDetail>?> getAllDreamDetail();
  Future<List<BlogDetail>?> getDreamDetailById(int id);
  Future<List<BlogDetail>?> getDreamDetailBySearch(String search);
}
