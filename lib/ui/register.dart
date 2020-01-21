import 'package:flutter/material.dart';
import 'package:tapiwa_app/ui/login.dart';
import 'package:tapiwa_app/utils/auth.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  bool isLoading = false;
  final auth = new Auth();
  final _formKey = GlobalKey<FormState>();

  bool isEmailValid(email){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return !emailValid;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextEditingController emailController = new TextEditingController();
    TextEditingController nameController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    TextEditingController confirmPasswordController =
        new TextEditingController();

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/boozelogo.png'),
      ),
    );

    final Username = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: nameController,
      decoration: InputDecoration(
        hintText: 'User Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (value.isEmpty || value.length < 3) {
          return 'Please enter valid name';
        }
        return null;
      },
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (isEmailValid(value) || value.isEmpty) {
          return 'Please enter valid email';
        }
        return null;
      },
    );

    final password = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (value.isEmpty || value.length < 6) {
          return 'Your Password must be more than 6 chars';
        }
        return null;
      },
    );

    final confirm_password = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: ' Confirm Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (value.isEmpty || value.length < 3) {
          return 'Your Password must be more than 6 chars';
        }else if(value != passwordController.text){
          return 'your credentials dont match';
        }
        return null;
      },
    );

    final RegisterButton = !isLoading
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print('loading');
                  setState(() {
                    isLoading = true;
                  });
                  auth.register(emailController.text, passwordController.text,
                      nameController.text, confirmPasswordController.text);

                }
              },
              padding: EdgeInsets.all(12),
              color: Colors.brown,
              child: Text('Log In', style: TextStyle(color: Colors.white)),
            ))
        : Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.cyan,
              strokeWidth: 5,
            ),
          );

    final signinLabel = FlatButton(
      child: Text(
        'Already have an account !!',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () => Navigator.of(context)
          .push(new MaterialPageRoute(builder: (context) => new Login())),
    );

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Username,
                  SizedBox(height: 8.0),
                  email,
                  SizedBox(height: 8.0),
                  password,
                  SizedBox(height: 8.0),
                  confirm_password,
                  SizedBox(height: 24.0),
                  RegisterButton,
                  signinLabel
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
