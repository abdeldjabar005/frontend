import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/addoffer.dart';
import 'package:xy2/Screens/Home/favorite.dart/favoritebuilder.dart';
import 'package:xy2/Screens/Home/masseges.dart';
import 'package:xy2/Screens/Home/userhomeprods.dart';
import 'package:xy2/Screens/Profile/UserProfile.dart';
import 'package:xy2/Screens/Profile/profile.dart';

class UserHomePage extends StatefulWidget {
  UserHomePage({Key? key}) : super(key: key);
  
  @override
  State<UserHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<UserHomePage> {
  int currentIndex = 0;
  final screens = [
    UserHomeProds(),
    FavoritePage(),
    MassegesPage(),
    Userprofile(),
  ];

// late Future posts;
//   @override
//   void initState() {
//     super.initState();
//     posts =PostService.getPosts();
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.redAccent,
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const newoffer()),
      //     );
      //   },
      //   child: Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          selectedItemColor: Colors.red,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Favourite',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Messages',
              icon: Icon(Icons.message),
            ),
            BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  Icons.person,
                )),
          ]),
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
          child: screens[currentIndex],
        ),
      ),
      
    );
  }
}
