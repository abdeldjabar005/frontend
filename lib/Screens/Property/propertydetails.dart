import 'package:flutter/material.dart';
import 'package:xy2/Screens/Property/maps.dart';
import 'package:xy2/Screens/Property/propertyinfo.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:xy2/constantcolors.dart';
import 'package:xy2/modules/Post.dart';

class PropertyDetails extends StatefulWidget {
  final PostsData post;
  PropertyDetails({required this.post});

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  
  List<Widget> getImages() {
    List<Widget> widgets = [];

    for (int i = 0; i < widget.post.images.imagesCount; i++) {
      widgets.add(ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          widget.post.images.data[i].imageUrl.toString(),
          height: 200,
          width: 300,
          fit: BoxFit.cover,
        ),
      ));
      // widgets.add(Padding(padding: EdgeInsets.only(bottom: 10)));
    }
    return widgets.toList();
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFe9b7ce),
              Color(0xFFffb88e),
              Color(0xFFabc9e9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  height: 300,
                  width: double.maxFinite,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height:260,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlay: true,
                      initialPage: 1,
                    ),
                    items: getImages(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                PropertyInfo(widget.post),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 85,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: darkBlue.withOpacity(0.6),
                            offset: Offset(0, 10),
                            blurRadius: 10)
                      ]),
                  child: ElevatedButton(
                    onPressed: () {},
                   child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                              MaterialPageRoute(
                              builder: (context) => MapView(
                                    post: widget.post,
                                  )),                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.map,
                            color: white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('View on map'),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[300],
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
