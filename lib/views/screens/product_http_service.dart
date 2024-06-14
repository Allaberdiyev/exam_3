import 'package:exam_3/models/products.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductHttpService {
  Future<List<Products>> getProduct() async {
    Uri url = Uri.parse(
        'https://examproject-6ab96-default-rtdb.firebaseio.com/categories.json');
    final response = await http.get(url);
    List<Products> _productList = [];
    List<Products> _computercategory = [];
    List<Products> _housecategory = [];
    List<String> _allcategories = [];

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      data.forEach((key, value) {
        _allcategories.add(key);
        if (key == 'computer' && value is List) {
          for (var productData in value) {
            final product = Car(
              auksiontime: productData['auksiontime'],
              name: productData['name'],
              // categoryID: key,
              description: productData['description'],
              endprice: productData['endprice'],
              // id: productData['id'].toString(),
              images: productData['images'],
              rating: productData['rating'],
              startprice: productData['startprice'],
            );
            print('name');

            // _productList.add(product);
            // _computercategory.add(product);
          }
        }
        if (key == 'uylar' && value is Map) {
          final images = value['images'];
          value.forEach((houseKey, houseData) {
            if (houseKey != 'images') {
              final product = Car(
                auksiontime: houseData['auksiontime'],
                name: 'House',
                // categoryID: key,
                description: houseData['description'],
                endprice: houseData['endprice'],
                // id: houseData.containsKey('id')
                // ? houseData['id'].toString()
                // : DateTime.now().millisecondsSinceEpoch.toString(),
                images: images,
                rating: houseData['rating'],
                startprice: houseData['startprice'],
              );
              // _productList.add(product);
              // _housecategory.add(product);
            }
          });
        }
      });
      // return _productList;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
