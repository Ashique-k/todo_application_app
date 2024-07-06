import 'package:flutter/material.dart';
import 'package:todo_application/screens/reg_page.dart';

import 'bottom_nav.dart';
class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20,left: 10),

                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Welcome back",style: TextStyle(fontSize: 12),),
                Text("to",style: TextStyle(fontSize: 12),),
                Text("TODO APP",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {   // Validation Logic
                        return 'required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {   // Validation Logic
                        return 'required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter password",
                        hintStyle: TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        )
                    ),
                  ),
                ),
                TextButton(onPressed: (){}, child: Text("Forgot Password")),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(onPressed: (){
                    if(_formkey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BOT_NAV()),
                      );
                    };


                  }, child: Text("Sign in",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?"),
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const REG_PAGE()),
                      );
                    }, child: Text("Sign Up"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
