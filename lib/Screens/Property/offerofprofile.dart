import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/buildProperties.dart';
import 'package:xy2/Screens/Home/favorite.dart/favourite.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/buildoffers.dart';
import 'package:xy2/modules/Post.dart';
import 'package:xy2/network/post_helper.dart';
import 'package:xy2/widgets/loading.dart';

class profileofoffer extends StatefulWidget {
  final int id;
 profileofoffer(this.id);

  @override
  State<profileofoffer> createState() => _profileofofferState();
}

class _profileofofferState extends State<profileofoffer> {
  late Future posts;
  @override
  void initState() {
    super.initState();
    posts = PostService.getAgency(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color(0xFFe9b7ce),
              Color(0xFFffb88e),
              Color(0xFFabc9e9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
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
                      List<PostsData> allposts =
                          snapshot.data as List<PostsData>;
                      return buildProperty(allposts[i]);
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}
