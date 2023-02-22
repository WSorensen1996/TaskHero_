import 'package:fulltaskhero/styles.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/new_task_subIcons.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/fullTaskCard.dart';

import 'package:flutter/material.dart';

class AllTaskTaskCard extends StatelessWidget {
  final String taskType, category, subject, description, location, price, timeCreated, taskOwnerid, taskOwnerName, imageURL, taskID;
  final bool yourtasks; 

  const AllTaskTaskCard(
      {Key? key,
      required this.category,
      required this.subject,
      required this.description,
      required this.location,
      required this.price,
      required this.timeCreated,
      required this.taskOwnerid,
      required this.taskOwnerName,
      required this.imageURL,
      required this.taskID,
      required this.yourtasks,
      required this.taskType,

      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {



    final image = NetworkImage(imageURL);
    return InkWell(
      onTap: () {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FullTaskCard(
        taskID: taskID,
        category: category,
        subject: subject,
        description: description, 
        location: location, 
        price: price,
        timeCreated: timeCreated,
        taskOwnerid: taskOwnerid,
        taskOwnerName: taskOwnerName,
        imageURL: imageURL,
        previewMode: false,
        )),);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 144, 
          width: MediaQuery.of(context).size.width, 
          child: Card(
            elevation: 12.0,
            
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: 
            Stack(
              children: <Widget> [


                Column(
                  children: [

                    
                      Row(
                        children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Material(
                            color: Colors.transparent,
                            child: 
                              Ink(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ),
                          ),
                        ),
                            
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center ,
                              children: [

                                Container(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    '${taskType.toUpperCase()}: $category',
                                    style: txtStyle1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                Text(
                                    subject,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Nunito',
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    softWrap: false,
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis, // new
                                  ),
                              ],
                            ),
                          ),

                   
                    
                          
                        ],
                      ),
                      
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2) ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              NewTaskSubIcons(
                              label: location, icon: Icons.location_on_outlined, width: MediaQuery.of(context).size.width*0.2,),
                              NewTaskSubIcons(
                              label: '$price DKK', icon: Icons.payment_outlined,width: MediaQuery.of(context).size.width*0.2,),
                              NewTaskSubIcons(
                              label: timeCreated, icon: Icons.create_rounded,width: MediaQuery.of(context).size.width*0.20,),    
                            ],
                          ),
                        ),
                          



                  ],
                
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
