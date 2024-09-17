import 'package:flutter/material.dart';
import 'package:tinder_clone/global.dart';

class FavoriteSentFavoriteRecievedScreen extends StatefulWidget {
  const FavoriteSentFavoriteRecievedScreen({super.key});

  @override
  State<FavoriteSentFavoriteRecievedScreen> createState() => _FavoriteSentFavoriteRecievedScreenState();
}

class _FavoriteSentFavoriteRecievedScreenState extends State<FavoriteSentFavoriteRecievedScreen> 
{
  bool isFavoriteSentClicked =true;
  List<String> favoriteSentList = [];
  List<String> favoriteRecievedList= [];
  List favoritesList= [];


  getFavoriteListKeys() async
  {
    if(isFavoriteSentClicked)
    {
      var favoriteSentDocument = await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID.toString()).collection("favoriteSent")
      .get();

      for(int i=0; i<favoriteSentDocument.docs.length;i++)
      {
      favoriteSentList.add(favoriteSentDocument.docs[i].id);
      }
      print("favoriteSentList = "+ favoriteSentList.toString());
      getKeyDataFromUserCollection(favoriteSentList);
    }
    else
    {
    var favoriteRecievedDocument = await FirebaseFirestore.instance
    .collection("users")
    .doc(currentUserID.toString()).collection("favoriteRecieved")
    .get();

    for(int i=0; i<favoriteRecievedDocument.docs.length;i++)
      {
      favoriteRecievedList.add(favoriteRecievedDocument.docs[i].id);
    }
    print("favoriterecievedList = "+ favoriteRecievedList.toString());
    getKeyDataFromUserCollection(favoriteRecievedList);
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
          favoritesList.add(allUsersDocument.docs[i].data());
        }
      }
    }
    setState(() {
      favoritesList;
    });
    print("favoritesList = "+ favoritesList.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getFavoriteListKeys();
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
              favoriteSentList.clear();
              favoriteSentList = [];
              favoriteRecievedList.clear();
              favoriteRecievedList = [];
              favoritesList.clear();
              favoritesList = [];

              setState(() {
                isFavoriteSentClicked = true;
              });

              getFavoriteListKeys();
            },
            child: Text(
              "My Favorites",
              style: TextStyle(
                color: isFavoriteSentClicked ? Colors.white : Colors.grey,
                fontWeight: isFavoriteSentClicked ? FontWeight.bold : FontWeight.normal,
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
              favoriteSentList.clear();
              favoriteSentList = [];
              favoriteRecievedList.clear();
              favoriteRecievedList = [];
              favoritesList.clear();
              favoritesList = [];

              setState(() {
                isFavoriteSentClicked = false;
              });

              getFavoriteListKeys();
            },
            child: Text(
              "I'm their Favorite",
              style: TextStyle(
                color: isFavoriteSentClicked ? Colors.grey : Colors.white,
                fontWeight: isFavoriteSentClicked ? FontWeight.normal : FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      centerTitle: true,
    ),
    body: favoritesList.isEmpty
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
            children: List.generate(favoritesList.length, (index) {
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
                          image: NetworkImage(favoritesList[index]["imageProfile"]),
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
                                favoritesList[index]["name"].toString() +
                                    " ⦾ " +
                                    favoritesList[index]["age"].toString(),
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
                                favoritesList[index]["city"].toString() +
                                    ", " +
                                    favoritesList[index]["country"].toString(),
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