
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:fulltaskhero/Profile/profile_widget/profile_widget.dart';
// // import 'package:image_picker/image_picker.dart'; 
// import 'package:fulltaskhero/styles.dart';



// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({
//     Key? key}) : super(key: key); 
//   @override
//   // ignore: library_private_types_in_public_api
//   _EditProfilePageState createState() => _EditProfilePageState();
// }


// class _EditProfilePageState extends State<EditProfilePage> {
//   final _deleteUserController = TextEditingController(); 
//   // final currentUserID = FirebaseAuth.instance.currentUser!.uid.toString(); 
//   final _aboutController = TextEditingController();    
//   final _catchpraseController = TextEditingController();    


//     // Future normalizeUser() async{
//     //   await FirebaseFirestore.instance.collection('userInformation').doc(FirebaseAuth.instance.currentUser!.uid).set({
//     //     'firstname': 'DeletedUser', 
//     //     'lastname': '', 
//     //     'birthday': '', 
//     //     'catchprase': '', 
//     //     'description': 'DeletedUser', 

//     //     'photoURL': 'https://firebasestorage.googleapis.com/v0/b/helpinghand00-c0649.appspot.com/o/profile_image%2FDefault%2Fblank_user.png?alt=media&token=12a64a6d-14e3-4b6b-b091-fd8a667e1380', 
//     //   });
//     // }


//   void normalizingAndDeletingTS() async {
//   QuerySnapshot<Map<String, dynamic>> tasks = await FirebaseFirestore.instance.collection('posts').where('id', isEqualTo: currentUserID).get();
//   for (var i = 0; i < tasks.size; i++) {
//     await FirebaseFirestore.instance.collection('deletedPosts').doc().set({
//       'category': tasks.docs[i]['category'].toString(), 
//       'subject': tasks.docs[i]['subject'].toString(), 
//       'description': tasks.docs[i]['description'].toString() , 
//       'location': tasks.docs[i]['location'].toString() , 
//       'timeCreated': tasks.docs[i]['timeCreated'].toString(), 
//       'price': tasks.docs[i]['price'].toString(), 
//     });
//     await FirebaseFirestore.instance.collection('posts').doc(tasks.docs[i].id).delete(); 
//     }
//   }

//   // ignore: non_constant_identifier_names
//   void Deletingreviews() async { // Ændre det forkerte UID
//   QuerySnapshot<Map<String, dynamic>> tasks = await FirebaseFirestore.instance.collection('reviews').where('ReviewerID', isEqualTo: currentUserID).get();
//   for (var i = 0; i < tasks.size; i++) {
//     await FirebaseFirestore.instance.collection('reviews').doc(tasks.docs[i].id).update({
//       'ReviewerID': 'deletedUser', 
//       'TaskOwnerIMG': 'https://firebasestorage.googleapis.com/v0/b/helpinghand00-c0649.appspot.com/o/profile_image%2FDefault%2Fblank_user.png?alt=media&token=12a64a6d-14e3-4b6b-b091-fd8a667e1380', 
//       'TaskOwnerName':'Deleted User'
//     });
//     }
//   }


//   Future updatePhoto(String url) async{
//     await FirebaseFirestore.instance.collection('userInformation').doc(FirebaseAuth.instance.currentUser!.uid).update({
//       'photoURL': url, 
//     });
//   }

//   Future updateAbout(String about, catchprase) async{
//     await FirebaseFirestore.instance.collection('userInformation').doc(FirebaseAuth.instance.currentUser!.uid).update({
//       'description': about, 
//       'catchprase': catchprase, 
//     });
//   }

//   Future submit() async{
//     if(_aboutController.text.trim().isNotEmpty || _catchpraseController.text.trim().isNotEmpty){
//       updateAbout(_aboutController.text.trim(), _catchpraseController.text.trim(), 
//       );
//     }
//     Navigator.pop(context);
//     mainSnakBar(context,'Succes');
//     }
    
//     // ignore: non_constant_identifier_names
//     Future DeleteUser() async{
//       Widget deleteTextfield = TextField(
//                         controller: _deleteUserController, 
//                         decoration: const InputDecoration(
//                           border: InputBorder.none, 
//                           hintText: ' Type : "DeleteUser"',
//                         ),
//                       ); 
//       Widget okButton = TextButton(
//         child: const Text("Delete"),
//         onPressed: () { 

  

//           if(_deleteUserController.text.trim().toLowerCase() =='deleteuser'){

//           // normalizingAndDeletingTS(); 
//           // Deletingreviews(); 
          

//           // FirebaseAuth.instance.signOut();

//           // // // Deleting user information 
//           normalizeUser(); 
        
//           // // // Returning home page 
//           // Navigator.pop(context);
//           // Navigator.pop(context);
//           // Navigator.push(
//           // context,
//           // MaterialPageRoute(builder: (context) => const AuthPageState()),);
          

//           }
//         },
//       );

