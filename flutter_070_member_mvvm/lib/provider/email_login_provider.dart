import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailLoginViewModel with ChangeNotifier {
  User? _authUser;
  User? get authUser => _authUser;

  EmailLoginViewModel() {
    _authUser = FirebaseAuth.instance.currentUser;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    _authUser = null;
    notifyListeners();
  }

  Future<void> loginSubmit({required email, required password}) async {
    // FocusScope.of(context).requestFocus(FocusNode());
    try {
      // firebase_auth 에서 제공하는 API 클래스
      UserCredential resultAuth =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _authUser = resultAuth.user;
      notifyListeners();
      // setState(() {});
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "user-not-found") {
        message = "사용자가 존재하지 않습니다";
      } else if (e.code == "wrong-password") {
        message = "비밀번호가 맞지 않습니다";
      } else if (e.code == "invalid-email") {
        message = "이메일을 확인하세요";
      } else {
        message = "${e.code} 알수없는 오류 발생";
      }
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text(message),
      //   backgroundColor: Colors.deepOrange,
      // ));
    }
  }
}
