import 'package:get/get.dart';
import 'package:zoople_machine_test/core/constants.dart';
import 'package:zoople_machine_test/model/product_model.dart';
import 'package:http/http.dart' as http;

class AppServices {
  // List<ProductModel> product_model = [];

  Future<ProductModel?> getHttp() async {
    try {
      var client = http.Client();
      var response = await client
          .get(Uri.parse(AppConstants.baseurl + AppConstants.getAllProduct));

      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      }
    } catch (e) {
      Get.snackbar('App error', e.toString());
    }
    return null;
  }
}
