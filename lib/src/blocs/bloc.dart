import 'dart:async';
import 'dart:ui';
import 'validators.dart';
import 'package:rxdart/rxdart.dart' ;

class Bloc extends Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // add data to stream
  Stream<String> get email => _email.stream.transform(validatorEmail);

  Stream<String> get password => _password.stream.transform(validatorPassword);
  Stream<bool> get sumbitValid => Rx.combineLatest2(email,password,(e,p)=>true);


  // change data
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;
  void submit(){
    print("email =  ${_email.value}");
    print("password= ${_password.value}");
  }


dispose(){
  _email.close();
  _password.close();

}

}

//final bloc=new Bloc();
