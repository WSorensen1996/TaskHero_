import 'package:flutter/material.dart';
import 'package:fulltaskhero/home.dart';
import 'package:fulltaskhero/styles.dart'; 

class CategoryCard extends StatelessWidget {
  final String url;
  final String title;
  const CategoryCard({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = NetworkImage(url);
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () {

            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => 
    Home(selectedIdx: 1,dropdownvalueCategories: title.toLowerCase(),),
      ),
      ); 


      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingSize),
          child: Material(
            
            borderRadius: BorderRadius.circular(10),
            elevation: 10,
            color: Colors.transparent,
            child: 
              Ink(
                width: MediaQuery.of(context).size.width * 0.5,
                height:  MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  border: mainBorderStyle, 
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
                ),
          ),
        ),

          Padding(
            padding: const EdgeInsets.all(paddingSize),
            child: Text(
              title,
              style: txtStyle1,
            ),
          ),
        ],
      ),
    );
  }
}
