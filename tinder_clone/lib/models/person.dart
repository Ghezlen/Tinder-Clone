import 'package:cloud_firestore/cloud_firestore.dart';


class Person
{
  //personal info
  String? uid;
  String? imageProfile;
  String? email;
  String? password;
  String? name;
  int? age;
  String? phoneNo;
  String? city;
  String? country;
  String? profileHeading;
  String? lookingForInaPartner;
  int? publishedDateTime;

  //appearance
  String? height;
  String? weight;
  String? bodyType;

  //life style
  String? drink;
  String? smoke;
  String? martialStatus;
  String? haveChildren;
  String? noOfChildren;
  String? profession;
  String? employmentStatus;
  String? income;
  String? livingSituation;
  String? willingToRelocate;
  String? relationshipYouAreLookingFor;

  //background-cultural values
  String? nationality;
  String? education;
  String? languageSpoken;
  String? religion;
  String? ethnicity;

  Person({
    //personal info
    this.uid,
    this.imageProfile,
    email,
    password,
    this.name,
    this.age,
    this.phoneNo,
    this.city,
    this.country,
    this.profileHeading,
    this.lookingForInaPartner,
    this.publishedDateTime,

    //appearance
    this.height,
    this.weight,
    this.bodyType,

    //life style
    this.drink,
    this.smoke,
    this.martialStatus,
    this.haveChildren,
    this.noOfChildren,
    this.profession,
    this.employmentStatus,
    this.income,
    this.livingSituation,
    this.willingToRelocate,
    this.relationshipYouAreLookingFor,

    //background_values
    this.nationality,
    this.education,
    this.languageSpoken,
    this.religion,
    this.ethnicity,
  
  });

  static Person fromdataSnapshot(DocumentSnapshot snapshot)
  {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Person(
      //personal info
      uid: dataSnapshot["uid"],
      imageProfile: dataSnapshot["imageProfile"],
      email: dataSnapshot["email"],
      password: dataSnapshot["password"],
      name: dataSnapshot["name"],
      age: dataSnapshot["age"],
      phoneNo: dataSnapshot["phoneNo"],
      city: dataSnapshot["city"],
      country: dataSnapshot["country"],
      profileHeading: dataSnapshot["profileHeading"],
      lookingForInaPartner: dataSnapshot["lookingForInaPartner"],
      publishedDateTime: dataSnapshot["publishedDateTime"],
      height: dataSnapshot["height"],
      weight: dataSnapshot["weight"],
      bodyType: dataSnapshot["bodyType"],
      drink: dataSnapshot["drink"],
      smoke: dataSnapshot["smoke"],
      martialStatus: dataSnapshot["martialStatus"],
      haveChildren: dataSnapshot["haveChildren"],
      noOfChildren: dataSnapshot["noOfChildren"],
      profession: dataSnapshot["profession"],
      income: dataSnapshot["income"],
      livingSituation: dataSnapshot["livingSituation"],
      willingToRelocate: dataSnapshot["willingToRelocate"],
      relationshipYouAreLookingFor: dataSnapshot["relationshipYouAreLookingFor"],
      nationality: dataSnapshot["nationality"],
      education: dataSnapshot["education"],
      languageSpoken: dataSnapshot["languageSpoken"],
      religion: dataSnapshot["religion"],
      ethnicity: dataSnapshot["ethnicity"],
      
    );
  }

  Map<String, dynamic> toJson()=>
  {
    "uid": uid,
    "imageProfile": imageProfile,
    "email":email,
    "password": password,
    "name":name,
    "age": age,
    "phoneNo":phoneNo,
    "city": city,
    "country":country,
    "profileHeading": profileHeading,
    "lookingForInPartner":lookingForInaPartner,
    "publishedDateTime": publishedDateTime,
    "height":height,
    "weight": weight,
    "bodyType":bodyType,
    "drink": drink,
    "smoke":smoke,
    "martialStatus": martialStatus,
    "haveChildren":haveChildren,
    "noOfChildren": noOfChildren,
    "profession":profession,
    "employmentStatus": employmentStatus,
    "income":income,
    "livingSituation": livingSituation,
    "willingToRelocate":willingToRelocate,
    "relationshipYouAreLookingFor": relationshipYouAreLookingFor,
    "nationality":nationality,
    "education": education,
    "languageSpoken":languageSpoken,
    "religion": religion,
    "ethnicity":ethnicity,


  };

}
