import 'package:flutter/material.dart';
import 'package:tinder_clone/global.dart';

class LikeSentLikeRecievedScreen extends StatefulWidget {
  const LikeSentLikeRecievedScreen({super.key});

  @override
  State<LikeSentLikeRecievedScreen> createState() => _LikeSentLikeRecievedScreenState();
}

class _LikeSentLikeRecievedScreenState extends State<LikeSentLikeRecievedScreen> 
{
  bool isLikeSentClicked =true;
  List<String> likeSentList = [];
  List<String> likeRecievedList= [];
  List likeList= [];


  getLikedListKeys() async
  {
    if(isLikeSentClicked)
    {
      var likeSentDocument = await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID.toString()).collection("likeSent")
      .get();

      for(int i=0; i<likeSentDocument.docs.length;i++)
      {
      likeSentList.add(likeSentDocument.docs[i].id);
      }
      print("likeSentList = "+ likeSentList.toString());
      getKeyDataFromUserCollection(likeSentList);
    }
    else
    {
    var likeRecievedDocument = await FirebaseFirestore.instance
    .collection("users")
    .doc(currentUserID.toString()).collection("likeRecieved")
    .get();

    for(int i=0; i<likeRecievedDocument.docs.length;i++)
      {
      likeRecievedList.add(likeRecievedDocument.docs[i].id);
    }
    print("likeRecievedList = "+ likeRecievedList.toString());
    getKeyDataFromUserCollection(likeRecievedList);
    }

    
  }

  getKeyDataFromUserCollection(List<String> keysList) async
  {
    var allUsersDocument= await FirebaseFirestore.instance.collection("users").get();

    for(int i=0; i<allUsersDocument.docs.length;i++)
    {
      for(int k=0;k<keysList.length;k++ )
      {
        if(((allUsersDocument.docs[i].data() as dynamic)["uid"])==keysList[k])
        {
          likeList.add(allUsersDocument.docs[i].data());
        }
      }
    }
    setState(() {
      likeList;
    });
    print("likeList = "+ likeList.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLikedListKeys();
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              likeSentList.clear();
              likeSentList = [];
              likeRecievedList.clear();
              likeRecievedList = [];
              likeList.clear();
              likeList = [];

              setState(() {
                isLikeSentClicked = true;
              });

              getLikedListKeys();
            },
            child: Text(
              "My Likes",
              style: TextStyle(
                color: isLikeSentClicked ? Colors.white : Colors.grey,
                fontWeight: isLikeSentClicked ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
          const Text(
            "   |   ",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          TextButton(
            onPressed: () {
              likeSentList.clear();
              likeSentList = [];
              likeRecievedList.clear();
              likeRecievedList = [];
              likeList.clear();
              likeList = [];

              setState(() {
                isLikeSentClicked = false;
              });

              getLikedListKeys();
            },
            child: Text(
              "Liked Me",
              style: TextStyle(
                color: isLikeSentClicked ? Colors.grey : Colors.white,
                fontWeight: isLikeSentClicked ? FontWeight.normal : FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      centerTitle: true,
    ),
    body: likeList.isEmpty
        ? const Center(
            child: Icon(
              Icons.person_off_sharp,
              color: Colors.white,
              size: 60,
            ),
          )
        : GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(8),
            children: List.generate(likeList.length, (index) {
              return GridTile(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () {
                      // Your onTap functionality here
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(likeList[index]["imageProfile"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Spacer(),

                            Expanded(
                              child: Text(
                                likeList[index]["name"].toString() +
                                    " ⦾ " +
                                    likeList[index]["age"].toString(),
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Expanded(
                              child: Text(
                                likeList[index]["city"].toString() +
                                    ", " +
                                    likeList[index]["country"].toString(),
                                maxLines: 2,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
  );
}
}