import 'dart:convert';

import 'package:devsnode_ecommerce_app/services/url_builder.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<dynamic> userLogin(email, password) async {
    dynamic data;
    try {
      print('hi');
      //const url = 'http://103.209.40.130:8090/api/merchant/login';
      final url = UrlBuilder.buildSignInUrl();
      Uri uri = Uri.parse(url);
      final response = await http.post(uri,
          body: {'merchant_id': email, 'password': password});
print('hello');
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        print(response.statusCode);
        data = jsonDecode(response.body.toString());
        return data;
      }
    } catch (e) {
      return data;
    }
  }
}
