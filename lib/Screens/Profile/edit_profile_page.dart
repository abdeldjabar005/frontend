import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xy2/Screens/Profile/profile_widget.dart';
import 'package:xy2/modules/User.dart';
import 'package:xy2/network/post_helper.dart';
import 'textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  UserModel user;
  EditProfilePage(this.user);
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _file;
  ImagePicker _picker = ImagePicker();
  List<XFile> images = [];
  Future pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(image!.path);
    });
  }

  newimage() async {
    if (_file!.path.isNotEmpty) {
      var response = await PostService().profilepic(_file!);
      if (response.statusCode == 200) {
        print(response);
        Navigator.pop(context);
      }
    } else {
      errorSnackBar(context, "you have not select a picture");
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
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'First Name',
                    text: widget.user.firstName,
                    onChanged: (firstname) {},
                    maxLines: 1,
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Last name',
                    text: widget.user.lastName,
                    onChanged: (lastname) {},
                    maxLines: 1,
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Email',
                    text: widget.user.email,
                    onChanged: (email) {},
                    maxLines: 1,
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Phone',
                    text: widget.user.phone,
                    onChanged: (phone) {},
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          newimage();
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
