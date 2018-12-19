import 'package:flutter/material.dart';
import 'package:fooddelivery/Login/auth.dart';
import 'package:fooddelivery/Home/HomePage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
 SignupPage({this.auth, this.onSignup});
  final AuthImpl auth;
  final VoidCallback onSignup;

  @override
  State createState() => new SignupPageState();
}

enum FormMode { SIGNIN, SIGNUP }

class SignupPageState extends State<SignupPage>  {
  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final myController = new TextEditingController();
  final passwordController = new TextEditingController();
  final nameController = new TextEditingController();
  // Create a global key that will uniquely identify the `Scaffold` , `Form` widget
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String _name;
  FormMode _formMode = FormMode.SIGNUP;


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
        if (_formMode == FormMode.SIGNUP)  {
          String userId = await widget.auth.signUp(_email, _password,_name);
          print('Signed up user: $userId');
         if (userId.length != 0) {
           Navigator.push(
             context,
              new MaterialPageRoute(builder: (context) => new HomePage(value:_email,)),
             );
          }
        }
        widget.onSignup();
      } catch (error) {
        print('Error: $error');
        Fluttertoast.showToast(
        msg: "Login Failed. Check your info.$error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
       );
      }
    }
  }


 

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    super.dispose();
    myController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: new Text("Signup"),
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
              new Padding(padding: EdgeInsets.all(1.0)),
              new Image(
                image: new AssetImage('assets/Food-Truck.png'),
                height: 180.0,
                width: 200.0,
             ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new Text(
                'Welcome on board!', style: new TextStyle(color: Colors.white,fontSize: 18.0),
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
                            controller: nameController,
                            decoration:
                                new InputDecoration(labelText: 'Name'),
                            keyboardType: TextInputType.text,
                            validator: (val) =>
                                val.length < 3 ? 'Name too short.' : null,
                            onSaved: (val) => _name = val,
                          ),

                          
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
                              padding: const EdgeInsets.only(top: 25.0)),
                         ButtonTheme (
                            minWidth:200.0,
                            height:50.0,
                            child:RaisedButton(
                            onPressed: validateAndSubmit,
                            child: new Text('Sing Up'),
                            ),),
                          new Padding(
                              padding: const EdgeInsets.only(top: 20.0)),
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