import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xy2/HomePage.dart';
import 'package:xy2/Screens/Home/filter.dart';
import 'package:xy2/Screens/HonePage.dart';
import 'package:xy2/Screens/Property/propertydetails.dart';
import 'package:xy2/modules/Post.dart';
import 'data.dart';

class UserHomeProds extends StatefulWidget {
  @override
  State<UserHomeProds> createState() => _HomeProdsState();
}

class _HomeProdsState extends State<UserHomeProds> {
  final filterArray = [
    "Alger",
    "Oran",
    "Constantine",
    "Annaba",
    "Batna",
    "Skikda",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.subject,
                  color: Colors.white,
                  size: 35,
                ),
                SizedBox(
                  width: 60,
                ),
                Text(
                  'Discover ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 50,
              child: CupertinoSearchTextField(
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Container(
            height: 40,
            child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              itemCount: filterArray.length,
              itemBuilder: (context, index) {
                return FilterWidget(
                  filterTxt: filterArray[index],
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
              child: PostsPage()),
          ),
        ],
      
    );
  }
}
