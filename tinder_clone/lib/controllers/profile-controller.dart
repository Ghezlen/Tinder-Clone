import 'package:tinder_clone/global.dart';
import 'package:tinder_clone/models/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:tinder_clone/tabScreens/favorite_sent_favorite_recieved_screen.dart';
import 'package:tinder_clone/tabScreens/like_sent_like_recieved_screen.dart';

class ProfileController extends GetxController
{
  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);
  List<Person> get allUsersProfileList => usersProfileList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    usersProfileList.bindStream(
      FirebaseFirestore.instance
      .collection("users")
      .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots()
      .map((QuerySnapshot queryDataSnapshot)
      {
        List<Person>ProfilesList=[];

        for(var eachProfile in queryDataSnapshot.docs)
        {
          ProfilesList.add(Person.fromdataSnapshot(eachProfile));
        }
        return ProfilesList;
      }
      )
    );
  }

  favoriteSentFavoriteRecieved(String toUserID, String senderName) async
  {
    var document = await FirebaseFirestore.instance
    .collection("users")
    .doc(toUserID).collection("favoriteRecieved").doc(currentUserID)
    .get();

    //remove the favorite from database
    if(document.exists)
    {
      //removed current user ID from the favorite recieved list of the other person profile
      await FirebaseFirestore.instance
      .collection("users")
      .doc(toUserID).collection("favoriteRecieved").doc(currentUserID)
      .delete();

      //remove the other person profile from the fav sent list of the current user
      await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID).collection("favoriteSent").doc(toUserID)
      .delete();
    }
    else //add favorite in database
    {
      //add currentUserID to the favorite recieved list of that person profile [toUserID]
      await FirebaseFirestore.instance
      .collection("users")
      .collection("users")
      .doc(toUserID).collection("favoriteRecieved").doc(currentUserID)
      .set({});

      //add the person profile to the favorite sent list of the current user 
      await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID).collection("favoriteSent").doc(toUserID)
      .set({});

      //send notification
    }

    update();
  }

   likeSentLikeRecieved(String toUserID, String senderName) async
  {
    var document = await FirebaseFirestore.instance
    .collection("users")
    .doc(toUserID).collection("likeRecieved").doc(currentUserID)
    .get();

    //remove the like from database
    if(document.exists)
    {
      //removed current user ID from the like recieved list of the other person profile
      await FirebaseFirestore.instance
      .collection("users")
      .doc(toUserID).collection("likeRecieved").doc(currentUserID)
      .delete();

      //remove the other person profile from the like sent list of the current user
      await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID).collection("likeSent").doc(toUserID)
      .delete();
    }
    else //add new like in database
    {
      //add currentUserID to the like recieved list of that person profile [toUserID]
      await FirebaseFirestore.instance
      .collection("users")
      .collection("users")
      .doc(toUserID).collection("likeRecieved").doc(currentUserID)
      .set({});

      //add the person profile to the like sent list of the current user 
      await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID).collection("likeSent").doc(toUserID)
      .set({});

      //send notification
    }

    update();
  }

  viewSentviewRecieved(String toUserID, String senderName) async
  {
    var document = await FirebaseFirestore.instance
    .collection("users")
    .doc(toUserID).collection("viewRecieved").doc(currentUserID)
    .get();

    //remove the like from database
    if(document.exists)
    {
      print("Already in view list");
    }
    else //add new view in database
    {
      //add currentUserID to the view recieved list of that person profile [toUserID]
      await FirebaseFirestore.instance
      .collection("users")
      .collection("users")
      .doc(toUserID).collection("viewRecieved").doc(currentUserID)
      .set({});

      //add the person profile to the like sent list of the current user 
      await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID).collection("viewSent").doc(toUserID)
      .set({});

      //send notification
    }

    update();
  }

}
