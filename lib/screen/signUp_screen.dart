import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helper.dart';
import 'login_screen.dart';

class ScreenSignup extends StatefulWidget {
  @override
  _ScreenSignupState createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenSignup> {
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
            "Sign up",
            style: textStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              buildText(
                  name: "Sign up with one of following options",
                  choose: textStyle1),
              buildGoogleAppleFunction(mq),
              buildText(name: "Name", choose: textStyle2),
              buildNameField(),
              buildText(name: "Email", choose: textStyle2),
              buildEmailField(),
              buildText(name: "Password", choose: textStyle2),
              buildPasswordField(),
              const SizedBox(
                height: 20,
              ),
              buildCreateanAccount(),
              buildTaptoLogin(context),
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

  Widget buildGoogleAppleFunction(Size mq) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 3, bottom: 25),
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
                    primary: Colors.red,
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';

  Widget buildNameField() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 5),
        child: TextFormField(
          style: textStyle2,
          cursorColor: Colors.white,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 222, 30, 120),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: "Full Name",
            hintStyle: textStyle1,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 222, 30, 120),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            suffixIcon: _name.isNotEmpty
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : null,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              _name = value;
            });
          },
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
      child: TextFormField(
        style: textStyle2,
        cursorColor: Colors.white,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: "hello@gmail.com",
          hintStyle: textStyle1,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget buildText({required String name, required TextStyle choose}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Text(
        name,
        style: choose,
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
      child: TextFormField(
        style: textStyle2,
        cursorColor: Colors.white,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: "pick a strong password",
            hintStyle: textStyle1,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.pinkAccent),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  Widget buildCreateanAccount() {
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
            "Sign Up",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildTaptoLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: textStyle1,
          ),
          const SizedBox(
            width: 8,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ScreenLogin()));
              },
              child: const Text(
                "Log in",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
