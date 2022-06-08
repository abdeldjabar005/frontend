import 'package:flutter/material.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/agencyprofile.dart';
import 'package:xy2/network/post_helper.dart';
import 'package:xy2/modules/User.dart';
import 'package:xy2/widgets/loading.dart';
import 'package:xy2/Screens/Home/favorite.dart/favourite.dart';

class profile extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<profile> {
  late Future user;


  @override
  initState() {
    user = PostService.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: FutureBuilder(
        future: user,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingButton();
          } else if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasData) {
            return FavouritePage();
          } else {
                  UserModel user = snapshot.data as UserModel;
                  return Container(
                    
                    child: AgencyProfilePage(user)
                    );
          }
        },
      ),
    );
  }
}
