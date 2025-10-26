import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  List<Product> products = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading = true;
      update();

      final productList = await ApiService.fetchProducts();
      products = productList;
      errorMessage = '';
    } catch (e) {
      errorMessage = 'Error loading products: $e';
    } finally {
      isLoading = false;
      update();
    }
  }
}
