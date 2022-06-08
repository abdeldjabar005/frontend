import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/buildProperties.dart';
import 'package:xy2/Screens/Login/loginpage.dart';
import 'package:xy2/modules/Post.dart';
import 'package:xy2/network/post_helper.dart';
import 'package:xy2/modules/User.dart';
import 'package:xy2/widgets/post_widget.dart';
import 'package:xy2/widgets/loading.dart';
import 'package:xy2/modules/shared_preference.dart';
import 'package:xy2/Screens/Home/favorite.dart/favourite.dart';
class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late Future posts;
  @override
  void initState() {
    super.initState();
    posts = PostService.getFavorites();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: FutureBuilder(
        future: posts,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingButton();
          } else if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasData) {
            return FavouritePage();
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  List<PostsData> allposts = snapshot.data as List<PostsData>;
                  return buildProperty(allposts[i]
                  );
                });
          }
        },
      ),
    );
  }
}
