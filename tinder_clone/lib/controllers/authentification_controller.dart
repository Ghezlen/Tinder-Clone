import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:tinder_clone/authentification/login_screen.dart';
import 'package:tinder_clone/homeScreen/home_screen.dart';
import 'package:tinder_clone/models/person.dart' as personModel;
import 'package:firebase_auth/firebase_auth.dart'; // For authentication
import 'package:firebase_storage/firebase_storage.dart'; // For storage
import 'package:cloud_firestore/cloud_firestore.dart'; // For Firestore database



class AuthentificationController extends GetxController{
  static AuthentificationController authController = Get.find();

  late Rx<User?> firebaseCurrentUser;

  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;

  pickImageFileFromGallery() async
  {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile != null){
      Get.snackbar("profile Image", "you have successfully picked your profile image from gallery. ");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  pickImageFileFromPhoneCamera() async
  {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null){
      Get.snackbar("profile Image", "you have successfully took your profile image. ");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<String> uploadImageToStorage(File imageFile) async 
        {
          Reference referenceStorage = FirebaseStorage.instance.ref()
          .child("Profile Images")
          .child(FirebaseAuth.instance.currentUser!.uid);

          UploadTask task = referenceStorage.putFile(imageFile);
          TaskSnapshot snapshot = await task;

          String downloadURLOfImage = await snapshot.ref.getDownloadURL();


          return downloadURLOfImage;
        }
          createNewUserAccount(
          // personal info
          File imageProfile, String email, String password, 
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
          String ethnicity,)async 
          {
              try
              {
                //1. authenticate user and create User with Email and Password
                UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email, 
                  password: password
                  );

                //2. upload image to storage
                String urlOfDownloadedImage = await uploadImageToStorage(imageProfile);

                //3. save user info to firestore database
                personModel.Person personInstance = personModel.Person(

                  //personal info
                  uid: FirebaseAuth.instance.currentUser!.uid,
                  imageProfile: urlOfDownloadedImage,
                  email: email,
                  password: password,
                  name: name,
                  age: int.parse(age),
                  phoneNo: phoneNo,
                  city: city,
                  country: country,
                  profileHeading: profileHeading,
                  lookingForInaPartner: lookingForInaPartner,
                  publishedDateTime: DateTime.now().millisecondsSinceEpoch,

                  //appearance
                  height: height,
                  weight: weight,
                  bodyType: bodyType,

                  //lifestyle
                  drink: drink,
                  smoke: smoke,
                  martialStatus: martialStatus,
                  haveChildren: haveChildren,
                  noOfChildren: noOfChildren,
                  profession: profession,
                  employmentStatus: employmentStatus,
                  income: income,
                  livingSituation: livingSituation,
                  willingToRelocate: willingToRelocate,
                  relationshipYouAreLookingFor: relationshipYouAreLookingFor,

                  //background - cultural values
                  nationality: nationality,
                  education: education,
                  languageSpoken: languageSpoken,
                  religion: religion,
                  ethnicity: ethnicity,

                );

        await FirebaseFirestore.instance.collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(personInstance.toJson());

        Get.snackbar("account Created","congratulations your account has been created" );
        Get.to(const HomeScreen());
      }
      catch(errorMsg)
      {
        Get.snackbar("Account Creation Unsuccessful", "Error occured: $errorMsg");
      }
      
    }
    
  loginUser(String emailUser, String passwordUser)async
  {
    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailUser, 
        password: passwordUser,
        );
        Get.snackbar("login Successful", "you're logged in successfully.");
        Get.to(HomeScreen());

    }
    catch(errorMsg)
    {
      Get.snackbar("Login Unseccessful", "Error occured : $errorMsg" );
    }
  }

  checkIfUserIsLoggedIn(User? currentUser)
  {
    if(currentUser == null)
    {
      Get.to(LoginScreen());
    }
    else
    {
      Get.to(HomeScreen());
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    firebaseCurrentUser=Rx<User?>(FirebaseAuth.instance.currentUser);
    firebaseCurrentUser.bindStream(FirebaseAuth.instance.authStateChanges());

    ever(firebaseCurrentUser, checkIfUserIsLoggedIn);
  }
}