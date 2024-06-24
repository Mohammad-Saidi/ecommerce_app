import 'dart:async';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:devsnode_ecommerce_app/pages/merchant/merchant_dashboard_page.dart';
import 'package:devsnode_ecommerce_app/pages/common/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';

import '../../helper_method/helper_method.dart';
import '../../providers/login_provider.dart';

enum ListType { customer, merchant }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _selectedSegment = 0; // 0 for Merchant, 1 for Customer

  bool _passwordVisible = false;
  ListType currentType = ListType.customer;

  @override
  void initState() {
    checkConnectivity();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
      } else {
        setState(() {
          showNoNetworkDialog();
        });
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    loginProvider = Provider.of(context, listen: true);
    super.didChangeDependencies();
  }




  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obsecureText = true;
  late LoginProvider loginProvider;
  TextEditingController merchantIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late StreamSubscription<ConnectivityResult> subscription;












  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: UpgradeAlert(
          upgrader: Upgrader(dialogStyle: UpgradeDialogStyle.cupertino),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      // Handle back button
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  _buildTypePicker(),
                  if (currentType == ListType.customer) _buildCustomerLoginForm(),
                  if (currentType == ListType.merchant) _buildMerchantLoginForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SegmentedButton<ListType>(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),

            segments: const [
              ButtonSegment<ListType>(
                  value: ListType.customer,
                  label: Text('Sign in as Customers'),
                  enabled: true
              ),
              ButtonSegment<ListType>(
                value: ListType.merchant, label: Text('Sign in as\nMerchant'), enabled: true
              ),

            ],
            selected: {currentType},
            onSelectionChanged: (Set<ListType> newSelection) {
              setState(() {
                currentType = newSelection.first;
              });
            },
          ),
        ),
      ],
    );
  }


  Widget _buildMerchantLoginForm() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40,
          ),
          TextFormField(
            //initialValue: 'Merchant Id',
            controller: merchantIdController,
            decoration: InputDecoration(
              labelText: 'Merchant Id',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please provide your merchant Id';
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordController,
            obscureText: obsecureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please provide your password';
              }
            },
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: obsecureText
                  ? IconButton(
                icon: const Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    obsecureText = false;
                  });
                },
              )
                  : IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    obsecureText = true;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF4A00E0),
                  Color(0xFF8E2DE2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) {
                //       return BudgetPage();
                //     }));


                if (formKey.currentState!.validate()) {
                  EasyLoading.show(status: 'Loading');

                  loginProvider
                      .getLoginInfo(merchantIdController.text,
                      passwordController.text)
                      .then((value) async {
                    EasyLoading.dismiss();

                    if (value != null) {



                      if (value['token'] != null) {

                        final SharedPreferences loginPref = await SharedPreferences.getInstance();
                        await loginPref.setString('userName', merchantIdController.text);
                        await loginPref.setString('password', passwordController.text);

                        HelperMethod.setUserId(
                            value['data']['id'].toString());

                        HelperMethod.setUserName(value['data']["owner_name"]);

                        HelperMethod.setAuthToken(
                            value['token']);
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                                type: ArtSweetAlertType.success,
                                title: 'Congratulations !!',

                                confirmButtonText: 'Home',
                                onConfirm: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return BudgetPage();
                                      }));
                                }));
                      } else if (value['status'] == 'error') {
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                                type: ArtSweetAlertType.question,
                                title: 'Sorry !!',
                                text: value['message'].toString(),
                                confirmButtonText: 'Ok',
                                onConfirm: () {
                                  Navigator.of(context).pop();
                                }));
                      }
                    } else {
                      ArtSweetAlert.show(
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.warning,
                              title: 'Oops!!!',
                              text:
                              "Service is not available now. Please try again later.",
                              confirmButtonText: 'Ok',
                              onConfirm: () {
                                Navigator.of(context).pop();
                              }));
                    }
                  });
                }



              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: const Text(
                'Log in as Merchant',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerLoginForm() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40,
          ),
          TextFormField(
            //initialValue: 'Phone No.',
            decoration: InputDecoration(
              labelText: 'Phone No.',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                icon: Icon(
                  _passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF4A00E0),
                  Color(0xFF8E2DE2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return BudgetPage();
                    }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: const Text(
                'Log in as Customer',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }



  Future<void> checkConnectivity() async {
    String status = await HelperMethod.checkConnectivity();

    if (status == "Not Connected") {
      showNoNetworkDialog();
    } else {}
  }

  void showNoNetworkDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext alertContext) {
          return AlertDialog(
            title: Text('Please Check your Internet Connection'),
            content: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(alertContext).pop();
                    SystemNavigator.pop();
                  },
                  child: Text('Cancel')),
            ),
          );
        });
  }


}
