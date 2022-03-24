


import 'package:flutter/material.dart';
import 'package:tyncad_test/models/user.dart';

class AppState extends ChangeNotifier{
  User? _user;

  signOut(){
    _user  = null;
    notifyListeners();
  }


  signIn(User user){
    _user = user;
    notifyListeners();
  }


  bool get isSignedIn => _user != null;
  String get token => _user!.token;
  User get user => _user!;

}