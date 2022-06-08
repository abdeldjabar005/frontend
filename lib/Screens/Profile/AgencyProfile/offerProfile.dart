import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xy2/Screens/Profile/profile_widget.dart';
import 'package:xy2/Screens/Property/offerofprofile.dart';

import '../../../constantcolors.dart';

class AgencyProfile2 extends StatelessWidget {
  final String name;
  final String phone;
  final String image;
  final String bio;
  final int agencyid;

  AgencyProfile2(this.name, this.phone, this.image, this.bio, this.agencyid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Profile'),
        centerTitle: true,
      ),
      extendBody: true,
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
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              ProfileWidget(
                imagePath: image,
                isEdit: false,
                onClicked: () async {},
              ),
              SizedBox(
                height: 20,
              ),
              buildname(name),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      width: 136,
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  profileofoffer(agencyid)),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.list,
                              color: white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Vew Offers'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[300],
                          shape: StadiumBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      width: 130,
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
                        onPressed: () {
                          launch('tel:$phone');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.call,
                              color: white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Call'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[300],
                          shape: StadiumBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '$bio',
                      style: TextStyle(
                          fontSize: 16, height: 1.4, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildname(String name) {
    return Center(
      child: Text(
        name,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
