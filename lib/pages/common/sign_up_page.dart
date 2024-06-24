import 'package:devsnode_ecommerce_app/pages/common/login_page.dart';
import 'package:devsnode_ecommerce_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Signup',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: "Irfan Munawar",
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  initialValue: 'sampleemail@gmail.com',
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  initialValue: '.....',
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      )),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF4A00E0),
                        Color(0xFF8E2DE2),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        backgroundColor: Colors.transparent),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return LoginPage();
                        // }));
                        context.goNamed(AppRoutes.loginRoute.name);
                      },
                      child: const Text('Sign in'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
