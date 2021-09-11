import 'package:flutter/material.dart';
import 'package:flutter_facebook/cofig/palette.dart';
import 'package:flutter_facebook/models/user_model.dart';
import 'package:flutter_facebook/widgets/profile_avatar.dart';
 
class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    Key key,
    @required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return  
       Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount:  onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index ];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
        );
      
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialButton(
      onPressed: () => print('Create Room'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
     // borderSide: BorderSide(
       // width: 3.0,
        //color: Colors.blueAccent[100],
      //),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
         
          Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.purple,
          ),
          const SizedBox(width: 4.0),
          Text('Create\nRoom'),
        ],
      ),
    );
  }
}