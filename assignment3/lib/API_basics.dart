// ignore_for_file: unused_local_variable
import 'package:assignment3/product_controller.dart';
import 'package:assignment3/product_model.dart';

import 'package:flutter/material.dart';

class ApiBasics extends StatefulWidget {
  const ApiBasics({super.key});

  @override
  State<ApiBasics> createState() => _ApiBasicsState();
}

class _ApiBasicsState extends State<ApiBasics> {
  final ProductController productController = ProductController();

  Future<void> fetchData() async {
    await productController.fetchProducts();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    void productDialog({
      String? id,
      String? name,
      String? img,
      int? qty,
      int? unitPrice,
      int? totalPrice,
      required bool isUpdate,
    }) {
      TextEditingController productNameController = TextEditingController();
      TextEditingController productQTYController = TextEditingController();
      TextEditingController productImageController = TextEditingController();
      TextEditingController productUnitPriceController =
          TextEditingController();
      TextEditingController productTotalPriceController =
          TextEditingController();

      productNameController.text = name ?? ' ';
      productQTYController.text = img ?? ' ';
      productImageController.text = img != null ? img.toString() : '0';
      productUnitPriceController.text =
          unitPrice != null ? unitPrice.toString() : '0';
      productTotalPriceController.text =
          totalPrice != null ? totalPrice.toString() : '0';

      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text(isUpdate ? "Edit Product" : 'Add Product'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: productNameController,
                    decoration: InputDecoration(labelText: 'Product name'),
                  ),
                  TextField(
                    controller: productImageController,
                    decoration: InputDecoration(labelText: 'Product image'),
                  ),
                  TextField(
                    controller: productQTYController,
                    decoration: InputDecoration(labelText: 'Product quality'),
                  ),
                  TextField(
                    controller: productUnitPriceController,
                    decoration: InputDecoration(
                      labelText: 'Product unit price',
                    ),
                  ),
                  TextField(
                    controller: productTotalPriceController,
                    decoration: InputDecoration(labelText: 'Total price'),
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () async {
                          productController
                              .createUpdateProducts(
                                productNameController.text,
                                productImageController.text,
                                int.parse(productQTYController.text.trim()),
                                int.parse(
                                  productUnitPriceController.text.trim(),
                                ),
                                int.parse(
                                  productTotalPriceController.text.trim(),
                                ),
                                isUpdate,
                                id,
                              )
                              .then((value) async {
                                if (value) {
                                  await productController.fetchProducts();
                                  setState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        isUpdate
                                            ? "Product Updated"
                                            : 'Product Created',
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Someting wrong')),
                                  );
                                }
                              });
                          Navigator.pop(context);
                          await fetchData();
                          setState(() {});
                        },
                        child: Text(
                          isUpdate ? 'Update Product' : 'Add Product',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Product CURD', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.amber[800],
      ),
      body: GridView.builder(
        itemCount: productController.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          // mainAxisExtent: 120,
          childAspectRatio: .6,
        ),
        itemBuilder: (context, index) {
          var product = productController.products[index];
          return ProductCart(
            onEdit: () {
              productDialog(
                name: product.productName,
                img: product.img,
                id: product.sId,
                qty: product.qty,
                unitPrice: product.unitPrice,
                totalPrice: product.totalPrice,
                isUpdate: true,
              );
            },
            onDelete: () {
              productController.deleteProducts(product.sId.toString()).then((
                value,
              ) async {
                if (value) {
                  await productController.fetchProducts();
                  setState(() {});
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Product Deleted')));
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Someting wrong')));
                }
              });
            },
            product: product,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productDialog(isUpdate: false);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProductCart extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final Data product;
  const ProductCart({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 140,
            child: Image.network(
              height: 140,
              fit: BoxFit.cover,
              product.img.toString(),
              // 'https://www.istudio.store/cdn/shop/files/iPhone_16_Pro_Max_Natural_Titanium_PDP_Image_Position_2_Design__TH-TH.jpg?v=1725928783&width=823',
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  product.productName.toString(),
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                Text(
                  'Price : ${product.unitPrice} | QTY : ${product.qty}',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onEdit,
                  icon: Icon(Icons.edit, color: Colors.green),
                ),
                SizedBox(width: 5),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete, color: Colors.red[400]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 1 : 16 : 40
