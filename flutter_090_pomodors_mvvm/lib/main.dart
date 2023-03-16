import 'package:flutter/material.dart';
import 'package:flutter_090_pomodors/pages/dash_board_page.dart';
import 'package:flutter_090_pomodors/pages/main_page.dart';
import 'package:flutter_090_pomodors/ui_model/page_view_model.dart';
import 'package:flutter_090_pomodors/ui_model/timer_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  /**
   * main() => stateless => stateFull => state 이러한 경로를 중간 생략하는 경우
   * DataBinding 이 되는 경우
   * main() 함수에 App 초기화 하는 코드들이 있는경우는
   * 이 속성을 추가해 주는 것이 좋다
   */
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TimerViewModel()),
        ChangeNotifierProvider(create: (_) => PageViewModel())
      ],
      child: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var pageViewModel = context.watch<PageViewModel>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/background.jpg"),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView(
            controller: pageViewModel.pageController,
            scrollDirection: Axis.horizontal,
            // page가 전환되었을때 bottomNav 에 표시하기 위해서
            onPageChanged: (newPageIndex) =>
                pageViewModel.pageViewChange(newPageIndex),
            children: const [
              MainPage(),
              DashBoardPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: pageViewModel.pageIndex,
            onTap: (pageIndex) => {
              pageViewModel.bottomNavTap(pageIndex),
              // pageViewModel.pageViewChange(pageIndex)
              // pageViewModel.pageController.animateToPage(
              //   pageIndex, // 몇번페이지 보일까
              //   duration: const Duration(seconds: 1), // 페이지 전환시간
              //   curve: Curves.ease, // 애니메이션 종류
              // )
            },
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Dash Board",
                icon: Icon(Icons.dashboard),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
