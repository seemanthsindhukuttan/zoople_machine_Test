import 'package:get/get.dart';
import 'package:zoople_machine_test/model/product_model.dart';
import 'package:zoople_machine_test/services/appservices.dart';

class HomeController extends GetxController {
  RxList<Datum> productList = <Datum>[].obs;
  RxBool loading = true.obs;

  @override
  void onInit() async {
    final data = await AppServices().getHttp();
    productList.value = data!.data;

    if (productList.isNotEmpty) {
      loading.value = false;
    }

    super.onInit();
  }
}
