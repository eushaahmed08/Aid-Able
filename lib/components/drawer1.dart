import 'package:aid_able/components/my_list_tile.dart';
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {

  final void Function()? onProfileTap;
  final void Function()? onSignOut;

  const MyDrawer({super.key, required this.onProfileTap,required this.onSignOut,});

  @override
  Widget build(BuildContext context) {
    return Drawer(



        backgroundColor: Color.grey[900],

        child: Column(

        children: [

          //header

          const DrawerHeader(

            child: Icon(
              Icons.people,

              color: Colors.white,
              size: 64,

            ),



          ),



        //home list title

        MyListTile(

        icon: Icons.home, text: 'H O M E',

        onTap:() => Navigator.Pop(context),

        ),



        //profile list title



          MyListTile(

              icon: Icons.people,
              text: 'P R O F I L E',
              onTap:onProfileTap ),
          //logout list title

          MyListTile(

              icon: Icons.logout,
              text: 'L O G O U T',
              onTap:onSignOut ),

        ],


    ),
    );
  }

}