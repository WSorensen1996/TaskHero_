// ignore: file_names
import 'package:fulltaskhero/Tasks/tasks_widgets/banners.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/category_list.dart';
import 'package:fulltaskhero/Tasks/tasks_widgets/new_task_card.dart';
import 'package:fulltaskhero/home.dart';
import 'package:fulltaskhero/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';


 Map<String, String> _headers = {
       'XAPIKey': '',
     };


Future<UserInformation> fetchuserinformation(int id) async {
  final response = await http
      .get(Uri.parse('https://taskhero.azurewebsites.net/api/userinformation/$id'), 
      headers: _headers, 
    );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserInformation.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load UserInformation');
  }
}


class UserInformation {
  final int id;
  final String birthday, catchprase, description,firstname,  lastname,imageURL;
  final bool termsAndConditionsAccepted; 

  const UserInformation({
    required this.id,
    required this.birthday,
    required this.catchprase,
    required this.description,
    required this.firstname,
    required this.lastname,
    required this.imageURL,
    required this.termsAndConditionsAccepted,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return UserInformation(
      id: json['id'],
      birthday: json['birthday'],
      catchprase: json['catchprase'],
      description: json['description'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      imageURL: json['imageURL'],
      termsAndConditionsAccepted: json['termsAndConditionsAccepted']
    );
  }
}






//////// HTTP REQUES GET ALL  ////////////////////////////////////////////
Future<List<categories>> getCategoriesRequest() async {
  //replace your restFull API here.
  final response = await http.get(Uri.parse("https://taskhero.azurewebsites.net/api/categories"),
      headers: _headers, 
    );

  var responseData = json.decode(response.body);



  //Creating a list to store input data;
  List<categories> users = [];
  for (var singleUser in responseData) {
    categories category = categories(
        taskID: singleUser['id'].toString(), 
        category: singleUser['category'], 
        imageURL: singleUser['imageURL'],
        );
    //Adding user to the list.
    users.add(category);
  }
  return users;
}





//////// HTTP REQUES GET ALL  ////////////////////////////////////////////
Future<List<Task>> getTasksRequest() async {
  //replace your restFull API here.
  final response = await http.get(Uri.parse("https://taskhero.azurewebsites.net/api/tasks"), 
      headers: _headers, 
     );

  var responseData = json.decode(response.body);

  //Creating a list to store input data;
  List<Task> users = [];
  for (var singleUser in responseData) {
    Task user = Task(

        taskID: singleUser['id'].toString(), 
        category: singleUser['category'], 
        description: singleUser['description'], 
        location: singleUser['location'], 
        price: singleUser['price'].toString(), 
        subject: singleUser['subject'],
        timeCreated: singleUser['timeCreated'],
        taskOwnerid: singleUser['ownerID'],
        taskOwnerName: singleUser['taskOwnerName'] ?? " test ",
        imageURL: singleUser['imageURL'],
        taskType: singleUser['taskType'],

        );

    //Adding user to the list.
    users.add(user);
  }
  return users;
}

//Creating a class user to store the data;
class categories{
  final String taskID, category, imageURL; 

  categories({
    required this.taskID,
    required this.category,
    required this.imageURL,
  });
}
////////////////////////////////////////////////////
//Creating a class user to store the data;
class Task {
  final String taskID,taskType,  category, description, location, price, subject, timeCreated, taskOwnerid, taskOwnerName, imageURL; 
 
  Task({
    required this.taskID,
    required this.category,
    required this.description,
    required this.location,
    required this.price,
    required this.subject,
    required this.timeCreated,
    required this.taskOwnerid,
    required this.taskOwnerName,
    required this.imageURL,
    required this.taskType,
  });
}
