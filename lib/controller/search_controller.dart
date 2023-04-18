import 'package:get/get.dart';

class SearchController extends GetxController {
  RxString query = RxString('');

  void updateQuery(String value) {
    query.value = value;
  }
}
