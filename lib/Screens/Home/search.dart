import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/buildProperties.dart';
import 'package:xy2/Screens/Home/favorite.dart/favourite.dart';
import 'package:xy2/modules/Post.dart';
import 'package:xy2/network/post_helper.dart';
import 'package:xy2/widgets/loading.dart';

class SearchResult extends StatefulWidget {
  String keyword;
  SearchResult(this.keyword);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late Future posts;
  @override
  void initState() {
    super.initState();
    posts = PostService.search(widget.keyword);
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
        child: Column(
          children: [
            Padding(
          padding: const EdgeInsets.fromLTRB(15.0,50,15.0,10.0),
          child: Container(
            height: 50,
            child: CupertinoSearchTextField(
              backgroundColor: Colors.white,
              placeholder: "Search",
              onChanged: (String value) {
                print('The text has changed to: $value');
              },
              onSubmitted: (String value) {
                print("submited");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchResult(value)),
                );
              },
            ),
          ),
        ),
            Expanded(
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
                          itemCount: snapshot.data.length,
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
          ],
        ),
      ),
    );
  }
}
