// // ignore: file_names
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:app/Tasks/tasks_widgets/alltask_task_card.dart';
// import 'package:app/styles.dart'; 

// class YourTasksPage extends StatefulWidget {
//   const YourTasksPage({Key? key}) : super(key: key);



//   @override
//   _yourTasksPage createState() => _yourTasksPage();
// }
// class _yourTasksPage extends State<YourTasksPage> {

//   getTasks(data){
//     if (data.size>0){
//       return
//       Container(
//             decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: mainBackgroundimage, 
//           fit: BoxFit.cover,
//         ),
//       ),
//         child: ListView.builder(
//         itemCount: data.size,
//         itemBuilder: (context, index) {
//           return Column(
            
//             children: <Widget>[
//             AllTaskTaskCard(
//               taskType: data.docs[index]['taskType'], 
//               category: data.docs[index]['category'], 
//               description: data.docs[index]['description'], 
//               location: data.docs[index]['location'], 
//               price: data.docs[index]['price'].toString(), 
//               subject: data.docs[index]['subject'],
//               timeCreated: data.docs[index]['timeCreated'],
//               taskOwnerid: data.docs[index]['ownerID'],
//               taskOwnerName: data.docs[index]['TaskOwnerName'],
//               imageURL: data.docs[index]['imageURL'],
//               taskID: data.docs[index].id,
//               yourtasks: true,
//               ),
//               ],
//               );
//             }
//           ),
//         ); 
//       }
//       else{
//       return

//       Container(
//         alignment: Alignment.center,
//         child: const Text('Du har endnu ikke oprettet nogle opgaver!', 
//         style: TextStyle(color: Colors.black, fontSize: 20),
//         textAlign: TextAlign.center,
//         ),
//       ); 
//     }
//   }



//   @override
//   Widget build(BuildContext context) {
//     final uid = FirebaseAuth.instance.currentUser!.uid.toString(); 
//     return 
//     StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('posts')
//                       .where('ownerID', isEqualTo: uid)
//                       .where('taskType', isEqualTo: 'Opgave')
//                       .snapshots(),
//                   builder: (
//                     BuildContext context,
//                     AsyncSnapshot<QuerySnapshot> snapshot,
//                   ) {
//                     if (!snapshot.hasData) {
//                       return waitingIndicator; 
//                     }
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return waitingIndicator; 
//                     }
//                     final data = snapshot.requireData;

                    
//                         return MaterialApp(
//                           debugShowCheckedModeBanner: false,
//                           title: 'Dine opgaver',
                          
//                           home: Scaffold(
//                             appBar: AppBar(
//                               backgroundColor: Color.fromARGB(255, 240, 239, 235),
//                               leading:MainbackArrow(context), 
//                               title: const Text('Dine opgaver', 
//                               style: TextStyle(
//                                 color: Colors.black
//                               ),),
//                             ),
//                             body: 
                            
//                             getTasks(data), 


                                      
//       ));
//                   });
//   }
// }