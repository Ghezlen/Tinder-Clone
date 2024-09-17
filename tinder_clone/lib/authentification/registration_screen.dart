//import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinder_clone/controllers/authentification_controller.dart';
//import 'package:flutter/widgets.dart';
import 'package:tinder_clone/widgets/custom_text_field_widget.dart';
import 'package:get/get.dart';



class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> 
{
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

  bool showProgressBar = false;


  var authentificationController = AuthentificationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 100,
              ),
              
              //create account 
              const Text(
                "Create Account",
                style:TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),

              ),

              const SizedBox(
                height: 10,
              ),
              
              //to get started
              const Text(
                "to get started Now.",
                style:TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              authentificationController.imageFile == null?
              //choose image circle avatar
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  "images/avatar2.png"
                ),
                backgroundColor: Colors.black,
              ) : 
              Container(
                width:180,
                height:180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: FileImage(
                      File(
                        authentificationController.imageFile!.path,

                      ),
                    ),
                  ),
                  
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed:() async
                    {
                      await authentificationController.pickImageFileFromGallery();

                      setState(() {
                        authentificationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                      size:30,
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),

                    IconButton(
                    onPressed:() 
                    {
                      authentificationController.pickImageFileFromPhoneCamera();

                      setState(() {
                        authentificationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                      size: 30,
                      ),
                    ),
                ],
              ),
              
            
            
              const SizedBox(
                height: 30,
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

               //email
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: emailTextEditingController,
                labelText: "Email",
                iconData: Icons.email_outlined,
                isObscure: false,
              ),
              ),

              const SizedBox(
                height: 24,
              ),

              //password
              SizedBox(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                child: CustomTextFieldWidget(
                editingController: passwordTextEditingController,
                labelText: "password",
                iconData: Icons.lock_outline,
                isObscure: true,
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
                    if(authentificationController.imageFile != null)
                    {
                      if(
                      //personal info
                      
                      emailTextEditingController.text.trim().isNotEmpty 
                      && passwordTextEditingController.text.trim().isNotEmpty
                      && nameTextEditingController.text.trim().isNotEmpty 
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
                        setState(() {
                          showProgressBar = true;
                        });

                        await authentificationController.createNewUserAccount(
                          // personal info
                          authentificationController.profileImage!,
                          emailTextEditingController.text.trim(),
                          passwordTextEditingController.text.trim(),
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
                        );

                        setState(() {
                          showProgressBar = false;
                          authentificationController.imageFile=null; 
                        });  

                         
                          
                      }
                      else 
                      {
                        Get.snackbar("Empty fields", "please fill out the complete sign up form");

                      }
                    }
                    else 
                    {
                      Get.snackbar("image File Missing", "please pick image from Gallery or capture with Camera");
                    }

                  },
                  child: const Center(
                    child: Text("create account",
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


                //already have an account login here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize:16,
                        color: Colors.grey,
                      ),
                      ),
                    InkWell(
                      onTap: ()
                      {
                        Get.back();
                      },
                      child: const Text(
                        "Login Here! ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                showProgressBar == true
                  ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                  )
                  :Container(),

                const SizedBox(
                height: 16,
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}