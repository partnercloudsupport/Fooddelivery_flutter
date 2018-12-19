import 'package:flutter/material.dart';
import 'package:fooddelivery/Login/ForgotPassword.dart';
import 'package:fooddelivery/Login/SignupPage.dart';
import 'package:fooddelivery/Home/HomePage.dart';
import 'package:fooddelivery/Login/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {

  LoginPage({this.auth, this.onSignedIn});

  final AuthImpl auth;
  final VoidCallback onSignedIn;

  @override
  State createState() => new LoginPageState();
}

enum FormMode { SIGNIN, SIGNUP }

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final myController = new TextEditingController();
  final passwordController = new TextEditingController();

  // Create a global key that will uniquely identify the `Scaffold` , `Form` widget
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  FormMode _formMode = FormMode.SIGNIN;

  
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formMode == FormMode.SIGNIN) {
          String userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
          if (userId.length != 0) {
           Navigator.push(
             context,
              new MaterialPageRoute(builder: (context) => new HomePage(value:_email,)),
             );
          }
        } 
        widget.onSignedIn();
      } catch (error) {
         Fluttertoast.showToast(
        msg: "Login Failed. Check your info.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
       );
       // print('Error: $error,email$_email');
      }
    } 
  }


  // void _submit() {
  //   final form = formKey.currentState;

  //   if (form.validate()) {
  //     form.save();

  //     // Email & password matched our validation rules
  //     // and are saved to _email and _password fields.
  //     _performLogin();
  //   }
  // }

  // void _performLogin() {
  //   // This is just a demo, so no actual login here.
  //   final snackbar = new SnackBar(
  //     content: new Text('Email: $_email, password: $_password'),
  //   );

  //   if (scaffoldKey.currentState == null) {
  //     print("Success");
  //     Navigator.push(
  //       context,
  //       new MaterialPageRoute(builder: (context) => new HomePage(value:_email,)),
  //     );
  //   } else {
  //     scaffoldKey.currentState.showSnackBar(snackbar);
  //   }
  // }


 @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    super.dispose();
    myController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
 
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/backgroundImg.jpg'),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.lighten,
          ),
          new Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(19.0)),
              new Image(
                image: new AssetImage('assets/Food-Truck.png'),
                height: 180.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new Text(
                'Welcome Back', style: new TextStyle(color: Colors.white,fontSize: 18.0),
              ),

              new Form(
                  key: formKey,
                  child: new Theme(
                    data: new ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                        inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                                color: Colors.white, fontSize: 20.0))),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Column(
                        children: <Widget>[
                          new TextFormField(
                            controller: myController,
                            decoration: new InputDecoration(labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) => !val.contains('@')
                                ? 'Not a valid email.'
                                : null,
                            onSaved: (val) => _email = val,
                          ),
                          new TextFormField(
                            controller: passwordController,
                            decoration:
                                new InputDecoration(labelText: 'Password'),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (val) =>
                                val.length < 6 ? 'Password too short.' : null,
                            onSaved: (val) => _password = val,
                          ),
                          new Padding(
                            padding:
                                new EdgeInsets.fromLTRB(160.0, 10.0, 10.0, 0.0),
                            child: new MaterialButton(
                              textColor: Colors.white,
                              child: new Text("Forgot Password?"),
                              onPressed: () {
                                //perform some action
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          new ForgotPasswordPage()),
                                );
                              },
                              splashColor: Colors.redAccent,
                            ),
                          ),
                          new Padding(
                              padding: const EdgeInsets.only(top: 15.0)),
                          ButtonTheme (
                            minWidth:200.0,
                            height:50.0,
                            child:RaisedButton(
                            onPressed: validateAndSubmit,
                            child: new Text('Log In'),
                            ),),
                          new Padding(
                              padding: const EdgeInsets.only(top: 20.0)),
                          new Padding(
                            padding:
                                new EdgeInsets.fromLTRB(20.0, 30.0, 10.0, 0.0),
                            child: new MaterialButton(
                              textColor: Colors.white,
                              child: new Text("New User to Signup?"),
                              onPressed: () {
                                //perform some action
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new SignupPage(auth: new Auth(),)),
                                );
                              },
                              splashColor: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
      resizeToAvoidBottomPadding:false,
    );
  }
}
