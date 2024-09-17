import 'package:flutter/material.dart';
import 'package:tinder_clone/authentification/registration_screen.dart';
import 'package:tinder_clone/controllers/authentification_controller.dart';
import 'package:tinder_clone/homeScreen/home_screen.dart';
import '../widgets/custom_text_field_widget.dart';
import 'package:get/get.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();
  bool showProgressBar=false;
  var controllerAuth = AuthentificationController.authController;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 120,
              ),

              Image.asset(
                "images/logo2.png",
                width:180,
              ), //Image.asset

              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "Login Now to find your best match",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                height: 28,
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
                height: 30,
              ),
              
              //login_button
              Container(
                width: MediaQuery.of(context).size.width -36,
                height:55,
                decoration: const BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
                child: InkWell(
                  onTap: () async
                  {
                    if(emailTextEditingController.text.trim().isNotEmpty
                    && passwordTextEditingController.text.trim().isNotEmpty)
                    {
                      setState(() {
                        showProgressBar=true;
                      });
                    
                      await controllerAuth.loginUser(
                        emailTextEditingController.text.trim(),
                        passwordTextEditingController.text.trim(),
                        );

                       setState(() {
                        showProgressBar=false;
                      });
                    }
                    else
                    {
                      Get.snackbar("Email or password is missing", "please fill all fields.");
                      Get.to(HomeScreen());
                    }
                  },
                  child: const Center(
                    child: Text("Login",
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


                //don't have an account create here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account? ",
                      style: TextStyle(
                        fontSize:16,
                        color: Colors.grey,
                      ),
                      ),
                    InkWell(
                      onTap: ()
                      {
                        Get.to(const RegistrationScreen());
                      },
                      child: const Text(
                        "Create Here! ",
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
