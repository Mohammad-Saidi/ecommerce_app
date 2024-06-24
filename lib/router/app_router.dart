import 'package:devsnode_ecommerce_app/pages/common/login_page.dart';
import 'package:devsnode_ecommerce_app/pages/common/sign_up_page.dart';
import 'package:devsnode_ecommerce_app/pages/home_page.dart';
import 'package:devsnode_ecommerce_app/pages/merchant/merchant_dashboard_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

/// Contains all of the app routes configurations
///

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.splashToLoginRoute.path,
    routes: [
      GoRoute(
        name: AppRoutes.splashToLoginRoute.name,
        path: AppRoutes.splashToLoginRoute.path,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const HomePage(),
        ),
      ),
      GoRoute(
        name: AppRoutes.loginRoute.name,
        path: AppRoutes.loginRoute.path,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        name: AppRoutes.merchantDashboardRoute.name,
        path: AppRoutes.merchantDashboardRoute.path,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: BudgetPage(),
        ),
      ),
      GoRoute(
        name: AppRoutes.signUpRoute.name,
        path: AppRoutes.signUpRoute.path,
        pageBuilder: (context, state) => MaterialPage(
          child: SignupPage(),
        ),
      ),
    ],
  );
}
