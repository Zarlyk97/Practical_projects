import 'package:flutter/material.dart';

import 'package:form_exemple/feature/domain/model/model.dart';

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  UserModel userinfo;
  SecondPage({
    Key? key,
    required this.userinfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  userinfo.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(userinfo.story),
                leading: const Icon(Icons.person),
                trailing: Text(userinfo.country),
              ),
              ListTile(
                title: Text(
                  userinfo.phone,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: const Icon(Icons.phone),
                trailing: Text(userinfo.email),
              )
            ],
          ),
        ),
      ),
    );
  }
}
