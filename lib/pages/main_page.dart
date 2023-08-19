import 'package:flutter/material.dart';
import 'package:qualif_flutter/pages/home_page.dart';
import 'package:qualif_flutter/pages/items_page.dart';
import 'package:qualif_flutter/pages/mylist_page.dart';
import 'package:qualif_flutter/pages/users_page.dart';

import '../theme/theme.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  String username;
  MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
  List<Widget> pages = [
    HomePage(username: widget.username),
    ItemsPage(username: widget.username),
    MyListPage(username: widget.username,),
    UsersPage(username: widget.username),
  ];
    return Theme(
      data: isDarkTheme ? darkTheme : lightTheme,
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        // backgroundColor: isDarkTheme ? Colors.transparent :const Color.fromRGBO(211, 230, 253, 0.9),
        appBar: AppBar(
          elevation: 0,
          // shape: const ContinuousRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(10),
          //     bottomRight: Radius.circular(10),
          //   )
          // ),
          // backgroundColor: const Color.fromARGB(255, 38, 144, 193),
          backgroundColor: const Color.fromRGBO(28, 36, 44, 1),
          // backgroundColor: isDarkTheme ? const Color.fromRGBO(28, 36, 44, 1) : const Color.fromRGBO(28, 36, 44, 0.8),
          // backgroundColor: Colors.transparent,
          title: const Row(
            children: [
              Image(
                image: AssetImage(
                  "assets/logo.png",
                ),
                height: 50,
                width: 50,
              ),
              // Text(
              //   "Welcome Back ${getUsername()}!",
              //   // style: Theme.of(context).textTheme.bodyLarge,
              //   )
            ]
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isDarkTheme = !isDarkTheme;
                  currTheme == lightTheme ? darkTheme : lightTheme;
                });
              }, 
              icon: Icon(
                isDarkTheme ? iconLight : iconDark,
                color: Colors.white,
                // color:  isDarkTheme ? Colors.white : Colors.black,
              )
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.zero,
          child: pages[selectedPage],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(size: 28),
          unselectedIconTheme: const IconThemeData(size: 28),
          onTap: ((value) {
            setState(() {
                selectedPage = value;
            });
          }),
          unselectedItemColor: isDarkTheme ? Colors.white : Colors.black,
          selectedItemColor: Colors.lightBlue,
          currentIndex: selectedPage,
          items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Anime",
            icon: Icon(Icons.inventory),
            activeIcon: Icon(Icons.inventory),
          ),
          BottomNavigationBarItem(
            label: "PTW",
            icon: Icon(Icons.list_alt),
            activeIcon: Icon(Icons.list_alt),
          ),
          BottomNavigationBarItem(
            label: "User",
            icon: Icon(Icons.account_circle_rounded),
            activeIcon: Icon(Icons.account_circle_rounded),
          ),
        ]),
      ),
    );
  }

  void toggleTheme(){
    setState(() {
      isDarkTheme = !isDarkTheme;
      currTheme = isDarkTheme ? darkTheme : lightTheme;
    });
  }


}