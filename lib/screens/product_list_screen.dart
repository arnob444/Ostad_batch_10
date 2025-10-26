import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: GetBuilder<ProductController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(child: Text(controller.errorMessage));
          }

          if (controller.products.isEmpty) {
            return const Center(child: Text('No products found.'));
          }

          return RefreshIndicator(
            onRefresh: () async => controller.fetchProducts(),
            child: ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 2,
                  child: ListTile(
                    leading: product.img.startsWith('http')
                        ? Image.network(product.img, width: 50, height: 50, fit: BoxFit.cover)
                        : const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                    title: Text(product.productName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Code: ${product.productCode}'),
                        Text('Qty: ${product.qty}'),
                        Text('Unit Price: ${product.unitPrice}'),
                        Text('Total Price: ${product.totalPrice}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
