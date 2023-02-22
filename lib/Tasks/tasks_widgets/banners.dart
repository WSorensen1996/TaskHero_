import 'package:fulltaskhero/styles.dart';
import 'package:flutter/material.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/fullTaskCard.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:'; 

class Banners extends StatelessWidget {
  final String taskID, category, subject, description, location, price, timeCreated, taskOwnerid, taskOwnerName, imageURL;
  bool messengerBanner; 
  Banners(
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
      this.messengerBanner=false,

      })
      : super(key: key);
  var _bannerwidth; 
  @override
  Widget build(BuildContext context) {
    if (messengerBanner){
      _bannerwidth = screenWidth(context); 
    }
    else{
      _bannerwidth = screenWidth(context)*bannerwidth; 
    }
    final image = NetworkImage(imageURL);
    return SizedBox(
      height: screenHeight(context)*bannerHeight,
      width: _bannerwidth,
      child: Card(
        elevation: 12.0,
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        
        clipBehavior: Clip.antiAlias,
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
                              previewMode: false,
                              )),);
                            },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Material(
        color: Colors.transparent,
        child: 
        Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 138,
          height: screenHeight(context)*bannerHeight,
              ),
            ),

                        SizedBox(
              height: screenHeight(context)*bannerHeight,
              width: 145,
              child: Center(
                child: Text(
                  subject,
                  style: txtStyle1,
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





      ////// CAHCEMANGER FORSØG 
//         CachedNetworkImage(
//     key: UniqueKey(),
//     imageUrl: url,
//     placeholder: (context, url) => CircularProgressIndicator(),
//     errorWidget: (context, url, error) => Icon(Icons.error),
//     // cacheManager: CacheManager(
//     //     Config(
//     //       "fluttercampus",
//     //       stalePeriod: const Duration(days: 7),
//               // maxNrofCacheObjects: 100, 
//     //       //one week cache period
//     //     )
//     ),


        // child: Ink.image(
        //   image: image,
        //   fit: BoxFit.cover,
        //   width: 128,
        //   height: 128,
        //   child: InkWell(onTap: (){
        //        print('TEESTER'); 

        //   }
        //   ),
        // ),