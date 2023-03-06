import 'package:flutter/material.dart';
import 'package:flutter_drawer_001/screen/home.dart';
import 'package:flutter_drawer_001/screen/image.dart';
import 'package:flutter_drawer_001/screen/write.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Flutter",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const NavPage(body: Home()),
        "/image": (context) => const NavPage(body: ImagePage()),
        "/write": (context) => const NavPage(body: WritePage()),
      },
    );
  }
}

class NavPage extends StatelessWidget {
  const NavPage({
    super.key,
    required this.body,
  });
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("플러터 Drawer"),
        centerTitle: true,
        elevation: 3,
      ),
      body: body,
      drawer: Drawer(
        child: ListView(
          children: [
            drawerMenuItem(
              title: "Home",
              icon: Icons.home,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false, // push 된 모둔 경로를 무조건 삭제
              ),
            ),
            drawerMenuItem(
              title: "사진보기",
              icon: Icons.image,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                "/image",
                (route) => false,
              ),
            ),
            drawerMenuItem(
              title: "글쓰기",
              icon: Icons.border_color,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                "/write",
                (route) => false,
              ),
            )
          ],
        ),
      ),
    );
  }

  Card drawerMenuItem({
    String title = "Home",
    IconData icon = Icons.home,
    Function()? onTap,
  }) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[860]),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
