// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TextStyle txtStyle1 = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  
);

const TextStyle txtStyle2 = TextStyle(
  color: Colors.grey,
  fontSize: 12.0,
);
const double txtPaddingSize = 20.0; 
const double profilePageBlockpaddingSize = 30.0; 

double screenHeight(context) {
  return 
   MediaQuery.of(context).size.height; 
    }
double screenWidth(context) {
  return 
   MediaQuery.of(context).size.width; 
    }

const double paddingSize = 10; 
const double listviewPaddingSize = 8; 
const double bannerHeight = 0.17; 
const double bannerwidth = 0.8; 
const double taskHeight = 0.25; 
const double taskWidth = 0.42; 
const double categoryHeight= 0.25; 

// ignore: non_constant_identifier_names
MainbackArrow(context) {
  return 
   IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
    ); 
}


const feedTextStyle =  TextStyle(
                        color: Colors.black, 
                        fontSize: 20, 
                        fontWeight: FontWeight.bold, 
                      ); 

const Color mainbuttonColor = Color.fromARGB(255, 144, 189, 234); 

const Color mainColor = Color.fromARGB(237, 237, 236, 236); 

final mainBorderStyle = Border.all( color: const Color.fromARGB(255, 232, 230, 230), width: 4); 

const mainTitleStyle = TextStyle(
                            color: Colors.black, 
                            fontSize: 18
                          ); 

const mainBackgroundimage =  AssetImage('assets/background.jpeg');
const loadingimg =  AssetImage('assets/loadingScreen.png');

const createTaskStyle = TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        ); 

const mainbuttonStyle = TextStyle(color: Colors.black, 
                        fontWeight: FontWeight.bold, 
                        fontSize: 18, ); 

const mainbackGroundDecoration = const BoxDecoration(
        image: DecorationImage(
        image: mainBackgroundimage, 
        fit: BoxFit.cover,
        ),
        ); 

const waitingIndicator =  Center(child: CircularProgressIndicator());

class Styles {
  static TextStyle h1() {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);
  }

  static friendsBox() {
    return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)));
  }

  static messagesCardStyle(check) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: check ? Colors.indigo.shade300: Colors.grey.shade300,
    );
  }

  static messageFieldCardStyle() {
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.indigo),
        borderRadius: BorderRadius.circular(10));
  }

  static messageTextFieldStyle({required Function() onSubmit}) {
    return InputDecoration(
      border: InputBorder.none,
      hintText: 'Enter Message',
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      suffixIcon: IconButton(onPressed: onSubmit, icon: const Icon(Icons.send)),
    );
  }
}


  mainSnakBar(context, txt){  ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // action: SnackBarAction(
            //   label: 'Action',
            //   onPressed: () {
            //     // Code to execute.
            //   },
            // ),
            content: Text(txt, 
            style: const TextStyle(
                            color: Colors.white, 
                            fontSize: 24
                          ) ,),
            duration: const Duration(milliseconds: 1500),
            width: screenWidth(context)*0.8, // Width of the SnackBar.
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0, // Inner padding for SnackBar content.
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
  }
