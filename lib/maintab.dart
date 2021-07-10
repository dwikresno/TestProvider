import 'package:flutter/material.dart';
import 'package:provider_example/page/user_page.dart';

class MainTabPage extends StatefulWidget {
  MainTabPage({Key? key}) : super(key: key);

  @override
  _MainTabPageState createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  UsersPage.routeName,
                );
              },
              child: Center(
                child: Text("User LIst"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
