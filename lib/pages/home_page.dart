  import 'package:flutter/material.dart';
  import 'package:carousel_slider/carousel_slider.dart';
  import 'package:qualif_flutter/anime_list.dart';

  import 'details_page.dart';

  // ignore: must_be_immutable
  class HomePage extends StatefulWidget {
    String username;
    HomePage({super.key, required this.username});

    @override
    State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
      return Scrollbar(
        thickness: 8.0,
        thumbVisibility: true,
        interactive: true,
        trackVisibility: false,
        radius: const Radius.circular(10),
        child: SingleChildScrollView(
          // padding: const EdgeInsets.only(top: 40.0),
          child: Container(
            // color: const Color.fromRGBO(13, 22, 36, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.83,
                      // color: const Color.fromRGBO(13, 22, 36, 1),
                      decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular(10.0),
                        color: Color.fromRGBO(13, 22, 36, 0.7),
                        // color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "The next-generation anime platform",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              // color: Colors.white,
                              fontFamily: 'Ubuntu',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Track, share, and discover your favorite anime and manga with AniList",
                            style: TextStyle(
                              fontSize: 15,
                              // color: Colors.white,
                              // color: Color.fromRGBO(144, 194, 233, 1),
                              color: Colors.grey
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/stats.png"
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Discover your obesessions",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "What are your highest rated genres or most watched voice actors? Follow your watching habits over time with in-depth statistics.",
                                      style: TextStyle(
                                        // color: Color.fromRGBO(144, 194, 233, 1),
                                        // color: Colors.white,
                                        color: Colors.grey
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/apps.png"
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bring AniList anywhere",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Keep track of your progress on-the-go with one of many AniList apps across iOS, Android, macOS, and Windows.",
                                      style: TextStyle(
                                        // color: Colors.white,
                                        // color: Color.fromRGBO(144, 194, 233, 1),
                                        color: Colors.grey
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/social.png"
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Join the conversation",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Share your thoughts with our thriving community, make friends, socialize, and receive recommendations.",
                                      style: TextStyle(
                                        // color: Colors.white,
                                        // color: Color.fromRGBO(144, 194, 233, 1),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/custom.png"
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tweak it to your liking",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Customize your scoring system, title format, color scheme, and much more! Also, we have a dark mode.",
                                      style: TextStyle(
                                        // color: Colors.white,
                                        // color: Color.fromRGBO(144, 194, 233, 1),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                // const SizedBox(
                //   height: 40,
                // ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 20.0),
                //   child: Text(
                //     "Trending Now:",
                //     style: TextStyle(
                //       fontSize: 30,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 40,
                ),
                CarouselSlider(
                  items: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(anime: Data.animeList[1], username: widget.username),
                          )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/home_anime1.png"
                            ),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(anime: Data.animeList[2], username: widget.username),
                          )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/home_anime2.png"
                            ),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(anime: Data.animeList[0], username: widget.username),
                          )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/home_anime3.png"
                            ),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                    ),
                  ], 
                  options: CarouselOptions(
                    height: 300.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                    viewportFraction: 0.8,
                  )
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Romance",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Data.romanceAnime.length,
                          itemBuilder: (context, index) {
                            double leftGap = index == 0 ? 0 : 8.0;
                            double rightGap = index == Data.romanceAnime.length - 1 ? 0 : 8.0; 
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(anime: Data.romanceAnime[index], username: widget.username),
                                  )
                                );
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
                                          Data.romanceAnime[index].image
                                        ),
                                        height: 220,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      Data.romanceAnime[index].title,
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
                const SizedBox(
                  height: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Slice of Life",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Data.sliceOfLifeAnime.length,
                          itemBuilder: (context, index) {
                            double leftGap = index == 0 ? 0 : 8.0;
                            double rightGap = index == Data.sliceOfLifeAnime.length - 1 ? 0 : 8.0; 
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(anime: Data.sliceOfLifeAnime[index], username: widget.username),
                                  )
                                );
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
                                          Data.sliceOfLifeAnime[index].image
                                        ),
                                        height: 220,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      Data.sliceOfLifeAnime[index].title,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Action",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Data.actionAnime.length,
                          itemBuilder: (context, index) {
                            double leftGap = index == 0 ? 0 : 8.0;
                            double rightGap = index == Data.actionAnime.length - 1 ? 0 : 8.0; 
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(anime: Data.actionAnime[index], username: widget.username),
                                  )
                                );
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
                                          Data.actionAnime[index].image
                                        ),
                                        height: 220,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      Data.actionAnime[index].title,
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
          ),
        ),
      );
    }
  }