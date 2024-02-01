// ignore_for_file: prefer_const_constructors

import 'package:aid_able/components/chat_bubble.dart';
import 'package:aid_able/components/my_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aid_able/chat/chat_service.dart';
import 'package:aid_able/services/auth_service.dart';

class ChatPage extends StatelessWidget{


  final String receiverEmail;
 final String receiverID;
   ChatPage({

    super.key,
    required this.receiverEmail,
     required this.receiverID,
});
  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService =AuthService();

 void sendMessage() async{
 if( _messageController.text.isNotEmpty){
   await _chatService.sendMessage(receiverID, _messageController.text);
   _messageController.clear();
    }
 }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("receiverEmail"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,

      ),
      body: Column(
        children: [
          //display all the messages
          Expanded(
            child: _buildMessageList(),
          ),
          //user input
          _buildUserInput(),
        ],
      ),
    ); //Scaffold
  }

  Widget _buildMessageList(){
   String senderID =_authService.getCurrentUser()!.uid;
   return StreamBuilder(
       stream: _chatService.getMessages(receiverID,senderID),
        builder: (context,snapshot){
    if(snapshot.hasError){
    return const Text ("Error");
    }
    if(snapshot.connectionState== ConnectionState.waiting){
    return const Text ("Loading ....");
    }

    return ListView(
    children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
    );

    },
   );
  }
  //build message item

  Widget _buildMessageItem(DocumentSnapshot doc){
   Map<String ,dynamic> data=doc.data() as Map<String ,dynamic>;

   // is current user
    bool isCurrentUser =data['senderID']== _authService.getCurrentUser()!.uid;


    var alignment=
        isCurrentUser ? Alignment.centerRight :Alignment.centerLeft;
   return Container(
     alignment: alignment,
     child:Column(
       crossAxisAlignment:
         isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
       children:[
         ChatBubble(
             message: data["message"],
             isCurrentUser: isCurrentUser,
         )

       ],

     ),
   );
  }

  Widget _buildUserInput(){
   return padding(
     padding : const EdgeInsets.only(bottom:50.0),



   child: Row(
     children: [
       Expanded(
           child: MyTextFeild(
            controller: _messageController,
            hintText: "Type a Message",
            obscureText: false,
   ),
       ),
       //send button
    Container(
      decoration: const BoxDecoration(
        color: color.green,
        shape: BoxShape.circle,
    ),
    margin: const EdgeInsets.only(right:25),
      child: Iconbutton(
    onPressed: sendMessage,
    icon: const Icon(

    Icons.arrow_upward,
      color: Colors.white,
    ),
      ),

    ),


     ],
   ),
   );

  }

}