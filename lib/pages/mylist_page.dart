import 'package:flutter/material.dart';
import 'package:qualif_flutter/anime_list.dart';

import 'details_page.dart';

// ignore: must_be_immutable
class MyListPage extends StatefulWidget {
  String username;
  MyListPage({super.key, required this.username});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  @override
  Widget build(BuildContext context) {
    if(Data.myList.isEmpty){
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Watchlist is still empty!",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        );
      }
    else{
      return Scrollbar(
        thickness: 8.0,
        thumbVisibility: true,
        interactive: true,
        trackVisibility: false,
        radius: const Radius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                "Watchlist",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3/4,
                  ),
                  itemCount: Data.myList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(anime: Data.myList[index], username: widget.username),
                          )
                        );
                        setState(() {
                          
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridTile(
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.25,
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: AssetImage(Data.myList[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                Data.myList[index].title,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}