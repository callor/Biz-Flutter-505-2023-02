import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginViewModel with ChangeNotifier {
  // google Login 을 수행하기 위한 객체 선언
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
  GoogleSignInAccount? currentUser;

  // 생성자 method
  // 클래스가 생성될때 자동으로 호출되는 method
  GoogleLoginViewModel() {
    // google Login 에 대한 event 핸들러 등록
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      currentUser = account;
      notifyListeners();
    });
  }
  // 생성자를 통해서 event 핸들러를 등록하기 위하여 호출하는 함수
  GoogleLoginViewModel.internal();

  // 비동기 방식으로 호출하기 위한 설정
  // on Promise : 반드시 결과를 돌려준다 라는 설정
  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (e) {
      print(e);
    }
  }

  Future<void> handleSignOut() async {
    await _googleSignIn.disconnect();
  }
}
