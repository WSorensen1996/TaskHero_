
import 'package:fulltaskhero/Profile/edit_profile_page.dart';
import 'package:fulltaskhero/httpRequests.dart';
import 'package:fulltaskhero/styles.dart';
import 'package:flutter/material.dart';
import 'package:fulltaskhero/Profile/profile_widget/button_widget.dart';

import 'package:fulltaskhero/Tasks/tasks_widgets/new_task_card.dart'; 

import 'package:fulltaskhero/Tasks/tasks_widgets/banners.dart';


class ProfilePage extends StatefulWidget {
  final int uid; 
    const ProfilePage(
      {Key? key,
      required this.uid,
      })
      : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
    late Future<UserInformation> futureUserInformation;

  @override
  void initState() {
    super.initState();
    futureUserInformation = fetchuserinformation(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = "1"; 
    settings(){
     if(widget.uid==currentUser){
      return 
        FloatingActionButton(
          onPressed: () {


            print("Should go to edit userprofile page "); 
            // Navigator.push(
            // context,
            // MaterialPageRoute(builder: (context) => const EditProfilePage()),);
          },
          backgroundColor: mainColor,
          child: const 
            Icon(
              Icons.settings ,
              color: Color.fromARGB(255, 0, 0, 0),),
              );
            }
    }
    getBanners(){
      // if (services.size>0){
      //   return 
      //   SizedBox(
      //   height: screenHeight(context)*bannerHeight,
      //   width: screenHeight(context)*bannerwidth,
      //   child:           
      //   ListView.builder(
      //     scrollDirection: Axis.horizontal ,
      //     itemCount: services.size,
      //     itemBuilder: (context, index) {
      //       return Column(
      //         children: <Widget>[
      //             Banners(
      //               taskID: services.docs[index].id,
      //               category: services.docs[index]['category'], 
      //               description: services.docs[index]['description'], 
      //               location: services.docs[index]['location'], 
      //               price: services.docs[index]['price'].toString(), 
      //               subject: services.docs[index]['subject'],
      //               timeCreated: services.docs[index]['timeCreated'],
      //               taskOwnerid: services.docs[index]['ownerID'],
      //               taskOwnerName: services.docs[index]['TaskOwnerName'],
      //               imageURL: services.docs[index]['imageURL'],
      //               messengerBanner: false, 
      //                   ),
      //       ]
      //       );
      //     }
      //   ),
      // ); 
      // }

        return
          const Text('Ingen services oprettet', style: txtStyle1 , ); 
      
    }
    getTaskCards(){

      // if (tasks>0){
      //   return 
      //     SizedBox(
      //       height: screenHeight(context)*taskHeight,
      //       width: screenHeight(context)*taskWidth,
      //       child:           
      //       ListView.builder(
      //         scrollDirection: Axis.horizontal,
      //         itemCount: tasks.size,
      //         itemBuilder: (context, index) {
      //           return Column(

      //             children: <Widget>[
      //               NewTaskCard(
      //                 taskID: tasks.docs[index].id,
      //                 category: tasks.docs[index]['category'], 
      //                 description: tasks.docs[index]['description'], 
      //                 location: tasks.docs[index]['location'], 
      //                 price: tasks.docs[index]['price'].toString(), 
      //                 subject: tasks.docs[index]['subject'],
      //                 timeCreated: tasks.docs[index]['timeCreated'],
      //                 taskOwnerid: tasks.docs[index]['ownerID'],
      //                 taskOwnerName: tasks.docs[index]['TaskOwnerName'],
      //                 imageURL: tasks.docs[index]['imageURL'],
      //                 preventLoop: true,
      //                 ),
      //           ]
      //           );
      //         }
      //       ),
      //     );
      // }
  
        return
          const Text('Ingen opgaver oprettet', style: txtStyle1,); 
      
    }
    logout(){
     if(widget.uid==currentUser){
      return 
        GestureDetector(
          child: const Icon(
            Icons.logout_sharp,
            color: Colors.black,
            size: 26.0,
          ),
          onTap: () {

            Navigator.pop(context); 
  
          },
        );
      }
    }
    // getRatingreview(size, data, ratingscount){
    //  if(size >0){
    //   return RatingSummary(
    //       average: (data['totalStars'] ?? 0)/ratingscount.toDouble() ,
    //       counter: ratingscount,
    //       counterFiveStars: data['Counter5 Stars'] ?? 0  ,
    //       counterFourStars: data['Counter4 Stars'] ?? 0  ,
    //       counterThreeStars: data['Counter3 Stars'] ?? 0,
    //       counterTwoStars: data['Counter2 Stars'] ?? 0,
    //       counterOneStars: data['Counter1 Stars'] ?? 0 ,
    //     ); 
    //   }
    // }
    back(){
      if(widget.uid!=currentUser){
          return 
          MainbackArrow(context); 
      }
    } 
 
    return 
  

    //       // int ratingscount = ( (data['Counter1 Stars'] ??=0 ) + (data['Counter2 Stars']??=0) + (data['Counter3 Stars']??=0) +(data['Counter4 Stars']??=0) + (data['Counter5 Stars']??=0)) ;
    //       StreamBuilder<QuerySnapshot>(
    //               stream: FirebaseFirestore.instance
    //                   .collection('posts')
    //                   .where('ownerID', isEqualTo: widget.uid)
    //                   .where('taskType', isEqualTo: 'Opgave')
    //                   .snapshots(),
    //               builder: (
    //                 BuildContext context,
    //                 AsyncSnapshot<QuerySnapshot> snapshot1,
    //               ) {
    //                 if (!snapshot1.hasData) {
    //                   return waitingIndicator; 
    //                 }
    //                 if (snapshot1.connectionState == ConnectionState.waiting) {
    //                   return waitingIndicator; 
    //                 }
    //                 final tasks = snapshot1.requireData;
                    

    //                     return  
    //       StreamBuilder<QuerySnapshot>(
    //               stream: FirebaseFirestore.instance
    //                   .collection('reviews').where('userID', isEqualTo: widget.uid)
    //                   .snapshots(),
    //               builder: (
    //                 BuildContext context,
    //                 AsyncSnapshot<QuerySnapshot> snapshot2,
    //               ) {
    //                 if (!snapshot2.hasData) {
    //                   return waitingIndicator; 
    //                 }
    //                 if (snapshot2.connectionState == ConnectionState.waiting) {
    //                   return waitingIndicator; 
    //                 }
    //                 final reviews = snapshot2.requireData;

    //                     return 
    // StreamBuilder<QuerySnapshot>(
    //               stream: FirebaseFirestore.instance
    //                   .collection('posts')//.where('id', isEqualTo: uid)
    //                   .where('ownerID', isEqualTo: widget.uid)
    //                   .where('taskType', isEqualTo: 'Service')
    //                   .snapshots(),
    //               builder: (
    //                 BuildContext context,
    //                 AsyncSnapshot<QuerySnapshot> snapshot1,
    //               ) {
    //                 if (!snapshot1.hasData) {
    //                   return waitingIndicator; 
    //                 }
    //                 if (snapshot1.connectionState == ConnectionState.waiting) {
    //                   return waitingIndicator; 
    //                 }
                    


    //                 if (services.size>0){
    //                   servicesHeight = (screenHeight(context)*bannerHeight) + txtHight; 
    //                 }
    //                 if (tasks.size>0){
    //                   outerTasksHeight = screenHeight(context)*taskHeight + txtHight ; 
    //                 }
    //                     return   


      FutureBuilder(
            future: futureUserInformation,
            builder: (BuildContext ctx, AsyncSnapshot futureUserInformation) {
              if (futureUserInformation.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } 
              else {
            double txtHight = 80; 
            var servicesHeight = txtHight;
            var outerTasksHeight = txtHight;
            
                return

            Scaffold(
              appBar: 

                AppBar(
                  leading: back(),
                    backgroundColor: mainColor,
                    actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: logout()
                  ),

                ],
              ),
               

  
              body: SingleChildScrollView(
              child: Container(
                            decoration: const BoxDecoration(
              image: DecorationImage(
                image: mainBackgroundimage, 
                fit: BoxFit.cover,
              ),
            ),
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
                child: 
                Column(
                  children: [


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [

                RotatedBox(
                  quarterTurns: 5,
                  child: 
                  ElevatedButton(
                    style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(mainbuttonColor),
                    ),
                    onPressed: () {
                      print("Should push userfeedback page");
                      },
                    child: Text('Feedback'),
                  ),
                ),
          
          
                        
                                        Container(
                                          height: 120,
                                          width: 120,
                                          child: ClipOval(
                                          child: Material(
                                            color: Colors.transparent,
                                            child: Ink.image(
                                              image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/helpinghand00-c0649.appspot.com/o/profile_image%2FDefault%2Fblank_user.png?alt=media&token=12a64a6d-14e3-4b6b-b091-fd8a667e1380"), 
                                              //image: NetworkImage(futureUserInformation.imageUrl.toString()), 
                                              fit: BoxFit.cover,
                                              width: 128,
                                              height: 128,
                           
                                            ),
                                          ),
                                        )), 
                                          
                                       
                                          
                                      

                        
                                    Container(
                                      padding: const EdgeInsets.all(7.0),
                                      height: 50,
                                      width: 50,
                                      child: settings(),
                                  ),
                             
                                  
                           
          ],
        ), 

                    //  herfra og ned skal evt. ind i ny class funcktion 
                    SizedBox(
                      height: screenHeight(context) * 0.43,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double innerHeight = constraints.maxHeight;
                          double innerWidth = constraints.maxWidth;
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: innerHeight * 0.9,
                                  width: innerWidth,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(120),
                                    topRight: Radius.circular(120),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  
                                  ),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [


                                      Column(
                                        children: [
                                 
                                      Text(
                                        futureUserInformation.data.firstname + " " + futureUserInformation.data.lastname,
                                        style: const TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 20,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                          
                                        ),
                                      ),
                                      const SizedBox(
                                        height: paddingSize,
                                      ),
                                      Text(
                                        futureUserInformation.data.catchprase ?? '',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: paddingSize,
                                      ),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                             
                                              child: Text(
                                                futureUserInformation.data.description,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'Nunito',
                                                  fontSize: 16,
                                                  
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                textAlign: TextAlign.center,
                                                softWrap: false,
                                                maxLines: 6,
                                                overflow: TextOverflow.ellipsis, // new
                                              ),
                                            ),
                                          ),
                                        ],
                                      ), 
                                      const SizedBox(
                                        height: paddingSize,
                                      ),
                                                                          ],
                                      ),

                                      
                                  
                                        Container(
                                          alignment: Alignment.bottomCenter ,
                                          height: 55,
                                          child: Row(
                                            
                                            
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [                          
                                              Column(
                                                children: [
                                                  Text(
                                                    'Opgave \nAnbefalinger',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontFamily: 'Nunito',
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const Text(
                                                    " ", 
                                                    //"reviews.size.toString()" ,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: 'Nunito',
                                                      fontSize: 15,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 25,
                                                ),
                                                child: Container(
                                                  height: 40,
                                                  width: 3,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(100),
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              
                                              Column(
                                                children: [
                                                  Text(
                                                    'Opgaver \nudbydes:',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontFamily: 'Nunito',
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Text(
                                                    " ", 
                                                    //"(services.size.toInt()).toString()" ,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: 'Nunito',
                                                      fontSize: 15,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 25,
                                                ),
                                                child: Container(
                                                  height: 40,
                                                  width: 3,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(100),
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              
                                              Column(
                                                children: [
                                                  Text(
                                                    'Opgaver \nmodtages:',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontFamily: 'Nunito',
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const Text(
                                                    " ", 
                                                    //"(tasks.size.toInt()).toString()" ,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: 'Nunito',
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),






                                            ],
                                          ),
                                        
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              
                            ],
                          );
                        },
                      ),
                    ),

                    
                    const SizedBox(
                      height: profilePageBlockpaddingSize,
                    ),



                    Container(
                      height: outerTasksHeight,
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: paddingSize),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: paddingSize,
                              ),
                              Text(
                                'Jeg vil gerne have hjælp til:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              Divider(
                                thickness: 2.5,
                              ),
                              SizedBox(
                                height: paddingSize,
                              ),
                              getTaskCards(),  
                            ],
                          ),
                        ),
                      ),
                    ),
                            const SizedBox(
                              height: profilePageBlockpaddingSize,
                            ),

                    Container(
                      height: outerTasksHeight,
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: paddingSize,
                            ),
                            const Text(
                              'Jeg tilbyder min hjælp til:',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Nunito',
                              ),
                            ),
                            const Divider(
                              thickness: 2.5,
                            ),
                            const SizedBox(
                              height: paddingSize,
                            ),
                            getBanners(), 
                          ],
                        ),
                      ),
                    ),


 
            const SizedBox(height: profilePageBlockpaddingSize,), 
            Container( decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)), 
                color: Colors.white, ),
    

            child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: paddingSize,),
                  const Center(
                    child: Text(
                      'Bedømmelse: ',
                      style: TextStyle(
                        fontSize: 22,

                      ),
                    ),
                  ),


                  // const SizedBox(height: paddingSize,),

                  // Center(
                  //   child: getRatingreview(reviews.size , reviews, ratingscount),
                  // ),

                  // Center(
                  //   child: Text(
                  //     '${reviews.size} Anbefalinger',
                  //     style: const TextStyle(
                  //       fontSize: 25,
                  //     ),
                  //   ),
                  // ),

                  // Container(
                  //   margin: const EdgeInsets.all(4.0),
                  //   height: 200.0 * reviews.size ,
                  //   child: 
                  //   ListView.builder(
                  //     itemCount: reviews.size,
                  //     itemBuilder: (context, index) {
                  //       return 
                  //         Column(
                  //           children: [

                  //             Padding(
                  //               padding: const EdgeInsets.all(4.0),
                  //                 child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: <Widget>[
                  //                     Padding(
                  //                       padding: const EdgeInsets.all(4.0),
                  //                       child: 
                  //                       Container(
                  //                         width: MediaQuery.of(context).size.width * 0.85 ,
                  //                         // color: Colors.grey[200],
                  //                       decoration: BoxDecoration(
                  //                           borderRadius: const BorderRadius.only(
                  //                           topLeft: Radius.circular(30),
                  //                           topRight: Radius.circular(30),
                  //                           bottomRight: Radius.circular(30),
                  //                           bottomLeft: Radius.circular(30),
                  //                         )
                  //                          ,
                  //                         color: Colors.grey[200],
                  //                       ),
                  //                         child: ReviewCardComment(
                  //                                   taskID: reviews.docs[index]['taskID'], 
                  //                                   category: reviews.docs[index]['category'], 
                  //                                   subject: reviews.docs[index]['subject'], 
                  //                                   description: reviews.docs[index]['description'], 
                  //                                   TaskOwnerName: reviews.docs[index]['TaskOwnerName'], 
                  //                                   TaskOwnerIMG: reviews.docs[index]['TaskOwnerIMG'], 
                  //                                 ),
                  //                       )


                  //                             ),
                  //                           ],
                  //                         )
                  //                       ),
                  //                     ]
                  //                   );
                  //                 },
                  //               ), 
                  //             ),



                ]
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


            
