import 'package:flutter/material.dart';
import 'package:xy2/modules/shared_preference.dart';
import 'package:xy2/network/post_helper.dart';
// import 'package:xy2/widgets/comment_widget.dart';
import 'package:xy2/modules/Post.dart';

class PostWithImage extends StatefulWidget {
  final PostsData post;
  final Function gotoWhenComment;

  PostWithImage(this.post, this.gotoWhenComment);

  @override
  _PostWithImageState createState() => _PostWithImageState();
}

class _PostWithImageState extends State<PostWithImage>
     {
  late bool isLiked = true;

  late int numberOfLikes;

  TextEditingController comment = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    numberOfLikes = widget.post.likes.likesCount;

    super.initState();
  }

  getToken2() async {
    String? token = await getToken();
    print(token);
    return token;
  }

  submitComment(postId, comment, token) {
    if (_formKey.currentState!.validate()) {
      PostService.commentPost(postId, comment);
      widget.gotoWhenComment();
    }
  }

  List<Widget> getImages() {
    List<Widget> widgets = [];

    for (int i = 0; i < widget.post.images.imagesCount; i++) {
      widgets.add(Image.network(
        widget.post.images.data[i].imageUrl.toString(),
        height: 200,
        width: 300,
        fit: BoxFit.cover,
      ));
      widgets.add(Padding(padding: EdgeInsets.only(bottom: 10)));
    }
    return widgets.toList();
  }

  List<Widget> getComments() {
    List<Widget> widgets = [];
    print(widget.post.comments.data[0].comment);
   
    for (int i = 0; i < widget.post.comments.commentCount; i++) {
      // widgets.add(CommentWidget(widget.post.comments.data[i]));

      widgets.add(Padding(padding: EdgeInsets.only(bottom: 10)));
    }

    return widgets.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(203, 221, 244, 0.95),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        // backgroundImage: NetworkImage(
                        //   "http://127.0.0.1:8000/storage/pic_url/" +
                        //       widget.post.agencyName.picUrl,
                        // )
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.post.agencyName,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     (MaterialPageRoute(
                    //         builder: (context) =>
                    //             ProfilePage(widget.post.user.id))));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(widget.post.description),
                SizedBox(
                  height: 20,
                ),
                widget.post.images.imagesCount == 0
                    ? Text("")
                    : Container(
                        width: double.infinity,
                        child: IntrinsicHeight(
                            child: Column(
                          children: getImages(),
                        )),
                      ),
              ],
            ),
          ),
          Divider(),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            padding: EdgeInsets.all(10),
            color: Color.fromRGBO(203, 221, 244, 0.95),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: isLiked
                              ? Color.fromRGBO(244, 67, 54, 1)
                              : Colors.black26,
                          size: 40,
                        ),
                        onPressed: () {
                          //   PostHelper.likePost(widget.post.id, widget.token);

                          //   if (isLiked) {
                          //     isLiked = false;
                          //     numberOfLikes--;
                          //   } else {
                          //     isLiked = true;
                          //     numberOfLikes++;
                          //   }

                          //   setState(() {});
                        }),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      (numberOfLikes).toString(),
                      style: TextStyle(color: Colors.black26),
                    ),
                  ],
                ),
                Container(height: 80, child: VerticalDivider()),
                IconButton(
                    icon: Icon(
                      Icons.comment,
                      size: 40,
                      color: Colors.black26,
                    ),
                    onPressed: () {
                      submitComment(widget.post.id, comment.text, getToken2());
                    }),
              ],
            ),
          ),
          Divider(),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: comment,
                        decoration: InputDecoration(
                            hintText: "Comment here.....",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please write a comment";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                )),
          ),
          Divider(),
          widget.post.comments.commentCount == 0
              ? Text("")
              : Column(
                  children: getComments(),
                ),
        ],
      ),
    );
  }
}
