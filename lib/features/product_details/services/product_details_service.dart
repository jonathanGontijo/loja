import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loja/constants/error_handling.dart';
import 'package:loja/constants/global_variables.dart';
import 'package:loja/constants/utils.dart';
import 'package:loja/models/product.dart';
import 'package:loja/models/user.dart';
import 'package:loja/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductDetailsService {
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({'id': product.id!, 'rating': rating}),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Rating submitted successfully!');
          // Provider.of<UserProvider>(context, listen: false).setUserFromModel(
          //   User.fromJson(jsonEncode(jsonDecode(res.body)['user'])),
          // );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
