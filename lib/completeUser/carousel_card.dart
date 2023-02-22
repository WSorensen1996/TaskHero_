import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  CarouselCard({
    required this.image,
    required this.description,
    });

  String image, description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
            ),
          ), 
                Container(
                     
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                description,
                                
                                style: TextStyle(
                                  
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold, 
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                          ),
                  
                  
              
        ]
            ),
   
      ); 

    
      
    
  }
}
