import 'package:flutter/material.dart';
import 'package:qualif_flutter/anime_list.dart';
import '../models/anime_model.dart';
import '../models/comment_model.dart';
import '../theme/theme.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  Anime anime;
  String username;
  DetailsPage({super.key, required this.anime, required this.username});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  
  TextEditingController commentController = TextEditingController();
  String? errorMsg;

  void resetError() {
    setState(() {
      errorMsg = null;
    });
  }

  void validation() {
    resetError();
    String inputComment = commentController.text;
    if (inputComment.isEmpty) {
      setState(() {
        errorMsg = "Comment cannot be empty";
      });
      SnackBar snackBar = const SnackBar(
        content: Text("Comment cannot be empty"),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    widget.anime.addComments(inputComment, widget.username);
    commentController.clear();
    setState(() {
      
    });
  }

  bool getAnimeState(){
    return Data.myList.any((currAnime) => currAnime.title == widget.anime.title);
  }

  void addAnimeToMyList(){
    setState(() { 
      if (!getAnimeState()) {
        Data.myList.add(widget.anime);
      } 
      else {
        Data.myList.removeWhere((currAnime) => currAnime.title == widget.anime.title); 
      }
    });
  }

  bool getFavoriteState(){
    return Data.favList.any((currAnime) => currAnime.title == widget.anime.title);
  }

  void addAnimeToFavList(){
    setState(() { 
      if (!getFavoriteState()) {
        Data.favList.add(widget.anime);
      } 
      else {
        Data.favList.removeWhere((currAnime) => currAnime.title == widget.anime.title); 
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkTheme ? darkTheme : lightTheme,
      child: Scaffold(
        body: Scrollbar(
          thickness: 8.0,
          thumbVisibility: true,
          interactive: true,
          trackVisibility: false,
          radius: const Radius.circular(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Stack(
                      children: [
                        Image(
                          image: AssetImage(
                            widget.anime.banner,
                          ),
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        Opacity(
                          opacity: 0.3,
                          child: Container(
                            height: 300,
                            color: Colors.black,
                          )
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 200,
                      child: ClipRect(
                        child: Image(
                          image: AssetImage(
                            widget.anime.image,
                          ),
                          height: 175,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.37,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: TextButton(
                          onPressed: addAnimeToMyList,
                          child: Text(
                            getAnimeState() ? "Remove from List" : "Add to Watchlist",
                            style: TextStyle(
                                fontSize: getAnimeState() ? 15 : 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 249, 43, 43),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: TextButton(
                          onPressed: addAnimeToFavList,
                          child: Icon(
                            getFavoriteState() ?  Icons.favorite : Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.anime.title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${widget.anime.rating}/10",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: Colors.lightBlue,
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.movie,
                              color: isDarkTheme ? Colors.white : Colors.black,
                            ),
                          ),
                          Tab(
                            icon: Icon(
                              Icons.rate_review,
                              color: isDarkTheme ? Colors.white : Colors.black,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 550,
                        child: TabBarView(
                          children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                    ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.anime.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Comment",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24
                                  ),
                                ),
                                TextField(
                                  controller: commentController,
                                  decoration: InputDecoration(
                                      hintText: "Insert your comment here!",
                                      suffixIcon: GestureDetector(
                                        onTap: validation,
                                        child: const Icon(
                                          Icons.send,
                                          color: Colors.lightBlue,
                                        ),
                                      )
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   const Text(
                                    "Comments",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      padding: const EdgeInsets.all(0.0),
                                      itemCount: widget.anime.comments.length,
                                      itemBuilder: (context, index) {
                                        Comment commentContent = widget.anime.comments[index];
                                        return Column(
                                          children: [
                                            Row(
                                              children: [
                                                Center(
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Image(
                                                      width: 30,
                                                      height: 30,
                                                      image: AssetImage(
                                                        "assets/pfp.png",
                                                      )
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        commentContent.content,
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      Text(
                                                        commentContent.commenter,
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      }
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ]
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
