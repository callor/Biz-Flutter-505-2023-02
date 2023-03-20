import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_member/provider/email_login_provider.dart';
import 'package:flutter_member/provider/google_login_provider.dart';
import 'package:flutter_member/screen/firebase_join.dart';
import 'package:flutter_member/screen/firebase_login.dart';
import 'package:flutter_member/screen/reservation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Member',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          // if it's a RTL language
        ],
        supportedLocales: const [
          Locale('ko', 'KR'),
          // include country code too
        ],
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => GoogleLoginViewModel()),
            ChangeNotifierProvider(create: (_) => EmailLoginViewModel())
          ],
          child: const HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Member"),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(context),
        ));
  } // end build

  GestureDetector googleLogin(GoogleLoginViewModel googleViewModel) {
    return GestureDetector(
      onTap: googleViewModel.handleSignIn,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF4285F4),
                ),
              ),
              width: 35,
              height: 35,
              child: Image.asset("images/btn_google.png")),
          Container(
            color: const Color(0xFF4285F4),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Google 로그인",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    var googleViewModel = context.watch<GoogleLoginViewModel>();
    var emailViewModel = context.watch<EmailLoginViewModel>();

    final GoogleSignInAccount? user = googleViewModel.currentUser;
    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 3,
            child: ListTile(
              leading: GoogleUserCircleAvatar(
                identity: user,
              ),
              // 변수 ?? 값 : 변수 값이 null 이면 값을 return
              // user.displayName != null ? user.displayName : ''
              title: Text(user.displayName ?? ''),
              subtitle: Text(user.email),
            ),
          ),
          ElevatedButton(
            onPressed: googleViewModel.handleSignOut,
            child: const Text("로그아웃"),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReservationPage(),
                  ));
            },
            child: const Text("예약하기"),
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          emailViewModel.authUser == null
              ? const Text(
                  "로그인",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                )
              : const Text(
                  "로그인 되었음",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
          Container(
            margin: const EdgeInsets.all(10),
            child: emailViewModel.authUser != null
                ? Column(
                    children: [
                      emailViewModel.authUser!.emailVerified
                          ? Text("UserName : ${emailViewModel.authUser!.email}")
                          : const Text(
                              "이메일 인증이 되어 있지 않음",
                            ),
                      ElevatedButton(
                        onPressed: () async {
                          emailViewModel.logout();
                          // await FirebaseAuth.instance.signOut();
                          // emailViewModel.authUser = null;
                          // FirebaseAuth.instance.currentUser;
                          // setState(() {});
                        },
                        child: const Text("로그아웃"),
                      )
                    ],
                  )
                : Column(
                    children: [
                      // 파사드 패턴, 끌어올리기 패턴
                      LoginPage(loginSubmit: emailViewModel.loginSubmit),
                      googleLogin(googleViewModel),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const JoinPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "이메일로 회원가입",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
          /**
           * Flexible
           * 내부에 있는 widget 이 화면을 벗어나려고 할때
           * fit 속성을 FlexFit.tight 로 설정하면
           * 화면 범위내에서 화면의 남은 영역만 차치하도록
           * 내부 화면 범위를 제한한다
           */
          const Flexible(
              fit: FlexFit.tight,
              child: SizedBox(
                height: 1000,
              ))
        ],
      );
    }
  }
}
