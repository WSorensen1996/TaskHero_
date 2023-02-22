// ignore: file_names
import 'package:fulltaskhero/main.dart';
import 'package:flutter/material.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/alltask_task_card.dart';
// import 'package:fulltaskhero/Tasks/tasks_widgets/handleClick.dart'; 
import 'package:fulltaskhero/styles.dart'; 
import 'package:fulltaskhero/httpRequests.dart';


//  ExploreScreen 

class ExploreScreen extends StatefulWidget {
  
  const ExploreScreen({
    Key? key,
    this.taskToggle = true, 
    this.serviceToggle = true, 
    this.dropdownvalueCategories = 'Vælg kategori', 

  }) : super(key: key);

  final bool taskToggle, serviceToggle; 
  final String dropdownvalueCategories; 

  @override
  // ignore: library_private_types_in_public_api
  _exploreScreen createState() => _exploreScreen();
}
// ignore: camel_case_types
class _exploreScreen extends State<ExploreScreen> {


  String dropdownvalueCities = 'Vælg lokation';  
    var cities = [   
      'Vælg lokation',
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

    late String dropdownvalueCategories; 
    
    late bool taskToggle; 
    late bool serviceToggle; 

    @override
    void initState() {
    super.initState();
    // getCategories();
    taskToggle = widget.taskToggle; 
    serviceToggle = widget.serviceToggle; 
    dropdownvalueCategories = widget.dropdownvalueCategories; 
    } 



  var searchInput; 
  var taskColor; 
  var serviceColor; 
  var taskIcon; 
  var serviceIcon; 
  @override
  Widget build(BuildContext context) {
  if (taskToggle && serviceToggle){
    searchInput = ['Opgave', 'Service']; 
  }
  if (!taskToggle && !serviceToggle){
    searchInput = ['']; 
  }
  if (taskToggle && !serviceToggle){
    searchInput = ['Opgave']; 
  }
  if (serviceToggle && !taskToggle){
    searchInput = ['Service']; 
  }
  if (taskToggle){
    taskColor = Colors.blue[100]; 
    taskIcon = Icons.check; 
  }
  else{
    taskColor = Colors.grey[50]; 
    taskIcon = Icons.do_not_disturb_alt_rounded ; 
  }
  if (serviceToggle){
    serviceColor = Colors.blue[100]; 
    serviceIcon = Icons.check ; 
  }
  else{
    serviceColor = Colors.grey[50]; 
    serviceIcon = Icons.do_not_disturb_alt_rounded; 
  }


  return
      FutureBuilder(
            future: getTasksRequest(),
            builder: (BuildContext ctx, AsyncSnapshot posts) {
              if (posts.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } 
              else {

    
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dine opgaver',
        
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            title: 
              const Text('Udforsk nye opgaver', 
              style: 
                TextStyle(
                  color: Colors.black, 
                ),
              ),
           
          ),
          body:
            Container(
            decoration: const BoxDecoration(
            image: DecorationImage(
              image: mainBackgroundimage, 
              fit: BoxFit.cover,
            ),
          ),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                            children: [
                              FloatingActionButton.extended(
                              heroTag: "btn1",
                              label: const Text('Opgaver', 
                              style: TextStyle(
                                color: Colors.black, 
                                fontSize: 14, 
                              ),
                              ), // <-- Text
                              backgroundColor: taskColor, 
                              icon: Icon( // <-- Icon
                                taskIcon,
                                size: 14.0,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  taskToggle = !taskToggle;  
                                });

                                },                      
                              ),
                    

                              FloatingActionButton.extended(
                              heroTag: "btn2",
                              label: const Text('Services', 
                              style: TextStyle(
                                color: Colors.black, 
                                fontSize: 14, 
                              ),
                              ), // <-- Text
                              backgroundColor: serviceColor,
                              icon: Icon( // <-- Icon
                                serviceIcon,
                                size: 14.0,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  serviceToggle = !serviceToggle; 
                                });
                                 
                                },                      
                              ),
                            ],
                          ),
                    
                                                Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                              children:  
                                [
                        
                                Container(
                                  width: 160,
                                  child: Material(
                                      elevation: 8,
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.grey[50],
                                    child:
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                         DropdownButton(
                                          alignment: Alignment.centerRight,
                                          value: dropdownvalueCategories,
                                          icon: const Icon(Icons.keyboard_arrow_down),   
                                          items: categories.map((String val) {
                                            return DropdownMenuItem(
                                              value: val,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(val, 
                                                
                                                style: const TextStyle(
                                                  fontSize: 14
                                                ),),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownvalueCategories = newValue!;
                                            });
                                          },
                                    iconSize: 42,
                                    underline: const SizedBox(),
    
                      ),
                                       ],
                                     ),
                                  ),
                                ),


                                  Container(
                                    width: 160,
                           
                                    child: Material(
                                      elevation: 8,
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.grey[50],
                                      child:
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end ,
                                        children: [
                                          DropdownButton(
                                            alignment: Alignment.centerRight,
                                            value: dropdownvalueCities,
                                            icon: const Icon(Icons.keyboard_arrow_down),   
                                            items: cities.map((String val) {
                                              return DropdownMenuItem(
                                                value: val,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(val, 
                                              style: const TextStyle(
                                                  fontSize: 14
                                              ),),
                                                ),
                                              
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalueCities = newValue!;
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

                        ],
                      ),


                    ), 

                    Expanded(
                      
                        child: SizedBox(
                          
                          height: double.maxFinite, //MediaQuery.of(context).size.height*0.9,
                          child:
                          
                          ListView.builder(
                          itemCount: posts.data.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: SingleChildScrollView(
                              child: Column(
                                
                                children: <Widget>[
                                AllTaskTaskCard(
                                  taskID: posts.data[index].taskID, 
                                  category: posts.data[index].category, 
                                  description: posts.data[index].description, 
                                  location: posts.data[index].location, 
                                  price: posts.data[index].price.toString(), 
                                  subject: posts.data[index].subject,
                                  timeCreated: posts.data[index].timeCreated,
                                  taskOwnerid: posts.data[index].taskOwnerid,
                                  taskOwnerName: posts.data[index].taskOwnerName,
                                  imageURL: posts.data[index].imageURL,
                                  taskType: posts.data[index].taskType,
                                  yourtasks: false,
                                  ),
                                ],
                              ),
                            )
                          
                        );
                          }
                      ),
                    ),

                    

                  
                ),
                  ]
            )
          )
        )
      )
      ); 
      }
            }
      ); 
            }
  }
  
