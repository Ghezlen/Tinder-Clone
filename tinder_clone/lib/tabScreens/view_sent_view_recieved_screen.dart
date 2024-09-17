import 'package:flutter/material.dart';
import 'package:tinder_clone/global.dart';

class ViewSentViewRecievedScreen extends StatefulWidget {
  const ViewSentViewRecievedScreen({super.key});

  @override
  State<ViewSentViewRecievedScreen> createState() => _ViewSentViewRecievedScreenState();
}

class _ViewSentViewRecievedScreenState extends State<ViewSentViewRecievedScreen> 
{
  bool isViewSentClicked =true;
  List<String> viewSentList = [];
  List<String> viewRecievedList= [];
  List viewsList= [];


  getViewsListKeys() async
  {
    if(isViewSentClicked)
    {
      var viewSentDocument = await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID.toString()).collection("viewSent")
      .get();

      for(int i=0; i<viewSentDocument.docs.length;i++)
      {
      viewSentList.add(viewSentDocument.docs[i].id);
      }
      print("viewSentList = "+ viewSentList.toString());
      getKeyDataFromUserCollection(viewSentList);
    }
    else
    {
    var viewRecievedDocument = await FirebaseFirestore.instance
    .collection("users")
    .doc(currentUserID.toString()).collection("viewRecieved")
    .get();

    for(int i=0; i<viewRecievedDocument.docs.length;i++)
      {
      viewRecievedList.add(viewRecievedDocument.docs[i].id);
    }
    print("viewRecievedList = "+ viewRecievedList.toString());
    getKeyDataFromUserCollection(viewRecievedList);
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
          viewsList.add(allUsersDocument.docs[i].data());
        }
      }
    }
    setState(() {
      viewsList;
    });
    print("viewsList = "+ viewsList.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getViewsListKeys();
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
              viewSentList.clear();
              viewSentList = [];
              viewRecievedList.clear();
              viewRecievedList = [];
              viewsList.clear();
              viewsList = [];

              setState(() {
                isViewSentClicked = true;
              });

              getViewsListKeys();
            },
            child: Text(
              "Profiles I viewed",
              style: TextStyle(
                color: isViewSentClicked ? Colors.white : Colors.grey,
                fontWeight: isViewSentClicked ? FontWeight.bold : FontWeight.normal,
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
              viewSentList.clear();
              viewSentList = [];
              viewRecievedList.clear();
              viewRecievedList = [];
              viewsList.clear();
              viewsList = [];

              setState(() {
                isViewSentClicked = false;
              });

              getViewsListKeys();
            },
            child: Text(
              "Viewed my profile",
              style: TextStyle(
                color: isViewSentClicked ? Colors.grey : Colors.white,
                fontWeight: isViewSentClicked ? FontWeight.normal : FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      centerTitle: true,
    ),
    body: viewsList.isEmpty
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
            children: List.generate(viewsList.length, (index) {
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
                          image: NetworkImage(viewsList[index]["imageProfile"]),
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
                                viewsList[index]["name"].toString() +
                                    " ⦾ " +
                                    viewsList[index]["age"].toString(),
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
                                viewsList[index]["city"].toString() +
                                    ", " +
                                    viewsList[index]["country"].toString(),
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