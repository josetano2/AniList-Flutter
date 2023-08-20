import 'package:flutter/material.dart';
import 'package:qualif_flutter/pages/login_page.dart';
import 'package:qualif_flutter/theme/theme.dart';

import '../anime_list.dart';
import 'details_page.dart';

// ignore: must_be_immutable
class UsersPage extends StatefulWidget {
  String username;
  UsersPage({super.key, required this.username});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  void backToLogin(){
    Data.myList.clear();
    Data.favList.clear();
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
        builder: (context){
          isDarkTheme = false;
          return const LoginPage();
        }
      ),
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        image: AssetImage(
                          "assets/pfp.png"
                        )
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Username:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              widget.username,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Watchlist:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "${Data.myList.length} anime(s)",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.lightBlue
                            // border: Border.all(
                            //   color: Colors.red,
                            //   width: 3.0
                            // )
                          ),
                          child: TextButton(
                            onPressed: backToLogin,
                            child: const Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Favorites",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: Data.favList.isEmpty ?
                      const Text(
                        "No Favorites",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      )
                      :
                      SizedBox(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Data.favList.length,
                          itemBuilder: (context, index) {
                            double leftGap = index == 0 ? 0 : 8.0;
                            double rightGap = index == Data.favList.length - 1 ? 0 : 8.0; 
                            return GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(anime: Data.favList[index], username: widget.username),
                                  )
                                );
                                setState(() {
                                  
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(leftGap, 0, rightGap, 0),
                                // margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                width: 160,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image(
                                        image: AssetImage(
                                          Data.favList[index].image
                                        ),
                                        height: 220,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      Data.favList[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}