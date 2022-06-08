import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/homepage.dart';
import 'package:xy2/modules/User.dart';
import 'package:xy2/modules/shared_preference.dart';
import 'package:xy2/network/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:xy2/Screens/HonePage.dart';
import 'package:xy2/PassConf.dart';
import 'package:xy2/widgets/loading.dart';

class AgSignUp extends StatefulWidget {
  const AgSignUp({Key? key}) : super(key: key);

  @override
  State<AgSignUp> createState() => _AgSignUpState();
}

class _AgSignUpState extends State<AgSignUp> {

    final TextEditingController companyName = TextEditingController();
    final TextEditingController registrationNumber = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController phone = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController passwordConfirmation = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    bool isLoading = false;

    createAccount() async {
      setState(() {
        isLoading = true;
      });
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email.text);
      if (companyName.text.isNotEmpty && registrationNumber.text.isNotEmpty && email.text.isNotEmpty && phone.text.isNotEmpty && password.text.isNotEmpty && passwordConfirmation.text.isNotEmpty) {
        http.Response response = await AuthServices().registerAgence(
            companyName.text,
            registrationNumber.text,
            email.text,
            phone.text,
            password.text,
            passwordConfirmation.text);
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          UserModel user = UserModel.fromJson(data['user']);
          user.token = data['accessToken'];
          setToken(user.token);
          setId(user.id);
          print(data['user']);
          print(response.body);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => HomePage(),
              ));
        } else {
          errorSnackBar(context, "email or phone number already taken");
        }
      }
      //  else if (!emailValid) {
      //   errorSnackBar(context, 'Enter valid email');
      // }
       else if (passwordConfirmation.text != password.text) {
        errorSnackBar(context, 'Password does Not Match');
      } else if (password.text.length < 6) {
        errorSnackBar(context, "Password lenght should be more than 6 chars");
      } else {
        errorSnackBar(context, 'Enter all required fields');
      }
      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Sign Up'),
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
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Create your account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Column(
                      children: [
                        buildInputForm('Company Name', companyName, TextInputType.name),
                        buildInputForm(
                            'Registration Number', registrationNumber, TextInputType.number),
                        buildInputForm('Email', email, TextInputType.emailAddress),
                        buildInputForm('Phone', phone, TextInputType.phone),
                        passw('Password', password,),
                        passw('Confirm Password', passwordConfirmation),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // isLoading ? LoadingButton() : createAccount();
                          createAccount();
                        },
                        child: Text('Sign up'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[300],
                          shape: StadiumBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildInputForm(String hint, TextEditingController value2, TextInputType inputtype) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: value2,
        // onChanged: (value) {
        //   value2.text = value;
        // },
        keyboardType: inputtype,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return 'please write your $hint';
        //   } else {
        //     return null;
        //   }
        // }
      ),
    );
  }

  bool isPasswordVisible = true;
  Widget passw(String hint, TextEditingController value2) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: value2,
        // onChanged: (value) {
        //   value2.text = value;
        // },
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
        obscureText: isPasswordVisible,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return 'please write your $value2';
        //   } else {
        //     return null;
        //   }
        // }
      ),
    );
  }

  errorSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(text),
      duration: const Duration(seconds: 2),
    ));
  }
}
