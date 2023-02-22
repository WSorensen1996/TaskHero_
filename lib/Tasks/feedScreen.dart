// ignore: file_names
import 'package:fulltaskhero/Tasks/tasks_widgets/banners.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/category_list.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/new_task_card.dart';
import 'package:fulltaskhero/home.dart';
import 'package:fulltaskhero/styles.dart';
import 'package:flutter/material.dart';
import 'package:fulltaskhero/httpRequests.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({Key? key}) : super(key: key);
  final currentUserUID = 1; // tmp value 

  @override
  Widget build(BuildContext context) {


    return 

    FutureBuilder(
            future: getTasksRequest(),
            builder: (BuildContext ctx, AsyncSnapshot services) {
              if (services.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } 
              else {
          
                        return                         
                              FutureBuilder(
            future: getCategoriesRequest(),
            builder: (BuildContext ctx, AsyncSnapshot categories) {
              if (categories.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } 
              else {
                                        
                                return 

                              FutureBuilder(
            future: getTasksRequest(),
            builder: (BuildContext ctx, AsyncSnapshot tasks) {
              if (tasks.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } 
              else {                          
                                return Scaffold(
                                  body: SafeArea(
                                    child: SingleChildScrollView(
                                      child: Container(
                                        height: screenHeight(context),
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: mainBackgroundimage, 
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(height: paddingSize,), 

                
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                    top: 40, 
                                                    left: 20, 
                                                    right: 20,
                                                  ) ,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'Opgaver der udbydes ',style: feedTextStyle
                                                      ),
                                                      InkWell(
                                                        child: const Text(
                                                        'Se alle',
                                                        style: feedTextStyle,
                                                        ),
                                                        onTap: () {
                                                          
                                                          
                                                        Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => 
                                                        const Home(selectedIdx: 1,taskToggle: false, serviceToggle: true,),
                                                          ),
                                                          );

                                                           
                                                        },
                                                        ),
                                                    ],
                                                  ),
                                                ),

                                                SizedBox(
                                                  height: screenHeight(context)*bannerHeight, 
                                                  child: 
                                                  ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount:  services.data.length,
                                                    itemBuilder: (context, index) {
                                                      return 
                                                        Column(
                                                          children: [
                                                            Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: paddingSize),
                                                                  child: Banners(
                                                                      taskID: services.data[index].taskID, 
                                                                      category: services.data[index].category, 
                                                                      description: services.data[index].description, 
                                                                      location: services.data[index].location, 
                                                                      price: services.data[index].price.toString(), 
                                                                      subject: services.data[index].subject,
                                                                      timeCreated: services.data[index].timeCreated,
                                                                      taskOwnerid: services.data[index].taskOwnerid,
                                                                      taskOwnerName: services.data[index].taskOwnerName,
                                                                      imageURL: services.data[index].imageURL,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    ]
                                                                  );
                                                                },
                                                              ), 
                                                            ),
                                                

                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: txtPaddingSize) ,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'Opgaver der modtages ',
                                                        style: feedTextStyle),
                                                      InkWell(
                                                        child: const Text(
                                                        'Se alle',
                                                        style: feedTextStyle,
                                                        ),
                                                        onTap: () {
                                                          
                                                          
                                                        Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => 
                                                        const Home(selectedIdx: 1,taskToggle: true, serviceToggle: false,),
                                                          ),
                                                          ); 



                                                           
                                                        },
                                                        ),
                                                      
                                                    ],
                                                  ),
                                                ),
                                              

                                                SizedBox(
                                                  height:  screenHeight(context)*taskHeight,
                                                  child: 
                                                    ListView.builder(
                                                      scrollDirection: Axis.horizontal,
                                                      itemCount: tasks.data.length, 
                                                      itemBuilder: (context, index) {
                                                        return Column(
                                          
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: paddingSize),
                                                              child: NewTaskCard(
                                                                taskID: tasks.data[index].taskID,
                                                                category: tasks.data[index].category, 
                                                                description: tasks.data[index].description, 
                                                                location: tasks.data[index].location, 
                                                                price: tasks.data[index].price.toString(), 
                                                                subject: tasks.data[index].subject,
                                                                timeCreated: tasks.data[index].timeCreated,
                                                                taskOwnerid: tasks.data[index].taskOwnerid,
                                                                taskOwnerName: tasks.data[index].taskOwnerName,
                                                                imageURL: tasks.data[index].imageURL,),
                                                            ),
                                                        ]
                                                        );
                                                      }
                                                    ),
                                                  ),
                                              
                                                  
                           

                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: txtPaddingSize) ,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'Kategorier',
                                                        style: feedTextStyle,
                                                      ),
                                                     InkWell(
                                                        child: const Text(
                                                        'Se alle',
                                                        style: feedTextStyle,
                                                        ),
                                                        onTap: () {
                                                          
                                                          
                                                        Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => 
                                                        const Home(selectedIdx: 1,),
                                                          ),
                                                          ); 



                                                           
                                                        },
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                

                                               
                                                SizedBox(
                                                  height: screenHeight(context)*categoryHeight, 
                                                  child: 
                                                    ListView.builder(
                                                      scrollDirection: Axis.horizontal,
                                                      itemCount: categories.data.length,
                                                      itemBuilder: (context, index) {
                                                        return Column(
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: listviewPaddingSize),
                                                              child: CategoryCard(
                                                                url: categories.data[index].imageURL,
                                                                title: categories.data[index].category,
                                                              
                                                              ),
                                                            ),
                                                        ]
                                                        );
                                                      }
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
        ); 
      }
            }
    ); 
  }
            }
  );

  }
}


