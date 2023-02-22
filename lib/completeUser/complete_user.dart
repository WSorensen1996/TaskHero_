// import 'package:app/Auth/auth_page.dart';
// import 'package:app/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:app/termsAndConditions.dart'; 

// class CompleteUser extends StatefulWidget {

//   const CompleteUser({
//     Key? key}) : super(key: key);

//   @override
//   State <CompleteUser> createState() => _completeUser(); 
// }

//   // ignore: camel_case_types
//   class _completeUser extends State<CompleteUser> {
//     //Controllers 
//     final _firstnameController = TextEditingController();
//     final _lastnameController = TextEditingController();  
//     final _deleteUserController = TextEditingController(); 
//     final _aboutController = TextEditingController();    
//     final _catchpraseController = TextEditingController();    
  

//     // ignore: no_leading_underscores_for_local_identifiers
//     void updateUserInfo(String _displayName) {
//       var user = FirebaseAuth.instance.currentUser;
//       // ignore: deprecated_member_use
//       user?.updateProfile(displayName: _displayName).then((value){
//       }).catchError((e){
//       });
//     }

//   DateTime birthday = DateTime.now() ; 
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//         context: context,
//         initialDate: birthday,// birthday,
//         firstDate: DateTime(1920),
//         lastDate: DateTime(2040) );

//       setState(() {
//         birthday = pickedDate!;
//       });
  
//   }

//   Future setUserInformations() async {
//     // print(FirebaseAuth.instance.currentUser!.emailVerified); 
//       await FirebaseFirestore.instance.collection('userInformation').doc(FirebaseAuth.instance.currentUser!.uid).set({
//         'termsAndConditionsAccepted': false, 
//         'firstname': _firstnameController.text.trim(), 
//         'lastname': _lastnameController.text.trim(), 
//         'birthday': birthday, 
//         'catchprase': _catchpraseController.text.trim(), 
//         'description': _aboutController.text.trim(), 
//         'photoURL': 'https://firebasestorage.googleapis.com/v0/b/helpinghand00-c0649.appspot.com/o/profile_image%2FDefault%2Fblank_user.png?alt=media&token=12a64a6d-14e3-4b6b-b091-fd8a667e1380', 
//       });
//     }
//     late bool acceptedTerms = false; 
//     Future acceptTerms() async{
//       MaterialPageRoute materialPageRoute = MaterialPageRoute(
//         builder: (context) => const TermsAndConditions(), ///// SKAL pass veriied med firstname + lastname 
//       );
//       // ignore: use_build_context_synchronously
//       Navigator.of(context).push(materialPageRoute); 

//       acceptedTerms = true;

//     }

//     Future signUp() async{
//       if(acceptedTerms){
//       if (DateTime.now().difference(birthday).inDays ~/365>15){
//           setUserInformations(); 
//           updateUserInfo(_firstnameController.text.trim());
//             MaterialPageRoute materialPageRoute = MaterialPageRoute(
//               builder: (context) => AuthPageState(newUser: true), ///// SKAL pass veriied med firstname + lastname 
//             );
//             // ignore: use_build_context_synchronously
//             Navigator.of(context).push(materialPageRoute); 
//           }
//       else{
//         mainSnakBar(context, 'Aldersgrænse 15 år'); 
//             }
//       }
//       else{
//         acceptTerms(); 
//       }
//     }
      

//     @override
//     void dispose(){
//       _aboutController.dispose(); 
//       _catchpraseController.dispose(); 
//       _deleteUserController.dispose(); 
//       _firstnameController.dispose();
//       _lastnameController.dispose();
//       super.dispose();
//     }

  
//     Future getCategories() async {
//     QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance.collection('categories').get();
//     for (var i = 0; i < data.size; i++) {
//       if (!categories.contains(data.docs[i].id )){
//         categories.add(data.docs[i].id );
//       }
//     }
//       setState(() {
//       });
//       return categories;
//     }
//     List<String> categories = ['Vælg kategori']; 
//     String dropdownvaluecategories = 'Vælg kategori'; 
    
    
//     @override
//     void initState() {
//     super.initState();
//     getCategories();
//     } 

