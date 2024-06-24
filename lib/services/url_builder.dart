



class UrlBuilder {
  //const UrlBuilder({String? baseUrl}) : _baseUrl = baseUrl ?? 'http://103.209.40.130:8090/api';
  static String _baseUrl = 'http://103.209.40.130:8090/api';


 static  String buildSignInUrl() {
    return '$_baseUrl/merchant/login';
  }

}