import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/components.dart';
import 'package:flash_chat/screens/round_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            Container(
            height: 200.0,
            child: Image.asset('images/logo.png'),
          ),
          SizedBox(
            height: 48.0,
          ),
          TextField(
            textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email')
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password')
          ),
          SizedBox(
            height: 24.0,
          ),
          RoundButton(onPressed: () async {
            try {
              setState(() {
                showSpinner = true;
              });
              final userLoggedIn = await auth.createUserWithEmailAndPassword(
                  email: email, password: password);
              if(userLoggedIn !=null ){
                setState(() {
                  showSpinner = false;
                });
                Navigator.pushNamed(context, ChatScreen.id);
              }

            } catch (e) {
              print(e);
            }
          },
          text: 'Register',
          colour: Colors.lightBlueAccent,)
        ],
    ),),
      )
    ,
    );
  }
}
