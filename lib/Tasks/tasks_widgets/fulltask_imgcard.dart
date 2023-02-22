import 'package:flutter/material.dart';

class imgCard extends StatelessWidget {
  imgCard({required this.imgurl});

  String imgurl;

  @override
  Widget build(BuildContext context) {
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(8), 
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36.0),
                  image: DecorationImage(
                      image: NetworkImage(imgurl,), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ],
      );
  }
}
