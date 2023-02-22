// ignore: file_names
import 'package:fulltaskhero/styles.dart';
import 'package:flutter/material.dart';

class NewTaskSubIcons extends StatelessWidget {
  final String label;
  final double width;
  final IconData icon;
  const NewTaskSubIcons({Key? key, required this.label, required this.icon, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {},
              icon: Icon(
                icon,
                color: Colors.grey,
              )),
          
          SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                label,
                style: txtStyle2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
