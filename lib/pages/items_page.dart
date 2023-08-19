import 'package:flutter/material.dart';
import 'package:qualif_flutter/models/anime_model.dart';
import 'package:qualif_flutter/anime_list.dart';
import 'package:qualif_flutter/pages/details_page.dart';

// ignore: must_be_immutable
class ItemsPage extends StatefulWidget {
  String username;
  ItemsPage({super.key, required this.username});
  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {

  List<Anime> searchList = List.from(Data.animeList);

  void updatePage(String searchValue){
    setState(() {
      searchList = Data.animeList.where((element) => element.title.toLowerCase().contains(searchValue.toLowerCase())).toList();
    });
  }

  TextEditingController searchBarController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: searchBarController,
          onChanged: (value) => updatePage(value),
            style: const TextStyle(
            color: Colors.white,
            ),
            decoration: InputDecoration(  
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            fillColor: const Color.fromRGBO(46, 59, 73, 1),
            filled: true,
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                searchBarController.text.isEmpty ? Icons.search : Icons.clear,
                color: Colors.white,
              ),
              onPressed: () {
                if(searchBarController.text.isNotEmpty){
                  searchBarController.clear();
                  updatePage('');
                }
              },
            )
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: searchList.length,
            itemBuilder: ((context, index) {
              Anime currAnime = searchList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(anime: currAnime, username: widget.username),
                    )
                  );
                },
                child: Stack(
                  children: [
                    // Container(
                    //   height: 250,
                    //   // color: const Color.fromRGBO(13, 22, 36, 1),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10.0),
                    //     color: const Color.fromRGBO(13, 22, 36, 0.7),
                    //     // color: Theme.of(context).colorScheme.background,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: AssetImage(
                                    currAnime.image,
                                  ),
                                  width: 175,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currAnime.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.white
                                        // color: isDarkTheme ? Colors.white : Colors.black,
                                        // color: Theme.of(context).textTheme.displayLarge?.color,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      currAnime.description,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        // color: Colors.white,
                                        // color: Color.fromRGBO(144, 194, 233, 1),
                                      ),
                                      maxLines: 7,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true, 
                                      textAlign: TextAlign.justify,
              
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      // alignment: ,
                                      children: currAnime.genre.map((genre) {
                                        return Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                          child: Text(
                                            genre,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          )
        ),  
      ],
    );
  }
}

