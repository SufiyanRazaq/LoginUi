import 'package:loginui/helper.dart';
import 'package:loginui/screen/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScreenLogin extends StatefulWidget {
  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: buildButton(),
          title: Text(
            "Log in",
            style: textStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              buildText(
                  name: "Log in with one of following options",
                  choose: textStyle1),
              buildGoogleAppleFunction(mq),
              buildText(name: "Email", choose: textStyle2),
              buildEmailField(),
              buildText(name: "Password", choose: textStyle2),
              buildPasswordField(),
              const SizedBox(
                height: 25,
              ),
              buildTaptoLogin(),
              buildTaptoSignup(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: 15.0,
          minimumSize: const Size(20, 50),
        ),
        onPressed: () {
          print("Icon Touch");
        },
        child: const Icon(Icons.arrow_back_ios, color: Colors.white));
  }

  Widget buildText({required String name, required TextStyle choose}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Text(
        name,
        style: choose,
      ),
    );
  }

  Widget buildGoogleAppleFunction(Size mq) {
    return Padding(
      padding: const EdgeInsets.only(top: 13, left: 5, right: 3, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                    elevation: 15.0,
                    minimumSize: Size(mq.width * 0.4, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  print("Icon Google");
                },
                child: const Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                    elevation: 15.0,
                    minimumSize: Size(mq.width * 0.4, 50),
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  print("Icon Apple");
                },
                child: const Icon(FontAwesomeIcons.apple, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget buildTaptoLogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 193, 12, 225),
              Color.fromARGB(255, 222, 32, 165)
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            minimumSize: const Size(500, 48),
          ),
          child: const Text(
            "Log in",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
      child: TextFormField(
        cursorColor: Colors.white,
        style: textStyle2,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(20)),
            hintStyle: textStyle1,
            hintText: "Enter your password",
            border: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';

  Widget buildEmailField() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
        child: TextFormField(
          cursorColor: Colors.white,
          style: textStyle2,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 222, 30, 120),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: "hello@gmail.com",
            hintStyle: textStyle1,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 222, 30, 120),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            suffixIcon: _email.isNotEmpty && isValidEmail(_email)
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : null,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!isValidEmail(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              _email = value;
            });
          },
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    const emailPattern = r'^\w+@[a-zA-Z_]+\.[a-zA-Z]{2,}$';

    final regExp = RegExp(emailPattern);

    return regExp.hasMatch(email);
  }

  Widget buildTaptoSignup(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: textStyle1,
          ),
          const SizedBox(
            width: 8,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ScreenSignup()));
              },
              child: const Text(
                "Sign up",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
