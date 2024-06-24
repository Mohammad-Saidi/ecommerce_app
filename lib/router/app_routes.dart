enum AppRoutes {

  splashToLoginRoute(
    name: 'splashToLoginRoute',
    path: '/splashToLogin',
  ),


  loginRoute(
    name: 'loginRoute',
    path: '/login',
  ),
  merchantDashboardRoute(
    name: 'merchantDashboardRoute',
    path: '/merchantDashboard',
  ),

  signUpRoute(
    name: 'signUpRoute',
    path: '/signUp'
  );


  const AppRoutes({
    required this.name,
    required this.path,
  });


  final String name;

  final String path;


  @override
  String toString() => name;


}