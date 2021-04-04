import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'RegistrationScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medicatn/main.dart';
import '../navbar/mainScreen.dart';
class LoginScreen extends StatelessWidget {
  static const String idScreen = "login";
  TextEditingController emailTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey,
      body: Padding(

        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child:

          Column(
            children: [

              SizedBox(height: 25.0,),

              Image(

                  image: AssetImage("images/2.png"),
                width: 250.0,
                height: 250.0,
                alignment: Alignment.center,
              ),

              SizedBox(height: 15.0,),
              Text(
                "Login ",
                style: TextStyle(fontSize: 24.0, fontFamily: "Band Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    SizedBox(height: 1.0,),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),

                    ),
                    SizedBox(height: 1.0,),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "password",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),

                    ),
                    SizedBox(height: 10.0,),
                    RaisedButton(
                      color: Color.fromRGBO(46, 112, 74, 1),
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: "Brand Blod"),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: () {
                        if (!emailTextEditingController.text.contains("@")) {
                          displayToastMessage(
                              "Email address is not Valid", context);
                        }
                        else if (passwordTextEditingController.text.isEmpty) {
                          displayToastMessage("password is mandatory", context);
                        }
                        else {
                          login(context, emailTextEditingController.text, passwordTextEditingController.text);
                        }
                      },

                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RegistrationScreen.idScreen, (route) => false);
                },
                child: Text(
                    "do not have an account ? Register here"
                ),
              ),
              signInButton(context) ,
              SizedBox(height: 5.0,),

              signInFb(context),
            ],

          ),
        ),
      ),


    );

  }
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  // This method is not working properly, you can fix it or use mine
  void loginAndAuthenticateUser(BuildContext context)async
  {
    final User user = (await _firebaseAuth
        .signInWithEmailAndPassword(email:emailTextEditingController.text,
        password:passwordTextEditingController.text)
        .catchError((errMsg){
      displayToastMessage("Error:" + errMsg.toString(), context);
    })).user;

    if (user != null) {
      usersRef.child(user.uid).once().then(
              (DataSnapshot snap) {
            if (snap.value != null) {
              Navigator.pushNamedAndRemoveUntil(
                  context, MainScreen.idScreen, (route) => false);
              displayToastMessage("u re logged in now ", context);
            }
            else {
              _firebaseAuth.signOut();
              displayToastMessage(
                  "no record exists for this user . please create new account",
                  context);
            }
          });
    }
    else {
      //error
      displayToastMessage("error occured,", context);
    }
  }

  /*
  * This function serves the purpose of logging in using Firebase Authentication with username and password
  * If you want to change or modify it to your needs feel free
  */
  void login(BuildContext context, String username, String pwd) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username,
          password: pwd
      );
      if (userCredential.user != null)
        {
          Navigator.pushNamedAndRemoveUntil(
              context, MainScreen.idScreen, (route) => false);
          displayToastMessage("u re logged in now ", context);
        }else{
        displayToastMessage("error occured", context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  Widget signInButton(context) {
    return OutlineButton(
      splashColor: Colors.black12,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return MainScreen();
                },
              ),
            );
          }
        });


      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      return '$user';
    }

    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }

  Widget signInFb(context) {
    return OutlineButton(
      splashColor: Colors.black12,
      onPressed: () {
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/fb.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Facebook',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}