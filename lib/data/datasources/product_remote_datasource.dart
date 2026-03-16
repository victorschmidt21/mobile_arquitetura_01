import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/network/api_constants.dart';
import '../models/product_model.dart';

class ProductRemoteDatasource {
  final http.Client client;

  ProductRemoteDatasource(this.client);

  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(
      Uri.parse(ApiConstants.productsEndpoint),
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar produtos: ${response.statusCode}');
    }

    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }
}
