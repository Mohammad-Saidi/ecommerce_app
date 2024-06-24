



import 'package:flutter/cupertino.dart';

import '../models/login_model.dart';
import '../services/login_service.dart';

class LoginProvider extends ChangeNotifier {
  LoginModel? loginModel;


  Future<dynamic> getLoginInfo(String merchantId, String password) async {

    final data = await LoginService.userLogin(merchantId, password);
    print('Data at LoginProvider: $data');
    if (data != null) {
      try {
        loginModel = LoginModel.fromJson(data);
        print("11111111111");
        return data;
      } catch (e) {
        print('22222222222');
        return data;
      }
    } else {
      print("333333333333");
      return data;

    }
  }


}