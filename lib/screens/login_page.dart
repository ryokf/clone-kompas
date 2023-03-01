import 'package:flutter/material.dart';
import 'package:frontend/data/user_data.dart';
import 'package:frontend/screens/home_page.dart';
import 'package:frontend/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  UserData user = UserData();

  // String? token;

  handleLogin() async {
    var response =
        await user.login(emailController.text, passwordController.text);

    dynamic userData = response['data'];

    if (userData != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    } else {
      print('login gagal');
    }
  }

  Widget inputForm(
    String title,
    bool obsecureText,
    TextEditingController controller,
  ) {
    return Container(
      height: 57,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: subtitleColor),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextFormField(
          controller: controller,
          style: standarTextStyle.copyWith(fontSize: 16),
          obscureText: obsecureText,
          decoration: InputDecoration.collapsed(
              hintText: title, hintStyle: subtitleTextStyle),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        inputForm('email', false, emailController),
        inputForm('password', true, passwordController),
        GestureDetector(
          onTap: () {
            handleLogin();
          },
          child: ElevatedButton(
            onPressed: () {
              handleLogin();
            },
            child: Text('kirim'),
          ),
        )
      ]),
    );
  }
}
