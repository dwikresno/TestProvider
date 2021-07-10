import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/UsersModel.dart';
import 'package:provider_example/provider/provider_user.dart';

class UsersPage extends StatefulWidget {
  static const routeName = "/users-page";
  final dataParam;
  UsersPage({this.dataParam});

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  ProviderUser? pUser;
  List<Datum>? listUser = [];
  var isLoading = false;

  @override
  void initState() {
    pUser = Provider.of<ProviderUser>(context, listen: false);
    setFutureData();
    super.initState();
  }

  setFutureData() {
    setState(() {
      isLoading = true;
    });
    pUser!.getUserList(page: 1).then((value) {
      setState(() {
        listUser!.addAll(value.data!);
      });
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User List Test",
        ),
      ),
      body: isLoading
          ? Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView.builder(
              itemCount: listUser!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(listUser![index].avatar!),
                  ),
                  title: Text(listUser![index].firstName!),
                );
              },
            ),
    );
  }
}
