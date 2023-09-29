
import 'package:get/get.dart';
import '../view_model/logic_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogicViewModel());
  }
}
