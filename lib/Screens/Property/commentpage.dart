import 'package:flutter/material.dart';
import 'package:xy2/screens/home/HomePage.dart';
import 'package:xy2/Screens/Profile/userdata.dart';
import 'package:xy2/Screens/Property/commentbox.dart';
import 'package:xy2/modules/Comment.dart';
import 'package:xy2/modules/shared_preference.dart';
import 'package:xy2/network/post_helper.dart';

class TestMe extends StatefulWidget {
  Comments comment;
  int postId;
  String picture;
  TestMe(this.comment, this.postId, this.picture);

  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  submitComment(postId, comment) {
    if (formKey.currentState!.validate()) {
      PostService.commentPost(postId, comment);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  Widget commentChild() {
    return ListView(
      children: [
        for (var i = 0; i < widget.comment.commentCount; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(widget.comment.data[i].picture)),
                ),
              ),
              title: Text(
                widget.comment.data[i].userName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.comment.data[i].comment),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Comments"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Container(
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
          child: CommentBox(
            userImage: widget.picture,
            child: commentChild(),
            labelText: 'Write a comment...',
            withBorder: false,
            errorText: 'Comment cannot be blank',
            sendButtonMethod: () {
              if (formKey.currentState!.validate()) {
                print(commentController.text);
                setState(() {
                  submitComment(widget.postId, commentController.text);
                });
                FocusScope.of(context).unfocus();
              } else {
                print("Not validated");
              }
            },
            formKey: formKey,
            commentController: commentController,
            backgroundColor: Colors.black,
            textColor: Colors.black,
            sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
