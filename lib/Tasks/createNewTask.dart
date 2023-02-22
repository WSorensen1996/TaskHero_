// ignore: file_names
import 'package:fulltaskhero/Tasks/tasks_widgets/yourServices.dart';
import 'package:fulltaskhero/completeUser/complete_user.dart';
import 'package:fulltaskhero/home.dart';
import 'package:flutter/material.dart';
import 'package:fulltaskhero/Tasks/yourTasks.dart'; 
import 'package:intl/intl.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/fullTaskCard.dart';
import 'package:fulltaskhero/styles.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({
    Key? key}) : super(key: key);
  @override
  State <CreateNewTask> createState() => _createNewTask(); 
}

  // ignore: camel_case_types
  class _createNewTask extends State<CreateNewTask> {
    
    //Controllers 
    final _categoryController = TextEditingController();
    final _subjectController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _locationController = TextEditingController();    
    final _priceController = TextEditingController();  
    final uid = 1 ;
    final currentUserName = " hardcode test "; 

    String imageUrl = 'https://firebasestorage.googleapis.com/v0/b/helpinghand00-c0649.appspot.com/o/Tasks%2FDefault%2Ftask.jpg?alt=media&token=4168c434-7b17-4e0c-886b-bdde8a3ffb19'; 


    // ignore: non_constant_identifier_names
    Future UploadTask() async{




        // 'taskType': dropdownvaluetype, 
        // 'ownerID': uid,
        // 'category': dropdownvaluecategories, 
        // 'subject': _subjectController.text.trim(), 
        // 'description': _descriptionController.text.trim(), 
        // 'location': dropdownvaluecities, 
        // 'price': _priceController.text.trim(), 
        // 'timeCreated': DateFormat.yMd().format(DateTime.now()),
        // 'TaskOwnerName': user['firstname'],
        // 'imageURL': imgURL['imgURL'] , 
        // 'PrioritizationID': DateTime.now().millisecondsSinceEpoch,


   
    }
      

    @override
      void dispose(){
      _categoryController.dispose(); 
      _subjectController.dispose();
      _descriptionController.dispose();
      _locationController.dispose();
      _priceController.dispose();
      super.dispose();
    }


    String dropdownvaluetype = 'Opgave';  
    var types = [   
      'Opgave',
      'Service',
    ];


    String dropdownvaluecities = 'København';  
    var cities = [   
      'København',
      'Odense',
      'Århus',
      'AAlborg',
      'Esbjerg',
    ];



    List<String> categories = [
      'Vælg kategori', 
      'undervisning',
      'havearbejde',
      'underholdning',
    ];

    String dropdownvaluecategories = 'Vælg kategori'; 
    
    
    @override
    Widget build(BuildContext context) {
    double paddingSize = 30; 
    double screenWidth = MediaQuery.of(context).size.width - paddingSize * 2; 

    return Scaffold(
    appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 240, 239, 235),
            title: const Text('Opret en ny Opgave/Service', 
            style: mainTitleStyle,
            
            ),
          ),

      backgroundColor: Colors.grey[300],
      body: SafeArea(
        
      
        child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: mainBackgroundimage, 
            fit: BoxFit.cover,
          ),
        ),
          child: Center(
            child: SingleChildScrollView(
              child: Column( children: [
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      
                      FloatingActionButton.extended(
                        heroTag: "btn1",
                        label: const Text('Forhåndsvisning',  
                        style: createTaskStyle
                        ), // <-- Text
                        backgroundColor: mainColor,
                        icon: const Icon( // <-- Icon
                          Icons.looks,
                          size: 24.0,
                          color: Colors.black,
                        ),
                        onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => 
                          FullTaskCard(
                            taskID: '', // empty as this is in previewMode
                            category: dropdownvaluecategories, 
                            subject: _subjectController.text.trim(), 
                            description: _descriptionController.text.trim(), 
                            location: dropdownvaluecities , 
                            price:  _priceController.text.trim(), 
                            timeCreated: DateFormat.yMd().format(DateTime.now()),
                            taskOwnerid: "1", //////hard codes uid
                            taskOwnerName: currentUserName,
                            imageURL:  imageUrl ,
                            previewMode: true,
                            )),);
                        },                      
                      ),
                    ],
                  ),
                ),
                      
                      // FloatingActionButton.extended(
                      //   heroTag: "btn2",
                      //   label: const Text('test',  
                      //   style: createTaskStyle
                      //   ), // <-- Text
                      //   backgroundColor: mainColor,
                      //   icon: const Icon( // <-- Icon
                      //     Icons.looks,
                      //     size: 24.0,
                      //     color: Colors.black,
                      //   ),
                      //   onPressed: () {
                      //   Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => 
                      //     CompleteUser(), 
                          
                      //     ),);
                      //   },                      
                      // ),

                // //////// Type Start
                Row(
                  
                  children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical:5), 
                        child: Container(
                            width: screenWidth, 
                            decoration: BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  
                                  [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                      'Opgave eller Service? ',
                                      style: createTaskStyle
                                      ),
                                    ),
                                  DropdownButton(
                                  value: dropdownvaluetype,
                                  icon: const Icon(Icons.keyboard_arrow_down),   
                                  items: types.map((String val) {
                                    return DropdownMenuItem(
                                      value: val,
                                      child: Text(val),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvaluetype = newValue!;
                                    });
                                  },
                                iconSize: 42,
                                underline: const SizedBox(),
                                ),
                                ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //////// Type end 

                //////// Category Start
                Row(
                  children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical:5), 
                        child: Container(
                            width: screenWidth, 
                            decoration: BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                children:  
                                  [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                      'Kategori: ',
                                      style: createTaskStyle),
                                    ),
                                  DropdownButton(
                                    alignment: Alignment.centerRight,
                                    value: dropdownvaluecategories,
                                    icon: const Icon(Icons.keyboard_arrow_down),   
                                    items: categories.map((String val) {
                                      return DropdownMenuItem(
                                        value: val,
                                        child: Text(val),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvaluecategories = newValue!;
                                      });
                                    },
                                  iconSize: 42,
                                  underline: const SizedBox(),
    
                        ),
                                ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //////// Category end 



                //////// Location Start
                Row(
                  children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical:5), 
                        child: Container(
                            width: screenWidth, 
                            decoration: BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  
                                  [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                      'Lokation: ',
                                      style: createTaskStyle, ),
                                    ),
                                    DropdownButton(
                                      alignment: Alignment.centerRight,
                                      value: dropdownvaluecities,
                                      icon: const Icon(Icons.keyboard_arrow_down),   
                                      items: cities.map((String val) {
                                        return DropdownMenuItem(
                                          value: val,
                                          child: Text(val),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvaluecities = newValue!;
                                        });
                                      },
                                    iconSize: 42,
                                    underline: const SizedBox(),
                                    ),
                                ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //////// Location end 


                // Firstname text field start
                Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5),
                  child: 
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white), 
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        autocorrect: false,
                        controller: _subjectController, 
                        decoration: const InputDecoration(
                          border: InputBorder.none, 
                          hintText: ' Emne',
                          hintStyle: createTaskStyle, 
                        ),
                      ),
                    ),
                ),
                // Firstname text field end


                // Description text field start
                Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5),
                  child: 
                    Container(
                      width: screenWidth,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white), 
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        autocorrect: false,
                        controller: _descriptionController, 
                        decoration: const InputDecoration(
                          border: InputBorder.none, 
                          hintText: ' Beskrivelse af opgaven',
                          hintStyle:  createTaskStyle, 

                        ),
                      ),
                    ),
                ),
                // Description text field end

                // Price text field start
                Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5),
                  child: 
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white), 
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _priceController, 
                        decoration: const InputDecoration(
                          border: InputBorder.none, 
                          hintText: ' Pris',
                          hintStyle: createTaskStyle
                        ),
                      ),

                    ),
                ),
                // Price text field end


                // create task button start
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10) , 
                  child: GestureDetector(
                    onTap: 
                      (){
                    if (dropdownvaluecategories!='Vælg kategori' && _subjectController.text.isNotEmpty && _descriptionController.text.isNotEmpty && _priceController.text.isNotEmpty  ){


                      UploadTask();
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(builder: (context) => 
                      // const Home(selectedIdx: 1),
                      //   ),
                      //   );
                      // if (dropdownvaluetype=='Opgave'){
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(builder: (context) => 
                      // const YourTasksPage(),
                      //   ),
                      //   );

                      // }
                      // if (dropdownvaluetype=='Service'){
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(builder: (context) => 
                      // const YourServicesPage(),
                      //   ),
                      //   );
                      // }
                      mainSnakBar(context,'Succes');

                    }
                    else{
                      mainSnakBar(context,'Ikke alle felter er udfyldt');

                    }
                                    
                      



                      },
                  
                    child: Container(
                      width: screenWidth,
                      padding: const EdgeInsets.all(10), 
                      decoration: BoxDecoration(
                        color: mainbuttonColor, 
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text('Opret $dropdownvaluetype',
                        style: mainbuttonStyle)
                      )
                    )



                  ),
                ), 
                // create button end 

              
          


          ]
          ),
      ),
      ),
        ),
    ),
    
  


          

            





    );
  }
}

