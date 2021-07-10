import 'package:flutter/material.dart';
import 'package:provider_example/helper/helper.dart';
import 'package:provider_example/model/UsersModel.dart';

class ProviderUser with ChangeNotifier {
  Future<UsersModel> getUserList({
    @required page,
  }) async {
    final Map<String, dynamic> postdata = {};
    // SharedPreferences pref = await SharedPreferences.getInstance();

    String reply = await apiHttpConfig(
      postdata,
      "users?page=$page",
      "",
      method: "get",
    );
    // Map decoded = jsonDecode(reply);
    // if (decoded['result'] == 1) {}
    return usersModelFromJson(reply);
  }
}
