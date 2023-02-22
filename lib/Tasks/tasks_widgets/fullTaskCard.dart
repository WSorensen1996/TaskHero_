// ignore: file_names
import 'package:fulltaskhero/Profile/profile_page.dart';
import 'package:fulltaskhero/styles.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/new_task_subIcons.dart';
import 'package:flutter/material.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/fulltask_imgcard.dart'; 

class FullTaskCard extends StatelessWidget {
  final String taskID, category, subject, description, location, price, timeCreated, taskOwnerid,taskOwnerName,imageURL; 
  final bool previewMode;

  const FullTaskCard(
      {Key? key,
      required this.taskID, 
      required this.category,
      required this.subject,
      required this.description,
      required this.location,
      required this.price,
      required this.timeCreated,
      required this.taskOwnerid,
      required this.taskOwnerName,
      required this.imageURL,
      required this.previewMode,
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Back', 
          style: TextStyle(
            color: Colors.black, 
          ),),
          backgroundColor: mainColor,
          // ignore: prefer_const_constructors
          leading: BackButton(
            color: Colors.black,
          ),
        ),

      body: Center(
        
        child: Container(
          decoration: const BoxDecoration(
          image: DecorationImage(
            image: mainBackgroundimage, 
            fit: BoxFit.cover,
          ),
        ),
          height: double.infinity,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                // height: 255,
                // width: double.infinity,
                child: imgCard(
                        imgurl: imageURL,
                      ),
              ), 
            
              
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                  borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(130),
                  topRight: Radius.circular(130),
                
                ),
                  color: Colors.white,
                ),
  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly  ,
                    children: [

                          Text(
                              category.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Nisebuschgardens',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10,), 
                          Text(
                              subject,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Nisebuschgardens',
                              ),
                              textAlign: TextAlign.center,
                            ),
                      const SizedBox(height: 20,), 
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                            description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Nisebuschgardens',
                            ),
                          ),
                      ),




                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      crossAxisAlignment: CrossAxisAlignment.end ,
                      children: [
                        Column(
                          children: [
                            Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: NewTaskSubIcons(
                                      label: location, icon: Icons.location_on_outlined,width: 100,),
                                    ),
                            
                            Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: NewTaskSubIcons(
                                    label: timeCreated, icon: Icons.create_rounded,width: 100,),
                                  ),    

                            // ElevatedButton.icon(              
                            //       onPressed: () {
                            //         if (!previewMode && taskOwnerid == FirebaseAuth.instance.currentUser!.uid.toString()){
                            //           mainSnakBar(context,'Cannot message');
                            //         }
                            //         if(!previewMode && !(taskOwnerid == FirebaseAuth.instance.currentUser!.uid.toString())) {
                            //           Navigator.of(context).push(
                            //           MaterialPageRoute(
                            //             builder: (context) {
                            //               return MessengerPage
                            //               ( 
                            //                 taskID: taskID,
                            //                 friendId: taskOwnerid,
                            //                 friendName: taskOwnerName,
                            //               );
                            //             },
                            //           )
                            //             );
                                        
                            //         }
                            //       },
                                  
                            //         icon: const Icon(
                            //           Icons.message_outlined,
                            //           size: 20.0,
                            //           color: Colors.black, 
                            //         ),
                            //         label: const Text('Message',
                            //         style: TextStyle(
                            //           color: Colors.black, 
                            //         ),),
                            //         style: ElevatedButton.styleFrom(
                            //           backgroundColor: Color.fromARGB(255, 240, 239, 235),
                            //           textStyle:const TextStyle(
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 12,
                            //             fontFamily: 'Nisebuschgardens',
                            //             color: Colors.black,
                            //           ),
                            //         ),
                            //       ),
                          ],
                        ),

                        Column(
                          children: [
                            Row(
                              children: [
                                NewTaskSubIcons(
                                  label: price, 
                                  icon: Icons.payment_outlined,
                                  width: 45,),

                                const Text(
                                  ' DKK',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          
                          // ElevatedButton.icon(
                          //   onPressed: () {
                          //     if (!previewMode && !(taskOwnerid == FirebaseAuth.instance.currentUser!.uid.toString())){
                          //     Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //       builder: (context) {
                          //         return ProfilePage(
                          //           uid: taskOwnerid,
                          //         );
                          //       },
                          //     )
                          //       );

                          //     }
                          //     else{
                          //     mainSnakBar(context,'Cannot message');
                          //   }

                          //   }
                          //   ,
                          //   icon: const Icon(
                          //     Icons.person_sharp,
                          //     size: 20.0,
                          //     color: Colors.black,
                          //   ),
                          //   label: const Text('Profile',
                          //   style: TextStyle(
                          //     color: Colors.black, 
                          //   )),
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Color.fromARGB(255, 240, 239, 235),
                          //     textStyle:const TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 12,
                          //       fontFamily: 'Nisebuschgardens',
                          //       color: Colors.black,
                          //     ),
                          //   ),
                          // ),

                          ],
                        ),

                      ],
                    ),

                    
                    
                    
                    ],
                      ),
                  ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