//       // show the dialog
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//         return 
//           AlertDialog(
//             title: const Text("Deleting user"),
//             content: const Text('To delete user. Type "DeleteUser" in the textfield below:'),
//             actions: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   okButton,
//                   deleteTextfield
//                 ],
//               ),
//         ],
//       );
          
//         },
//       );
    









//     }
    

//   String imageUrl = ''; 

//     @override
//     void dispose(){
//       _aboutController.dispose(); 
//       _catchpraseController.dispose(); 
//       _deleteUserController.dispose(); 
//       super.dispose();
//     }

//   @override
//   Widget build(BuildContext context){

//     return 
//     StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//         stream: FirebaseFirestore.instance.collection('userInformation').doc(currentUserID).snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
//           if (snapshot.hasError) {
//             return waitingIndicator; 
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return waitingIndicator; 
//           }

//           Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//           return 
//           Scaffold(
//             appBar: AppBar(
//               title: const Text('Back', 
//               style: TextStyle(color: Colors.black, 
//               ), 
//               ),
//               backgroundColor: mainColor ,
//               // ignore: prefer_const_constructors
//               leading: BackButton(
//                 color: Colors.black,
//               ),
//             ),
            
//                   body: 
                  
//                   Container(
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: mainBackgroundimage, 
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     child: ListView(
//                       // padding: const EdgeInsets.symmetric(horizontal: 32),
                      
//                       children: [
//                         const SizedBox(height: 24),
//                         ProfileWidget(
//                           imagePath: data['photoURL'],
//                           isEdit: true,
//                           onClicked: () async {
//                           try {
//                           // Pick an image

//                           final ImagePicker picker = ImagePicker();
//                           final XFile? image = await picker.pickImage(source: ImageSource.gallery);

//                           File file = File(image!.path);
//                           // Creating reference
//                           Reference referenceRoot = FirebaseStorage.instance.ref(); 
//                           Reference referenceDirImage = referenceRoot.child('profile_image'); 
//                           Reference referenceImageToUpload = referenceDirImage.child('profilepic_$currentUserID'); 

                          
//                             await referenceImageToUpload.putFile(file); 
//                             imageUrl = await referenceImageToUpload.getDownloadURL(); 
//                             updatePhoto(imageUrl); 
//                           }
//                           //on firebase_core.FirebaseException catch (e){
//                           catch(error){
//                             //some error 
//                           }
//                           },


//                         ),


//                         Container(
                          
//                           width: MediaQuery.of(context).size.width,
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(120),
//                             topRight: Radius.circular(120),
                            
//                             ),), 

                          
//                           child: Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Column(
//                               children: [
//                                 const SizedBox(height: 24),
//                                 Text(
//                                   // ignore: prefer_interpolation_to_compose_strings
//                                   'Firstname: ' + data['firstname'], 
//                                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                                 ),
//                                 const SizedBox(height: 24),
//                                 Text(
//                                   // ignore: prefer_interpolation_to_compose_strings
//                                   'Lastname: ' + data['lastname'], 
//                                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                                 ),
//                                 const SizedBox(height: 24),
//                                 const Text(
//                                   'CatchPrase',
//                                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 TextField(
//                                   autocorrect: false,
//                                   controller: _catchpraseController,
//                                   decoration: 
//                                     InputDecoration(
//                                       hintText: data['catchprase'] ?? 'Enter your catchprase here',
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
                                  
//                                     ),
//                                   maxLines: 1,
//                                 ),
//                                 const SizedBox(height: 24),
//                                 const Text(
//                                   'About',
//                                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 TextField(
//                                   autocorrect: false,
//                                   controller: _aboutController,
//                                   decoration: 
//                                     InputDecoration(
//                                       hintText: data['description'],
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
                                  
//                                     ),
//                                   maxLines: 5,
//                                 ),
                                
//                                 const SizedBox(height: 10),
                                
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                                   child: GestureDetector(
//                                     onTap: submit,
                                  
//                                     child: Container(
//                                       padding: const EdgeInsets.all(13), 
//                                       decoration: BoxDecoration(
//                                         color: mainbuttonColor, 
//                                         borderRadius: BorderRadius.circular(12),

//                                       ),
//                                       child: const Center(
//                                         child: Text('Submit',
//                                         style: TextStyle(color: Colors.black, 
//                                         fontWeight: FontWeight.bold, 
//                                         fontSize: 18, ))
//                                       )
//                                     )
//                                   ),
//                                 ), 


//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(vertical: 25.0),
//                                   child: GestureDetector(
//                                     onTap: DeleteUser,
//                                     child: Container(
//                                       width: 100,
//                                       padding: const EdgeInsets.all(13), 
//                                       decoration: BoxDecoration(
//                                         color: Colors.red[200], 
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
//                                       child: const Center(
//                                         child: Text('Delete user',
//                                         style: TextStyle(color: Colors.black, 
//                                         fontWeight: FontWeight.bold, 
//                                         fontSize: 12, ))
//                                       )
//                                     )
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ), 





//                       ],
//                     ),
//                   ),
//                 );
//         }
//             );
//   }

//       }