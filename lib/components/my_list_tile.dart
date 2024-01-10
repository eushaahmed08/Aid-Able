import 'package:flutter/material.dart';


class  MyListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  void Function()? onTap;

  const MyListTile({

    super.key,
    required this.icon,
    required this.text,

  });

  @override

  Widget build(BuildContext context) {

    return padding(

      padding: const EdgeInsets.only(left: 10.0),

      child: ListTile(

      leading: Icon(

        icon,
        color: Colors.white,

      ),

      title: Text(

          text,
    style: TextStyle(color: Colors.white),

      ),
    ),
    ); //padding

  }


}
