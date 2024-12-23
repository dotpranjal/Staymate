import 'package:flutter/material.dart';
import 'package:tinder/services/my_button.dart';
import 'package:tinder/services/mytextfield.dart';
import 'package:tinder/services/square_tile.dart';

class LoginService extends StatelessWidget {
  LoginService({super.key});

  //text editing controllers

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //signin user methods

  void signUserIn() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          
                const SizedBox(height: 50),
          
                //logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
          
                const SizedBox(height: 50),
                //hello how've you been
          
                Text(
                  "Welcome back you\'ve been missed!",
                  style: TextStyle(color: Colors.grey[700],
                  fontSize: 16,
                  ),
                  ),
                
                const SizedBox(height: 25),
            
                //username
          
                Mytextfield(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
            
          
                const SizedBox(height: 10,),
                //password
                Mytextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
          
                ),
          
                const SizedBox(height: 10,),
            
                //forgot passowrd
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                         style: TextStyle(color: Colors.grey[600]),
                        ),
                    ],
                  ),
                ),
          
          
                const SizedBox(height: 25,),
          
                MyButton(
                  onTap: signUserIn,
                ),
          
          
                const SizedBox(height: 50,),
          
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                  
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                  
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                          ),
                      ),
                  
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                  
                    ],
                  ),
                ),
                //google + apple signin
                const SizedBox(height: 50,),
          
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    //google button
                    SquareTile(imagePath: 'lib/assets/google.png'),
          
                    SizedBox(width: 25,),
                    //apple button
                    SquareTile(imagePath: 'lib/assets/apple.png'),
                  ],
                ),
          
                const SizedBox(height: 50,),
          
          
                //not a memeber sign up.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?', style: TextStyle(color: Colors.grey[700]),),
                    const SizedBox(width: 4,),
                    Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                  ],
                )
              ],),
          ),
        ),
      ),
    );
  }
}