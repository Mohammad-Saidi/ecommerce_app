// import 'package:devsnode_ecommerce_app/pages/home_page.dart';
// import 'package:devsnode_ecommerce_app/pages/seller_dashboard_page.dart';
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }
//
//
//
//
//
//



import 'package:devsnode_ecommerce_app/pages/merchant/merchant_dashboard_page.dart';
import 'package:devsnode_ecommerce_app/pages/home_page.dart';
import 'package:devsnode_ecommerce_app/pages/productlist_page.dart';
import 'package:devsnode_ecommerce_app/providers/login_provider.dart';
import 'package:devsnode_ecommerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      ChangeNotifierProvider(create: (context) => LoginProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: HomePage(),
      ),
    );
  }
}





