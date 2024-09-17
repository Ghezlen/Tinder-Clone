import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tinder_clone/global.dart';
import 'package:tinder_clone/homeScreen/home_screen.dart';
import 'package:tinder_clone/widgets/custom_text_field_widget.dart';
import 'package:get/get.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {

  bool uploading = false, next = false;
  final List<File>_image=[];
  List<String> urlList=[];
  double val=0;

    //personal info

  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();
  TextEditingController nameTextEditingController= TextEditingController();
  TextEditingController ageTextEditingController= TextEditingController();
  TextEditingController phoneNoTextEditingController= TextEditingController();
  TextEditingController cityTextEditingController= TextEditingController();
  TextEditingController countryTextEditingController= TextEditingController();
  TextEditingController profileHeadingTextEditingController= TextEditingController();
  TextEditingController lookingForInPartnerTextEditingController= TextEditingController();
//appearance

  TextEditingController heightTextEditingController= TextEditingController();
  TextEditingController weightTextEditingController= TextEditingController();
  TextEditingController bodyTypeTextEditingController= TextEditingController();

//life Style 

  TextEditingController drinkTextEditingController= TextEditingController();
  TextEditingController smokeTextEditingController= TextEditingController();
  TextEditingController martialStatusTextEditingController= TextEditingController();
  TextEditingController haveChildrenTextEditingController= TextEditingController();
  TextEditingController noChildrenTextEditingController= TextEditingController();
  TextEditingController professionTextEditingController= TextEditingController();
  TextEditingController employmentStatusTextEditingController= TextEditingController();
  TextEditingController incomeTextEditingController= TextEditingController();
  TextEditingController livingSituationTextEditingController= TextEditingController();
  TextEditingController willingToRelocateTextEditingController= TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController= TextEditingController();

