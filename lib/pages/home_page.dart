import 'package:devsnode_ecommerce_app/pages/common/login_page.dart';
import 'package:devsnode_ecommerce_app/pages/common/sign_up_page.dart';
import 'package:devsnode_ecommerce_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Welcome To App'),
                Text('Explore Us'),
              ],
            ),
            Image.asset(
              'assets/images/homepage_middlepic.jpeg',
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 26.0, right: 26.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF4A00E0),
                                Color(0xFF8E2DE2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(

                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: const Text('Log In', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 26.0, right: 26.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return SignupPage();
                            // }));

                            context.goNamed(AppRoutes.loginRoute.name);





                          },
                          child: const Text('Signup', style: TextStyle(color: Colors.black),),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
