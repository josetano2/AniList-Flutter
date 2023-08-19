import 'package:flutter/material.dart';
import 'package:qualif_flutter/anime_list.dart';
import 'package:qualif_flutter/pages/details_page.dart';
import 'package:qualif_flutter/pages/login_page.dart';
import 'package:qualif_flutter/pages/main_page.dart';
import 'package:qualif_flutter/pages/users_page.dart';
import 'package:qualif_flutter/theme/theme.dart';

void main(List<String> args) {
  runApp(const AniList());
}

class AniList extends StatelessWidget {
  const AniList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AniList",
      // theme: isDarkTheme ? darkTheme : lightTheme,
      theme: ThemeData(
        // primarySwatch: Colors.lightBlue,
        fontFamily: 'Ubuntu',
      ),
      home: const LoginPage(),
      // home: MainPage(username: "JE"),
      // home: DetailsPage(anime: animeList[0]),
      // home: UsersPage(username: "DG23-2"),
    );
  }
}