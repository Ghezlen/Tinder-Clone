import 'package:flutter/material.dart';
import 'package:tinder_clone/tabScreens/favorite_sent_favorite_recieved_screen.dart';
import 'package:tinder_clone/tabScreens/like_sent_like_recieved_screen.dart';
import 'package:tinder_clone/tabScreens/swiping_screen.dart';
import 'package:tinder_clone/tabScreens/user_details_screen.dart';
import 'package:tinder_clone/tabScreens/view_sent_view_recieved_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex =0;

  List tabScreensList =
  [
    SwipingScreen(),
    ViewSentViewRecievedScreen(),
    FavoriteSentFavoriteRecievedScreen(),
    LikeSentLikeRecievedScreen(),
    UserDetailsScreen(userID: FirebaseAuth.instance.currentUser!.uid,),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexNumber)
        {
          setState(() {
            screenIndex=indexNumber;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,
        currentIndex: screenIndex,
        items: const[

          //swiping screen button
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,

            ),
            label: ""
          ),

          //view sent view recieved button
          BottomNavigationBarItem(
            icon: Icon(
              Icons.remove_red_eye,
              size: 30,

            ),
            label: ""
          ),

          //favorite sent favorite recieved button
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              size: 30,

            ),
            label: ""
          ),

          //like sent like recieved button
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,

            ),
            label: ""
          ),

          //user details screen button
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,

            ),
            label: ""
          ),
        ]

      ),
      body: tabScreensList[screenIndex],
    );
  }
}