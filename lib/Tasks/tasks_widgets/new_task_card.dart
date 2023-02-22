import 'package:fulltaskhero/styles.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/new_task_subIcons.dart';
import 'package:flutter/material.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/fullTaskCard.dart';

class NewTaskCard extends StatelessWidget {
  final String  taskID, category, subject, description, location, price, timeCreated, taskOwnerid,taskOwnerName,imageURL; 
  bool preventLoop; 
  NewTaskCard(
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
      this.preventLoop=false,
      })
      : super(key: key);





  @override
  Widget build(BuildContext context) {
    final image = NetworkImage(imageURL);

    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: screenHeight(context)*taskHeight,
        width: screenWidth(context)*taskWidth,
        child: Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
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
                            previewMode: preventLoop,
                            )),);
                          },

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              Material(
                color: Colors.transparent,
                child:
                  Ink(
                  width: screenWidth(context)*taskWidth,
                  height: screenHeight(context)*0.1,
                  decoration: BoxDecoration(
                    border: mainBorderStyle,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ), ), 


              
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
        
                      child: Text(
                        subject,
                        style: txtStyle1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    
                  ),
                ),
              
          
              Padding(
                padding: const EdgeInsets.only(bottom: 4) ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NewTaskSubIcons(
                        label: location, icon: Icons.location_on_outlined,width: 50,),
           
                Text(price + ' DKK', 
                style: txtStyle2,)

                                  ],
                ),
              ), 
              
            ],
          ),
          ),
        ),
      ),
    
    
    );
    
  }
}
