import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xy2/Screens/Profile/AgencyProfile/agencydata.dart';
import 'package:xy2/Screens/Profile/profile_widget.dart';
import 'package:xy2/Screens/Profile/textfield_widget.dart';
import 'package:xy2/modules/User.dart';
import 'package:xy2/network/post_helper.dart';

class EditAgencyProfilePage extends StatefulWidget {
  UserModel user;
  EditAgencyProfilePage(this.user);
  @override
  _EditAgencyProfilePageState createState() => _EditAgencyProfilePageState();
}

class _EditAgencyProfilePageState extends State<EditAgencyProfilePage> {
  // Agency agency = Agencyinfo().myagency;
  File? _file;
  ImagePicker _picker = ImagePicker();
  List<XFile> images = [];
  String? bio;
  bool bioset = false;
  bool imageset = false;
  Future pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageset = true;
      _file = File(image.path);
      setState(() {});
    } else {
      errorSnackBar(context, "you have not selected a picture");
    }
  }

  newimage() async {
    var response = await PostService().profilepic(_file!);
    if (response.statusCode == 200) {
      print(response);
      Navigator.pop(context);
    } else {
      errorSnackBar(context, "failed");
    }
  }

  updatebiowithnonavigatorpop(bio) async {
    var response = await PostService.updatebio(bio);
    if (response.statusCode == 200) {
      print(response);
    } else {
      errorSnackBar(context, "Error");
    }
  }

  updatebio(bio) async {
    var response = await PostService.updatebio(bio);
    if (response.statusCode == 200) {
      Navigator.pop(context);
      print(response);
    } else {
      errorSnackBar(context, "Error");
    }
  }

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Edit Profile'),
            centerTitle: true,
          ),
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
                padding: EdgeInsets.symmetric(horizontal: 32),
                physics: BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath: widget.user.picture,
                    isEdit: true,
                    onClicked: pickImage,
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    label: 'Company Name',
                    text: widget.user.companyName,
                    onChanged: (companyname) {},
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    label: 'Email',
                    text: widget.user.email,
                    onChanged: (email) {},
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    label: 'Phone',
                    text: widget.user.phone,
                    onChanged: (phone) {},
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    label: 'Bio',
                    text: widget.user.bio,
                    onChanged: (Bio) {
                      print(Bio.toString());
                      setState(() {
                        bio = Bio;
                        bioset = true;
                      });
                    },
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (bioset && imageset) {
                            newimage();
                            updatebiowithnonavigatorpop(bio);
                          } else if (bioset) {
                            updatebio(bio);
                          } else if (imageset){
                            newimage();
                          }
                        },
                        child: Text('Save'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[300],
                          shape: StadiumBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  errorSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(text),
      duration: const Duration(seconds: 3),
    ));
  }
}
