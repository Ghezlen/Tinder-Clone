import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:tinder_clone/accountSettingsScreen/account_settings_screen.dart';
import 'package:tinder_clone/global.dart';
import 'package:get/get.dart';

class UserDetailsScreen extends StatefulWidget {
  String? userID;
  UserDetailsScreen({super.key, this.userID});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {

  //personal info
  String name='';
  String age='';
  String phoneNo='';
  String city='';
  String country='';
  String profileHeading='';
  String lookingForInaPartner='';

  //appearance
  String height ='';
  String weight='';
  String bodyType='';

  //life style
  String drink='';
  String smoke ='';
  String materialStatus='';
  String haveChildren='';
  String noOfChildren='';
  String profession='';
  String employmentStatus='';
  String income='';
  String livingSituation='';
  String willingToRelocate='';
  String relationshipYouAreLookingFor='';

  //background - curtural values
  String nationality='';
  String education='';
  String languageSpoken='';
  String religion='';
  String ethnicity='';

  //slider images
  String urlImage1='https://firebasestorage.googleapis.com/v0/b/tinder-clone-a10e3.appspot.com/o/placeholder%2Favatar2.png?alt=media&token=8a9e5b42-9cdd-417c-809c-345e188d9a94';
  String urlImage2='https://firebasestorage.googleapis.com/v0/b/tinder-clone-a10e3.appspot.com/o/placeholder%2Favatar2.png?alt=media&token=8a9e5b42-9cdd-417c-809c-345e188d9a94';
  String urlImage3='https://firebasestorage.googleapis.com/v0/b/tinder-clone-a10e3.appspot.com/o/placeholder%2Favatar2.png?alt=media&token=8a9e5b42-9cdd-417c-809c-345e188d9a94';
  String urlImage4='https://firebasestorage.googleapis.com/v0/b/tinder-clone-a10e3.appspot.com/o/placeholder%2Favatar2.png?alt=media&token=8a9e5b42-9cdd-417c-809c-345e188d9a94';
  String urlImage5='https://firebasestorage.googleapis.com/v0/b/tinder-clone-a10e3.appspot.com/o/placeholder%2Favatar2.png?alt=media&token=8a9e5b42-9cdd-417c-809c-345e188d9a94';


  retrieveUserInfo() async
  {
    await FirebaseFirestore.instance
    .collection("users")
    .doc(widget.userID)
    .get()
    .then((snapchot)
    {
      if(snapchot.exists)
      {
        if(snapchot.data()!["urlImage1"] != null)
        {
          setState(() {
            urlImage1 = snapchot.data()!["urlImage1"];
          urlImage2 = snapchot.data()!["urlImage2"];
          urlImage3 = snapchot.data()!["urlImage3"];
          urlImage4 = snapchot.data()!["urlImage4"];
          urlImage5 = snapchot.data()!["urlImage5"];
          });
        }

        setState(() {
          //personal info
          name= snapchot.data()!["name"];
          age= snapchot.data()!["age"];
          phoneNo= snapchot.data()!["phoneNo"];
          city= snapchot.data()!["city"];
          country= snapchot.data()!["country"];
          profileHeading= snapchot.data()!["profileHeading"];
          lookingForInaPartner= snapchot.data()!["lookingForInaPartner"];
          //appearance
          height= snapchot.data()!["height"];
          weight= snapchot.data()!["weight"];
          bodyType= snapchot.data()!["bodyType"];
          //life style
          drink= snapchot.data()!["drink"];
          smoke= snapchot.data()!["smoke"];
          materialStatus= snapchot.data()!["materialStatus"];
          haveChildren= snapchot.data()!["haveChildren"];
          noOfChildren= snapchot.data()!["noOfChildren"];
          profession= snapchot.data()!["profession"];
          employmentStatus= snapchot.data()!["employmentStatus"];
          income= snapchot.data()!["income"];
          livingSituation= snapchot.data()!["livingSituation"];
          willingToRelocate= snapchot.data()!["willingToRelocate"];
          relationshipYouAreLookingFor= snapchot.data()!["relationshipYouAreLookingFor"];
          //background - cultural values
          nationality= snapchot.data()!["nationality"];
          education= snapchot.data()!["education"];
          languageSpoken= snapchot.data()!["languageSpoken"];
          religion= snapchot.data()!["religion"];
          ethnicity= snapchot.data()!["ethnicity"];
          
        });
      }
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserInfo();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Profile",
          style: TextStyle(
            color: Colors.white,

          ),
        ),
        centerTitle: true,
        //automaticallyImplyLeading: widget.userID == currentUserID? false : true,
        actions: [
          widget.userID == currentUserID?
          Row(
            children: [
              IconButton(
                onPressed:()
                {
                  Get.to(AccountSettingsScreen());
                },
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                ),
                ),
              IconButton(
                onPressed:()
                {
                  FirebaseAuth.instance.signOut();
                
                },
                icon: const Icon(
                  Icons.logout,
                  size: 30,
                ),
                 ),
            ],
          )
          IconButton(
            onPressed: ()
            {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(
              Icons.logout,
              size: 30,

            ),
            ),
        ],
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [

              //image slider
              SizedBox(
                height: MediaQuery.of(context).size.height*0.4,
                width:MediaQuery.of(context).size.width,
                child: Carousel(
                  indicatorBarColor: Colors.black.withOpacity(0.3),
                  autoScrollDuration: const Duration(seconds: 2),
                  animationPageDuration: const Duration(milliseconds: 500),
                  activateIndicatorColor: Colors.black,
                  animationPageCurve: Curves.easeIn,
                  indicatorBarHeight: 30,
                  indicatorHeight: 10,
                  indicatorWidth: 10,
                  unActivatedIndicatorColor: Colors.grey,
                  stopAtEnd: false,
                  autoScroll: true,
                items: [
                  Image.network(urlImage1, fit: BoxFit.cover,),
                  Image.network(urlImage2, fit: BoxFit.cover,),
                  Image.network(urlImage3, fit: BoxFit.cover,),
                  Image.network(urlImage4, fit: BoxFit.cover,),
                  Image.network(urlImage5, fit: BoxFit.cover,),
                ],),
              ),
            
              const SizedBox(height: 10.0),

              //personal info title
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Personal Info:",
                style: TextStyle(
                  color:Colors.white,
                  fontSize:22,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //personal info table data 
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    //name
                    TableRow(
                      children: 
                      [
                        const Text(
                          "Name: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                      //age
                    TableRow(
                      children: 
                      [
                        const Text(
                          "age: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          age,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                     //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                      //phone number
                    TableRow(
                      children: 
                      [
                        const Text(
                          "Phone Number: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          phoneNo,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                     //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                  
                      //country
                    TableRow(
                      children: 
                      [
                        const Text(
                          "Country: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          country,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                      //profile heading
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Profile Heading: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          profileHeading,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                   //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                      //seeking
                    TableRow(
                      children: 
                      [
                        const Text(
                          "Seeking: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          lookingForInaPartner,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                  
                    
                  
                  ],
                ),
              ),

              //Appearance title
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Appearance: ",
                style: TextStyle(
                  color:Colors.white,
                  fontSize:22,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //appearance tabel data
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    //height
                    TableRow(
                      children: 
                      [
                        const Text(
                          "Height: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          height,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                  
                  //weight
                    TableRow(
                      children: 
                      [
                        const Text(
                          "Weight: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          weight,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                  
                    //bodyType
                    TableRow(
                      children: 
                      [
                        const Text(
                          "Body Type: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          bodyType,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                  ],),
              ),
              
              //life style title
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Life Style: ",
                style: TextStyle(
                  color:Colors.white,
                  fontSize:22,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //life style table data
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [
                      //drink
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Drink: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          drink,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                      //smoke
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Smoke: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          smoke,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //martial status
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Martial Status: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          materialStatus,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //have children
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Have Children: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          haveChildren,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //children number
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Children number",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          noOfChildren,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //profession
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Profession: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          profession,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //employment status 
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Employment Status: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          employmentStatus,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //income
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Income: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          income,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                  
                    //living situation
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Living Situation: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          livingSituation,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //willing to relocate
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Willing To Relocate: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          willingToRelocate,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                  
                    //looking for
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Looking For: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          lookingForInaPartner,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                  
                  
                  ],
                ),
              ),
            
              //background-cultural values title
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Background and Cultural values: ",
                style: TextStyle(
                  color:Colors.white,
                  fontSize:22,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //background-cultural values table data
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [
                      //nationality
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Nationality: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          nationality,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //education
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Education: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          education,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //language spoken
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Language Spoken: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          languageSpoken,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                  
                    //religion
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Religion: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          religion,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //ethnicity
                      TableRow(
                      children: 
                      [
                        const Text(
                          "Ethnicity: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          ethnicity,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  
                    //extra tablerow for space
                    const TableRow(
                      children: 
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),
                  ],
                ),
              ),
            
            ],),
        ),
      ),
    );
  }
}