import 'package:qualif_flutter/models/comment_model.dart';

class Anime {
  String title;
  String description;
  String image;
  String rating;
  List<String> genre;
  String banner;
  List<Comment> comments;

  void addComments(String comment, String user){
    comments.add(
      Comment(
        content: comment, 
        commenter: user
        )
      );
  }

  Anime({
    required this.title,
    required this.description,
    required this.image,
    required this.rating,
    required this.genre,
    required this.banner,
    required this.comments,
  });
}
