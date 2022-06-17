import 'package:get/get.dart';
import 'package:splitcalc/app/view/controllers/split/split_controller.dart';

class SplitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplitController>(() => SplitController());
  }
}
