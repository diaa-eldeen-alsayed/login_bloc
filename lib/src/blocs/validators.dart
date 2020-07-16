import 'dart:async';


class Validators{
  final validatorEmail=StreamTransformer<String,String>.fromHandlers(handleData: (email,sink){
    if(email.contains('@'))
    {
     sink.add(email);
    }
    else{
      sink.addError("Enter valid email ");
    }
  },);
  final validatorPassword=StreamTransformer<String,String>.fromHandlers(handleData: (password,sink){
    if(password.length>3)
    {
      sink.add(password);
    }
    else{
      sink.addError("Enter password at a least 4 ");
    }
  },);
}