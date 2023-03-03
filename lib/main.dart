import 'package:flutter_h3tema_project_lb_ma/countryList.dart';
import 'package:go_router/go_router.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => countryList(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
