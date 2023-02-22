import 'package:fulltaskhero/Profile/profile_page.dart';
import 'package:fulltaskhero/Tasks/feedScreen.dart';
import 'package:flutter/material.dart';
import 'package:fulltaskhero/Tasks/exploreScreen.dart';
import 'package:fulltaskhero/Tasks/createNewTask.dart';

class Home extends StatefulWidget {
    final int selectedIdx ; 
    final bool taskToggle, serviceToggle; 
    final String dropdownvalueCategories; 

  const Home(
      {Key? key,
      required this.selectedIdx,
      this.taskToggle = true, 
      this.serviceToggle = true, 
      this.dropdownvalueCategories = 'Vælg kategori', 
      })
      : super(key: key);



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _selectedIndex = widget.selectedIdx;
  
  late final bool _serviceToggle = widget.serviceToggle ; 
  late final bool _taskToggle = widget.taskToggle; 
  late final String  _dropdownvalueCategories = widget.dropdownvalueCategories; 
  


  @override
  
  Widget build(BuildContext context) {
    final List<Widget> pages = [
    
    FeedScreen(),
    ExploreScreen(
      taskToggle: _taskToggle,
      serviceToggle: _serviceToggle,
      dropdownvalueCategories: _dropdownvalueCategories, 
      ),

    const CreateNewTask(),
    const ProfilePage(uid: 1),
    ];

    return Scaffold(
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
              color: Colors.black,
            ),
            label: 'Udforsk',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Søgning',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.add_task_outlined,
              color: Colors.black,
            ),
            label: 'Ny opgave',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person_outline_rounded,
              color: Colors.black,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
