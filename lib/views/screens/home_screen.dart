import 'package:exam_3/models/products.dart';
import 'package:flutter/material.dart';
import 'package:exam_3/views/screens/product_http_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductHttpService _productHttpService = ProductHttpService();
  late final Future<List<Products>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = _productHttpService.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder<List<Products>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Products>? products = snapshot.data;
            print(products);
            if (products != null && products.isNotEmpty) {
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  Products product = products[index];
                  return ListTile(
                    title: Text(product.cars.toString()),
                    subtitle: Text(product.uylar.toString()),
                  );
                },
              );
            } else {
              return Center(child: Text('No products found'));
            }
          }
        },
      ),
    );
  }
}
