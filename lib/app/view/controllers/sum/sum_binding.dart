import 'package:get/get.dart';
import 'package:splitcalc/app/view/controllers/sum/sum_controller.dart';

class SumBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SumController>(() => SumController());
  }
}
