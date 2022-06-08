import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/addoffer.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/offerslist.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/editagencyprofile.dart';
import 'package:xy2/Screens/Profile/profile_widget.dart';
import 'package:xy2/Screens/Profile/profilemenu.dart';
import 'package:xy2/modules/User.dart';

class AgencyProfilePage extends StatefulWidget {
  final UserModel user;

   AgencyProfilePage(this.user);
   @override
  _AgencyProfilePage createState() => _AgencyProfilePage();
}

class _AgencyProfilePage extends State<AgencyProfilePage> {

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
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            ProfileWidget(
              imagePath: widget.user.picture,
              isEdit: false,
              onClicked: () async {},
            ),
            SizedBox(
              height: 20,
            ),
            buildname(),
            SizedBox(
              height: 20,
            ),
            ProfileMenu(
              text: 'My account',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditAgencyProfilePage(widget.user)),
                );
              },
              icon: Icon(Icons.person),
            ),
            ProfileMenu(
              text: 'Add new offer',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => newoffer()),
                );
              },
              icon: Icon(Icons.local_offer),
            ),
            ProfileMenu(
              text: 'Your offers',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OffersList()),
                );
              },
              icon: Icon(Icons.list),
            ),
            ProfileMenu(
              text: 'Log out',
              press: () {},
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildname() {
    return Center(
      child: Text(
        widget.user.companyName,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
