import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook/cubit/cubit.dart';
 import 'package:flutter_facebook/data/states.dart';
import 'package:flutter_facebook/data/data.dart';
   import 'package:flutter_facebook/models/post_model.dart';
  
   import 'package:flutter_facebook/widgets/circle_button.dart';
import 'package:flutter_facebook/widgets/create_post_container.dart';
  import 'package:flutter_facebook/widgets/post_container.dart';
import 'package:flutter_facebook/widgets/rooms.dart';
import 'package:flutter_facebook/widgets/stories.dart';
 

 import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

   

 class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is !AppInitialState) {
            Future.delayed(Duration(seconds: 2), (){
            });
          }
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(   body: CustomScrollView(
       slivers: [
         SliverAppBar(
           brightness: Brightness.light,
           backgroundColor: Colors.white,
           title: Text("facebook",
           style: TextStyle(
             color: Colors.blue,
             letterSpacing: -1.2,
             fontSize: 28, 
           fontWeight: FontWeight.bold),
           ),
           centerTitle:false,
           floating: true,
           actions: [
             CircleButton(
              icon: Icons.search,
               iconSize: 30,
               onPressed: ()=>print("Search"),

             ),
             
             CircleButton(
              icon: MdiIcons.facebookMessenger,
               iconSize: 30,
               onPressed: ()=>print("Messenger"),

             ),
           ],
             ),

              SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser, 
              stories:stories,
              ),
          ),
        ),
           SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ),
           ),
           SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
           
           ],
     ),
         );
        

     
      
  }));
 
  }}