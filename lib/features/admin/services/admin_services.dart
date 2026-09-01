import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja/constants/error_handling.dart';
import 'package:loja/constants/global_variables.dart';
import 'package:loja/constants/utils.dart';
import 'package:loja/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:loja/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('dwyvmmsab', 'ldzjhaoo');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        print('1 - Iniciando upload');

        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name.trim()),
        );

        print('2 - Upload concluído');
        print('3 - URL: ${res.secureUrl}');

        imageUrls.add(res.secureUrl);
      }

      //   CloudinaryResponse res = await cloudinary.uploadFile(
      //     CloudinaryFile.fromFile(images[i].path, folder: name),
      //   );
      //   imageUrls.add(res.secureUrl);
      // }
      print('4 - Criando Product');
      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );

      print('5 - Product criado');
      print('6 - JSON: ${product.toJson()}');
      print('7 - Token: ${userProvider.user.token}');

      print('8 - Enviando para backend');

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );

      print('9 - Resposta: ${res.statusCode}');
      print('10 - Body: ${res.body}');
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //get all products
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/admin/get-products'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      print('11 - Resposta: ${res.statusCode}');
      print('12 - Body: ${res.body}');

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(Product.fromJson(jsonDecode(res.body)[i]));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }
}
