import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
final bloc=Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          SizedBox(
            height: 25,
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged:bloc.changeEmail ,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'you@example.com', labelText: 'Email Address',errorText: snapshot.error),
          );
        });
  }

  passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'enter your password ', labelText: 'enter your password',errorText: snapshot.error),
        );
      }
    );
  }

  submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.sumbitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text("Login"),
          color: Colors.blue,
          onPressed: snapshot.hasData?bloc.submit:null,
        );
      }
    );
  }
}
