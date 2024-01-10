import 'package:aid_able/components/my_list_tile.dart';
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {

  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(



        backgroundColor: Color.gray[900],

        child: Column(

        children: [

          //header

          const DrawerHeader(

            child: Icon(
              Icons.people,

              color: Colors.white,
              size: 64,

            )



          )



        //home list title

         MyListTile(icon: Icons.home, text: 'H O M E'),


        //profile list title

          //logout list title
        ]


    )
    )
  }

}