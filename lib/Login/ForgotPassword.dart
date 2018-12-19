import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State createState() => new ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final myController = new TextEditingController();

  // Create a global key that will uniquely identify the `Scaffold` , `Form` widget
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  String _email;


  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    }
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    final snackbar = new SnackBar(
      content: new Text('Email: $_email'),
    );

    if (scaffoldKey.currentState == null) {
      print("Success");
     } else {
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    super.dispose();
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: new Text("Forgot Password"),
        backgroundColor: Colors.teal,    
      ),
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
          new Padding(padding: EdgeInsets.all(20.0)),
              new Image(
                image: new AssetImage('assets/Forgot_password_image.png'),
                fit: BoxFit.cover,
              ),
              new Padding(padding: new EdgeInsets.all(15.0)),
              new Text(
                'Enter Email to send Password Rest Link!', style: new TextStyle(color: Colors.white,fontSize: 14.0),
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
                     new Padding(
                              padding: const EdgeInsets.only(top: 15.0)),
                          new RaisedButton(
                            onPressed: _submit,
                            child: new Text('Forgot Password'),
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