//background - cultural values

  TextEditingController nationalityTextEditingController= TextEditingController();
  TextEditingController educationTextEditingController= TextEditingController();
  TextEditingController languageSpokenTextEditingController= TextEditingController();
  TextEditingController religionTextEditingController= TextEditingController();
  TextEditingController ethnicityTextEditingController= TextEditingController();

  // personal info
         
          String name ='';
          String age ='';
          String phoneNo ='';
          String city ='';
          String country ='';
          String profileHeading ='';
          String lookingForInaPartner ='';

          // appearance
          String height ='';
          String weight ='';
          String bodyType ='';

          // lifestyle
          String martialStatus ='';
          String employmentStatus ='';
          String drink ='';
          String smoke ='';
          String haveChildren ='';
          String noOfChildren ='';
          String profession ='';
          String income ='';
          String livingSituation ='';
          String willingToRelocate ='';
          String relationshipYouAreLookingFor='';
          // background-cultural values
          String nationality ='';
          String education ='';
          String languageSpoken='';
          String religion ='';
          String ethnicity='';

  chooseImage()async
  {
    XFile? pickedFile = await ImagePicker().pickImage(source:ImageSource.gallery);

    setState(() {
      _image.add(File(pickedFile!.path));
    });
  }

  uploadImages() async
  {
    int i = 1;
    for (var img in _image)
    {
      setState(() {
        val = i/ _image.length;
      });

      var refImages= FirebaseStorage.instance
      .ref()
      .child("images/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg");

      await refImages.putFile(img)
      .whenComplete(()async
      {
        await refImages.getDownloadURL()
        .then((urlImage)
        {
          urlsList.add(urlImage);

          i++;
        });
      });
    }
  }


  retrieveUserData() async{
    await FirebaseFirestore.instance
    .collection("users")
    .doc(currentUserID)
    .get()
    .then((snapshot)
    {
      if(snapshot.exists)
      {
        setState(() {
          
          //personal info
           name =snapshot.data()!['name'];
           nameTextEditingController.text = name;
           age =snapshot.data()!['age'].toString();
           ageTextEditingController.text =age;
           phoneNo =snapshot.data()!['number'];
           phoneNoTextEditingController.text = phoneNo ;
           city =snapshot.data()!['city'];
           cityTextEditingController.text = city;
           country =snapshot.data()!['country'];
           countryTextEditingController.text = country ;
           profileHeading =snapshot.data()!['profileHeading'];
           profileHeadingTextEditingController.text =profileHeading ;
           lookingForInaPartner =snapshot.data()!['lookingForInaPartner'];
           lookingForInPartnerTextEditingController.text = lookingForInaPartner;
           
           // appearance
          height =snapshot.data()!['height'];
          heightTextEditingController.text =height ;
          weight =snapshot.data()!['weight'];
          weightTextEditingController.text =weight ;
          bodyType=snapshot.data()!['bodyType'];
          bodyTypeTextEditingController.text = bodyType;

          // lifestyle
          martialStatus =snapshot.data()!['martialStatus'];
          martialStatusTextEditingController.text =martialStatus ;
          employmentStatus =snapshot.data()!['employmentStatus'];
          employmentStatusTextEditingController.text =employmentStatus ;
          drink =snapshot.data()!['drink'];
          drinkTextEditingController.text =drink ;
          smoke =snapshot.data()!['smoke'];
          smokeTextEditingController.text = smoke;
          haveChildren =snapshot.data()!['haveChildren'];
          haveChildrenTextEditingController.text = haveChildren;
          noOfChildren =snapshot.data()!['noOfChildren'];
          noChildrenTextEditingController.text = noOfChildren;
          profession =snapshot.data()!['profession'];
          professionTextEditingController.text = profession;
          income =snapshot.data()!['income'];
          incomeTextEditingController.text =income ;
          livingSituation =snapshot.data()!['livingSituation'];
          livingSituationTextEditingController.text = livingSituation;
          willingToRelocate =snapshot.data()!['willingToRelocate'];
          willingToRelocateTextEditingController.text =willingToRelocate ;
          relationshipYouAreLookingFor=snapshot.data()!['relationshipYouAreLookingFor'];
          relationshipYouAreLookingForTextEditingController.text = relationshipYouAreLookingFor;
          // background-cultural values
          nationality =snapshot.data()!['nationality'];
          nationalityTextEditingController.text = nationality;
          education =snapshot.data()!['education'];
          educationTextEditingController.text = education;
          languageSpoken=snapshot.data()!['languageSpoken'];
          languageSpokenTextEditingController.text = languageSpoken;
          religion =snapshot.data()!['religion'];
          religionTextEditingController.text = religion;
          ethnicity=snapshot.data()!['ethnicity'];
          ethnicityTextEditingController.text =ethnicity ;

        });
      }
    });
  }
  
  updateUserDataToFirestoreDatabase(
      // personal info
          String name, String age, String phoneNo, 
          String city, String country, String profileHeading, 
          String lookingForInaPartner, 

          // appearance
          String height, String weight, String bodyType, 

          // lifestyle
          String martialStatus, String employmentStatus, 
          String drink, String smoke, String haveChildren, 
          String noOfChildren, String profession, 
          String income, String livingSituation, 
          String willingToRelocate, String relationshipYouAreLookingFor,

          // background-cultural values
          String nationality, String education, 
          String languageSpoken, String religion, 
          String ethnicity) async
  {
    showDialog(
                context: context,
                builder: (context)
                {
                  return const AlertDialog(
                    content: SizedBox(
                      height: 200,
                      child: const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 10,
                            ),
                            Text("uploading images..."),
                          ],
                        ) ,
                        ),
                    ),
                  );
                }
              );

              await uploadImages();

              await FirebaseFirestore.instance
              .collection("users")
              .doc(currentUserID)
              .update(
                {
                  //personal info
                  'name': name,
                  'age': int.parse(age),
                  'phoneNo': phoneNo,
                  'city': city,
                  'country': country,
                  'profileHeading': profileHeading,
                  'lookingForInaPartner': lookingForInaPartner,

                  //appearance
                  'height': height,
                  'weight': weight,
                  'bodyType': bodyType,

                  //lifestyle
                  'drink': drink,
                  'smoke': smoke,
                  'martialStatus': martialStatus,
                  'haveChildren': haveChildren,
                  'noOfChildren': noOfChildren,
                  'profession': profession,
                  'employmentStatus': employmentStatus,
                  'income': income,
                  'livingSituation': livingSituation,
                  'willingToRelocate': willingToRelocate,
                  'relationshipYouAreLookingFor': relationshipYouAreLookingFor,

                  //background - cultural values
                  'nationality': nationality,
                  'education': education,
                  'languageSpoken': languageSpoken,
                  'religion': religion,
                  'ethnicity': ethnicity,

                  //images
                  'urlImage1':urlList[0].toString(),
                  'urlImage2':urlList[1].toString(),
                  'urlImage3':urlList[2].toString(),
                  'urlImage4':urlList[3].toString(),
                  'urlImage5':urlList[4].toString(),
                });
              
              Get.snackbar("Updated", "your account has been updated successfully");
              Get.to(HomeScreen());

              setState(() {
                uploading = false;
                _image.clear();
                urlList.clear();
              });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          next? "Profile Information": "Choose 5 Images",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [
          next
          ? Container()
          : IconButton(
            onPressed: ()
            {
              if(_image.length == 5)
              {
                setState(() {
                  uploading = true;
                  next = true;
                });
              }
              else
              {
                Get.snackbar("5 Images", "Please choose 5 images");
              }
            },
            icon: const Icon(Icons.navigate_next_outlined, size: 36,),
          ),
        ],
      ),
      body: next
      ? SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(30) ,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const SizedBox(
                height: 2,
              ),

              //personal info
              const Text(
                "Personal Info:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              //name
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: nameTextEditingController,
                labelText: "name",
                iconData: Icons.person_outline,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),
              
              //age
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: ageTextEditingController,
                labelText: "Age",
                iconData: Icons.numbers,
                isObscure: false,
              ),
              ),

              const SizedBox(
                height: 24,
              ),

              //phoneNo
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: phoneNoTextEditingController,
                labelText: "Phone",
                iconData: Icons.phone,
                isObscure: false,
              ),
              ),

              const SizedBox(
                height: 24,
              ),

              //city
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: cityTextEditingController,
                labelText: "City",
                iconData: Icons.location_city,
                isObscure: false,
              ),
              ),

              const SizedBox(
                height: 24,
              ),

              //country
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: countryTextEditingController,
                labelText: "country",
                iconData: Icons.location_city,
                isObscure: false,
              ),
              ),

              const SizedBox(
                height: 24,
              ),

              //profileHeading
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: profileHeadingTextEditingController,
                labelText: "Profile Heading",
                iconData: Icons.text_fields,
                isObscure: false,
              ),
              ),

              const SizedBox(
                height: 24,
              ),
            
              //lookingForInPartner
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: lookingForInPartnerTextEditingController,
                labelText: "What you're looking for in a partner",
                iconData: Icons.face,
                isObscure: false,
              ),
              ),

              const SizedBox(
                height: 24,
              ),




                //Appearance
              const Text(
                "Appearance",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),
              
              //height
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: heightTextEditingController,
                labelText: "Height",
                iconData: Icons.insert_chart,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //weight
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: weightTextEditingController,
                labelText: "Weight",
                iconData: Icons.table_chart,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //body type
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: bodyTypeTextEditingController,
                labelText: "Body Type",
                iconData: Icons.type_specimen,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),
            
            
            
             //Life style
              const Text(
                "Life Style",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),
              
              //drink
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: drinkTextEditingController,
                labelText: "Drink",
                iconData: Icons.local_drink_outlined,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //smoke
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: smokeTextEditingController,
                labelText: "Smoke",
                iconData: Icons.smoking_rooms,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //materialStatus
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: martialStatusTextEditingController,
                labelText: "Material Status",
                iconData: CupertinoIcons.person_2,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),
            
             //havechildren
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: haveChildrenTextEditingController,
                labelText: "Do you have children?",
                iconData: CupertinoIcons.person_3,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //noChildren
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: noChildrenTextEditingController,
                labelText: "Number of children",
                iconData: CupertinoIcons.person_3_fill,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),
               
               //profession
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: professionTextEditingController,
                labelText: "Profession",
                iconData: Icons.business_center,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //employmentStatus
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: employmentStatusTextEditingController,
                labelText: "Employment Status",
                iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),
               
               //income
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: incomeTextEditingController,
                labelText: "Income",
                iconData: CupertinoIcons.money_dollar_circle,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //LivingSituation
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: livingSituationTextEditingController,
                labelText: "Living situation",
                iconData: CupertinoIcons.person_2_square_stack,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),
               
               //willing to relocate
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: willingToRelocateTextEditingController,
                labelText: "Are you willing to relocate?",
                iconData: CupertinoIcons.person_2,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //relationship you're looking for
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: relationshipYouAreLookingForTextEditingController,
                labelText: "What relationship are you looking for?",
                iconData: CupertinoIcons.person_2,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),
            
            
               //Cultural Values
              const Text(
                "Cultural Values",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            
              const SizedBox(
                height: 24,
              ),

              //nationality
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: nationalityTextEditingController,
                labelText: "Nationality",
                iconData: CupertinoIcons.flag_circle,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),
               
               //education
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: educationTextEditingController,
                labelText: "Education",
                iconData: Icons.history_edu,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //Languagespoken
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: languageSpokenTextEditingController,
                labelText: "Language Spoken",
                iconData: CupertinoIcons.person_badge_plus_fill,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),
               
               //religion
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: religionTextEditingController,
                labelText: "Religion",
                iconData: CupertinoIcons.checkmark_seal_fill,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //ethnicity
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: ethnicityTextEditingController,
                labelText: "Ethnicity",
                iconData: CupertinoIcons.eye,
                isObscure: false,
              ),
              ),
              
              const SizedBox(
                height: 30,
              ),
            

                //create account button
              Container(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                decoration: const BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12),)),
                child: InkWell(
                  onTap: () async
                  {
                   if(
                      //personal info
                      nameTextEditingController.text.trim().isNotEmpty 
                      && ageTextEditingController.text.trim().isNotEmpty 
                      && phoneNoTextEditingController.text.trim().isNotEmpty 
                      && cityTextEditingController.text.trim().isNotEmpty
                      && countryTextEditingController.text.trim().isNotEmpty
                      && profileHeadingTextEditingController.text.trim().isNotEmpty
                      && lookingForInPartnerTextEditingController.text.trim().isNotEmpty

                      //appearance
                      && heightTextEditingController.text.trim().isNotEmpty
                      && weightTextEditingController.text.trim().isNotEmpty
                      && bodyTypeTextEditingController.text.trim().isNotEmpty

                      //life style
                      && drinkTextEditingController.text.trim().isNotEmpty
                      && smokeTextEditingController.text.trim().isNotEmpty
                      && martialStatusTextEditingController.text.trim().isNotEmpty
                      && haveChildrenTextEditingController.text.trim().isNotEmpty
                      && noChildrenTextEditingController.text.trim().isNotEmpty
                      && professionTextEditingController.text.trim().isNotEmpty
                      && employmentStatusTextEditingController.text.trim().isNotEmpty
                      && incomeTextEditingController.text.trim().isNotEmpty
                      && livingSituationTextEditingController.text.trim().isNotEmpty
                      && willingToRelocateTextEditingController.text.trim().isNotEmpty
                      && relationshipYouAreLookingForTextEditingController.text.trim().isNotEmpty

                      //background - cultural values
                      && nationalityTextEditingController.text.trim().isNotEmpty
                      && educationTextEditingController.text.trim().isNotEmpty
                      && languageSpokenTextEditingController.text.trim().isNotEmpty
                      && religionTextEditingController.text.trim().isNotEmpty
                      && ethnicityTextEditingController.text.trim().isNotEmpty)
                      {
                        
                        _image.length>0?
                        await updateUserDataToFirestoreDatabase(
                          // personal info
                          nameTextEditingController.text.trim(),
                          ageTextEditingController.text.trim(),
                          phoneNoTextEditingController.text.trim(),
                          cityTextEditingController.text.trim(),
                          countryTextEditingController.text.trim(),
                          profileHeadingTextEditingController.text.trim(),
                          lookingForInPartnerTextEditingController.text.trim(),

                          // appearance
                          heightTextEditingController.text.trim(),
                          weightTextEditingController.text.trim(),
                          bodyTypeTextEditingController.text.trim(),

                          // lifestyle
                          martialStatusTextEditingController.text.trim(),
                          employmentStatusTextEditingController.text.trim(),
                          drinkTextEditingController.text.trim(),
                          smokeTextEditingController.text.trim(),
                          haveChildrenTextEditingController.text.trim(),
                          noChildrenTextEditingController.text.trim(),
                          professionTextEditingController.text.trim(),
                          incomeTextEditingController.text.trim(),
                          livingSituationTextEditingController.text.trim(),
                          willingToRelocateTextEditingController.text.trim(),
                          relationshipYouAreLookingForTextEditingController.text.trim(),

                          // background-cultural values
                          nationalityTextEditingController.text.trim(),
                          educationTextEditingController.text.trim(),
                          languageSpokenTextEditingController.text.trim(),
                          religionTextEditingController.text.trim(),
                          ethnicityTextEditingController.text.trim()
                        ): null;
                      }
                      else 
                      {
                        Get.snackbar("Empty fields", "please fill out the complete sign up form");

                      }
                  },
                  child: const Center(
                    child: Text("Update",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ),


                const SizedBox(
                height: 16,
              ),


            ],
          ),
          ),
      )
      :
      Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            child: GridView.builder(
              itemCount: _image.length+1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                ), 
                itemBuilder: (context, index){
                  return index == 0
                  ? Container(
                    color: Colors.white30,
                    child: Center(
                      child: IconButton(
                        onPressed: ()
                        {
                          if(_image.length<5)
                          {
                            !uploading? chooseImage() : null;
                          }
                          else
                          {
                            setState(() {
                              uploading == true;
                            });

                            Get.snackbar("5 Images Chosen", "5 images already selected");
                          }
                          
                        },
                        icon: const Icon(Icons.add),
                      ),),
                  )
                  : Container(
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(
                        _image[index-1],
                      ),
                      fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                ),
          )
        ],
      ),
    );
  }
}