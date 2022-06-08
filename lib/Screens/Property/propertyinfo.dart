import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/filter.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/offerProfile.dart';
import 'package:xy2/Screens/Property/commentpage.dart';
import 'package:xy2/constantcolors.dart';
import 'package:xy2/modules/Post.dart';
import 'package:xy2/modules/shared_preference.dart';
import 'package:xy2/network/post_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/src/legacy_api.dart';

class PropertyInfo extends StatefulWidget {
  final PostsData post;
  PropertyInfo(this.post);
  @override
  State<PropertyInfo> createState() => _PropertyInfoState();
}

class _PropertyInfoState extends State<PropertyInfo> {
  late int _favoritecount = widget.post.likes.likesCount;
  late int postId = widget.post.id;
  bool _isfavorited = false;
  late String phone = widget.post.phone;
  @override
  void initState() {
    super.initState();
    checkfavorited();
  }

  checkfavorited() async {
    int? userid = await getid();
    print(userid);
    late int count = widget.post.likes.likesCount;
    for (var i = 0; i < count; i++) {
      if (widget.post.likes.data[i].likeUserId == userid) {
        setState(() {
          _isfavorited = true;
        });
        return;
      }
    }
  }

  void _toggleFavorite() {
    setState(() {
      if (_isfavorited) {
        PostService.like(postId);
        _favoritecount -= 1;
        _isfavorited = false;
      } else {
        PostService.like(postId);
        _favoritecount += 1;
        _isfavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: appPadding,
              left: appPadding,
              right: appPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 160,
                      child: Text(
                        '${widget.post.title}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.room,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.post.location,
                          style: TextStyle(
                            fontSize: 17,
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        '${widget.post.price} Dzd',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: _toggleFavorite,
                          icon: (_isfavorited
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border)),
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                          child: SizedBox(
                            child: Text('$_favoritecount'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AgencyProfile2(
                              widget.post.agencyName,
                              widget.post.phone,
                              widget.post.picture,
                              widget.post.bio,
                              widget.post.userId)),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.post.picture),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 110,
                            child: Text(
                              widget.post.agencyName,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Property Owner",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.red[700]!.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.phone,
                            color: Colors.red[700],
                            size: 20,
                          ),
                          onPressed: () {
                            launch('tel:$phone');
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.red[700]!.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.message,
                            color: Colors.red[700],
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TestMe(
                                      widget.post.comments,
                                      widget.post.id,
                                      widget.post.picture)),
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
          Padding(
            padding:
                const EdgeInsets.only(left: appPadding, bottom: appPadding),
            child: Text(
              'Property informations',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.post.space.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Square meter',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.post.bedrooms.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rooms',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.post.bathrooms.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Bathrooms',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.post.garages.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Garages',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                left: appPadding,
                right: appPadding,
                bottom: appPadding,
              ),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.post.tags.tagsCount,
                  itemBuilder: (context, index) {
                    return FilterWidget(
                      filterTxt: widget.post.tags.data[index].name,
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: appPadding,
              right: appPadding,
              bottom: appPadding * 4,
            ),
            child: Text(
              widget.post.description,
              style: TextStyle(
                color: black,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
