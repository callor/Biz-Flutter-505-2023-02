import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Member',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// google 로그인을 수행하기 위한 초기화 함수
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (e) {
    print(e);
  }
}

class _HomePageState extends State<HomePage> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    /**
     * google login 이 되면 google 로 부터 이벤트가 전달될텐데
     * 이벤트를 기다리다가 user 정보가 오면 _currentUser 에 
     * google loin 정보를 저장하라
     */
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
        print("Sign In");
      });
    }); // end SingIn
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Member"),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  } // end build

  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;
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
            onPressed: () async {
              await _googleSignIn.signOut();
            },
            child: const Text("로그아웃"),
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "로그인",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
          loginForm(),
          const SizedBox(
            height: 10,
          ),
          googleLogin(),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: const Text(
              "회원가입",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
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

  Form loginForm() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Image(
              width: 100,
              height: 100,
              image: AssetImage("images/user.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            inputBox(
              keyboardType: TextInputType.emailAddress,
              errorMsg: "이메일을 입력해 주세요",
              labelText: "이메일",
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 10,
            ),
            inputBox(
              keyboardType: TextInputType.text,
              errorMsg: "비밀번호를 입력하세요",
              labelText: "비밀번호",
              obscureText: true,
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }

  GestureDetector googleLogin() {
    return GestureDetector(
      onTap: _handleSignIn,
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

  TextFormField inputBox(
      {keyboardType = TextInputType.text,
      String labelText = "값을 입력하세요",
      String errorMsg = "값을 입력하세요",
      bool obscureText = false,
      Function(dynamic value)? onChanged}) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: (value) {
        if (value!.isEmpty) {
          return errorMsg;
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
