import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IntroController extends GetxController {
  var isDone = false.obs;

  @override
  void onInit() {
    getOnDone();
    super.onInit();
  }

  getOnDone() {
    GetStorage box = GetStorage();
    var result = box.read("isDone");
    if (result == null) {
      print("isDone = null");
      isDone.value = false;
    } else {
      isDone.value = result;
      print("isDone = $result");
    }
  }

  setOnDoneTrue() {
    isDone.value = true;
    GetStorage box = GetStorage();
    box.write("isDone", true);
  }

  setOnDoneFalse() {
    isDone.value = false;
    GetStorage box = GetStorage();
    box.write("isDone", false);
  }
}
