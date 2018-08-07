import "package:flutter/material.dart";
import "../blocs/provider.dart";

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Your@Email.com",
            labelText: "Enter your E-mail:",
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: "Password",
            labelText: "Enter your password",
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(bloc) {
    return StreamBuilder(
        stream: bloc.formValid,
        builder: (context, snapshot) {
          return RaisedButton(
            child: Text('Submit'),
            color: Colors.blue,
            onPressed: snapshot.hasData ? () {bloc.submit();}:null,
          );
        });
  }
}
