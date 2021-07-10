import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/maintab.dart';
import 'package:provider_example/page/user_page.dart';
import 'package:provider_example/provider/provider_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderUser>(create: (_) => ProviderUser()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MainTabPage(),
          routes: {},
          onGenerateRoute: (RouteSettings settings) {
            var routes = <String, WidgetBuilder>{
              UsersPage.routeName: (ctx) => UsersPage(
                    dataParam: settings.arguments,
                  ),
            };
            WidgetBuilder? builder = routes[settings.name];
            return MaterialPageRoute(builder: (ctx) => builder!(ctx));
          }),
    );
  }
}
