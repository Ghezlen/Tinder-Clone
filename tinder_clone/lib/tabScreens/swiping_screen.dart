import 'package:flutter/material.dart';
import 'package:tinder_clone/controllers/profile-controller.dart';
import 'package:get/get.dart';
import 'package:tinder_clone/global.dart';
import 'package:tinder_clone/tabScreens/user_details_screen.dart';

class SwipingScreen extends StatefulWidget {
  const SwipingScreen({super.key});

  @override
  State<SwipingScreen> createState() => _SwipingScreenState();
}

class _SwipingScreenState extends State<SwipingScreen> {

  ProfileController profileController = Get.put(ProfileController());
  String senderName="";

  readUserData() async
  {
    await FirebaseFireStore.instance
    .collection("users")
    .doc(currentUserID)
    .get()
    .then((dataSnapshot)
    {
      setState(() {
        senderName = dataSnapshot.data()!["name"].toString();

      });
    }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()
      {
        return PageView.builder(
        itemCount: ProfileController.allUsersProfileList.length ,
        controller: PageController(initialPage: 0, viewportFraction:1),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          
          final eachProfileInfo = profileController.allUsersProfileList[index];

      return DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              eachProfileInfo.imageProfile.toString(),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [

              //filter icon button
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top:8),
                  child: IconButton(
                    onPressed: ()
                    {

                    },
                    icon: const Icon(
                      Icons.filter_list,
                      size: 30,
                    ),
                  ),
                ),
              ),
              
              const Spacer(),
              
              //user data
              GestureDetector(
                onTap:()
                {
                  profileController.viewSentviewRecieved(
                        eachProfileInfo.uid.toString(),
                        senderName,
                      );
                  
                  //send the user to the person profile userdetailsscreen
                  Get.to(UserDetailsScreen(userID: eachProfileInfo.uid.toString() ,));
                },
                child: Column(
                  children: [

                    //name
                    Text(
                      eachProfileInfo.name.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //age - city
                    Text(
                      eachProfileInfo.age.toString() +"⦿"+eachProfileInfo.city.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        letterSpacing: 4,
                      ),
                    ),
                    
                    const SizedBox(
                      height:4,
                    ),

                    //work - religion
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white30,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            eachProfileInfo.profession.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ) ,
                        ),

                        const SizedBox(
                          height:4,
                        ),

                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white30,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            eachProfileInfo.religion.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ) ,
                        ),
                      ],
                    ),

                    
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white30,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            eachProfileInfo.profession.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ) ,
                        ),

                        const SizedBox(
                          height:4,
                        ),

                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white30,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            eachProfileInfo.religion.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ) ,
                        ),
                      ],
                      ),
                      
                      //country and ethnicity
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white30,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            eachProfileInfo.country.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ) ,
                        ),

                        const SizedBox(
                          height:4,
                        ),

                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white30,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            eachProfileInfo.ethnicity.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ) ,
                        ),
                      ],
                      ),
                  ],),
              ),
            
              const SizedBox(
                height: 14,
              ),
            
              //image buttons - favorite - chat - like
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //favorite button
                  GestureDetector(
                    onTap: ()
                    {
                      profileController.favoriteSentFavoriteRecieved(
                        eachProfileInfo.uid.toString(),
                        senderName,
                      );
                    },
                    child: Image.asset(
                      "images/favorite.png",
                      width: 60,
                    )
                  ),
                  //chat button
                   GestureDetector(
                    onTap: ()
                    {

                    },
                    child: Image.asset(
                      "chat.png",
                      width: 90,
                    )
                  ),
                  //like button
                   GestureDetector(
                    onTap: ()
                    {
                      profileController.likeSentLikeRecieved(
                        eachProfileInfo.uid.toString(),
                        senderName,
                      );
                    },
                    child: Image.asset(
                      "like.webp",
                      width: 60,
                    )
                  ),
                ],
              ),

            ],
          ),
        ),
      );
        }
      );
      }),
    );
  }
}