//     @override
//       Widget build(BuildContext context) {
//       final localscreenwidth = screenWidth(context) * 0.9; 
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Complete user profile', 
//           style: TextStyle(
//             color: Colors.black, 
//           ),),
//           backgroundColor: mainColor,
//           // ignore: prefer_const_constructors
//           leading: IconButton(
//       icon: const Icon(Icons.arrow_back, color: Colors.black),
//       onPressed: () => FirebaseAuth.instance.signOut(),
//     ), 
//         ),
//         backgroundColor: Colors.grey[300],
//         body: Container(
//         decoration: const BoxDecoration(
//         image: DecorationImage(
//         image: mainBackgroundimage, 
//         fit: BoxFit.cover,
//         ),
//         ),
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column( children: [
    
//                 const SizedBox(height: paddingSize ),

//                 const Text(
//                   'Udfyld din profil herunder',
//                   style : mainTitleStyle, 
//                   textAlign: TextAlign.center,
//                   ),
                  

//                   const SizedBox(height: paddingSize),

//                 // Firstname text field start
//                 Container(
//                   width: localscreenwidth, 
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     border: Border.all(color: Colors.white), 
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: TextField(
//                     controller: _firstnameController, 
//                     decoration: const InputDecoration(
//                       border: InputBorder.none, 
//                       hintText: ' Firstname',
//                       hintStyle: mainTitleStyle, 
//                     ),
//                   ),
//                 ),
//                 // Firstname text field end

//                 const SizedBox(height: paddingSize ),

//                 // Lastname text field start
//                 Container(
//                   width: localscreenwidth, 
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     border: Border.all(color: Colors.white), 
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: TextField(
//                     controller: _lastnameController, 
//                     decoration: const InputDecoration(
//                       border: InputBorder.none, 
//                       hintText: ' Lastname',
//                       hintStyle: mainTitleStyle, 
//                     ),
//                   ),
//                 ),
//                 // Lastname text field end

//                 const SizedBox(height: paddingSize ),

//                 Container(
//                   width: localscreenwidth,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     border: Border.all(color: Colors.white), 
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                     const Text(' Fødselsdag', 
//                     style: mainTitleStyle, 
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(mainbuttonColor),
//                         ),
//                         onPressed: () {
//                           _selectDate(context);  
//                           },
//                         child: Text(DateFormat.yMMMMd().format(birthday)),
//                       ),
//                     ),


//                     ],
//                   ),
//                 ),
//                 // Age text field end

//                 const SizedBox(height: paddingSize ),


//                 // //////// Interst categories Start
//                 // Container(
//                 //     width: localscreenwidth, 
//                 //     decoration: BoxDecoration(
//                 //         color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
//                 //     child:
//                 //       Row(
//                 //         mainAxisAlignment: MainAxisAlignment.spaceBetween ,
//                 //         children:  
//                 //           [
//                 //             const Padding(
//                 //               padding: EdgeInsets.all(8.0),
//                 //               child: Text(
//                 //               'Interesser: ',
//                 //               style: createTaskStyle),
//                 //             ),
//                 //           DropdownButton(
//                 //             alignment: Alignment.centerRight,
//                 //             value: dropdownvaluecategories,
//                 //             icon: const Icon(Icons.keyboard_arrow_down),   
//                 //             items: categories.map((String val) {
//                 //               return DropdownMenuItem(
//                 //                 value: val,
//                 //                 child: Text(val),
//                 //               );
//                 //             }).toList(),
//                 //             onChanged: (String? newValue) {
//                 //               setState(() {
//                 //                 dropdownvaluecategories = newValue!;
//                 //               });
//                 //             },
//                 //           iconSize: 42,
//                 //           underline: const SizedBox(),
    
//                 // ),
//                 //         ],
//                 //   ),
//                 // ),
//                 //   //////// pick interst categories end 


//                 const SizedBox(height: paddingSize ),

//                                 Container(
//                                   width: localscreenwidth, 
//                         decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         border: Border.all(color: Colors.white), 
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                                   child: TextField(
//                                     autocorrect: false,
//                                     controller: _catchpraseController,
//                                     decoration: 
//                                       const InputDecoration(
//                                         hintText: 'Hvad er din catchprase?',
//                                         border: InputBorder.none,
//                                         hintStyle: mainTitleStyle, 
                                    
//                                       ),
//                                     maxLines: 1,
//                                   ),
//                                 ),
//                                 const SizedBox(height: paddingSize),
                                
                                
                                
//                                 Container(
//                                   width: localscreenwidth, 
//                                                         decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         border: Border.all(color: Colors.white), 
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                                   child: TextField(
//                                     autocorrect: false,
//                                     controller: _aboutController,
//                                     decoration: 
//                                       const InputDecoration(
//                                         hintText: 'Beskriv dig selv og dine talenter',
//                                         border: InputBorder.none,
//                                     hintStyle: mainTitleStyle, 
//                                       ),
//                                     maxLines: 5,
//                                   ),
//                                 ),
                                
//                                 const SizedBox(height: paddingSize),
 


//                 // sign in button start
//                 GestureDetector(
//                   onTap: signUp,
                
//                   child: Container(
//                     width: localscreenwidth, 
//                     padding: const EdgeInsets.all(20), 
//                     decoration: BoxDecoration(
//                       color: mainbuttonColor, 
//                       borderRadius: BorderRadius.circular(12),

//                     ),
//                     child: const Center(
//                       child: Text('Færdig',
//                       style: TextStyle(color: Colors.white, 
//                       fontWeight: FontWeight.bold, 
//                       fontSize: 18, ))
//                     )
//                   )
//                 ), 
//                 // sign in button end 
         


//           ]
//           ),
//         ),
//         ),
//         ),
      
    


           

            





//     );
//   }
// }

