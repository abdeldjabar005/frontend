import 'package:flutter/material.dart';
import 'package:xy2/Screens/Profile/edit_profile_page.dart';
import 'package:xy2/Screens/Profile/profile_widget.dart';
import 'package:xy2/Screens/Profile/profilemenu.dart';
import 'package:xy2/modules/User.dart';
import 'userdata.dart';

class ProfilePage extends StatelessWidget {
    final UserModel user;


  ProfilePage(this.user);

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
              imagePath: user.picture,
              isEdit: false,
              onClicked: () async {},
            ),
            SizedBox(
              height: 20,
            ),
            buildname(user.firstName, user.lastName),
            SizedBox(
              height: 20,
            ),
            ProfileMenu(
              text: 'My account',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage(user)),
                );
              },
              icon: Icon(Icons.person),
            ),
            ProfileMenu(
              text: 'Notifications',
              press: () {},
              icon: Icon(Icons.notifications),
            ),
            ProfileMenu(
              text: 'Help Center',
              press: () {},
              icon: Icon(Icons.help_center),
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

  Widget buildname(String Fname, String Lname) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Fname,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          Lname,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
