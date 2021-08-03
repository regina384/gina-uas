import 'package:flutter/material.dart';
import 'package:flutter_uas_app/auth_controller.dart';
import 'package:flutter_uas_app/pages/register_screen.dart';

class LoginUasScreen extends StatelessWidget {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      appBar: AppBar(
        title: Text("Masuk"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60.0, bottom: 60.0),
              child: Center(
                child: Text(
                  ' Masuk Gmail',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 30),
                ),
              ),
            ),
            Padding(
              // padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
              child: TextField(
                controller: passCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kata Sandi',
                ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () async {
                  try {
                    await AuthController.login(
                        emailCtrl.text.toString().trim(), passCtrl.text);
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                child: Text(
                  'Masuk',
                  style: TextStyle(color: Colors.yellow, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            // ignore: deprecated_member_use
            FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => RegisterUasScreen()));
                },
                child: Text('Daftar',
                    style: TextStyle(color: Colors.yellow, fontSize: 15))),
          ],
        ),
      ),
    );
  }
}
