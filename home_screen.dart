import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uas_app/auth_controller.dart';

class HomeUasScreen extends StatelessWidget {
  final User user;
  const HomeUasScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(user.uid),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50, width: 250,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20)),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () async {
                  try {
                    await AuthController.logout();
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                child: Text(
                  'Keluar',
                  style: TextStyle(color: Colors.red.shade400, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
