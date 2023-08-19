import 'package:flutter/material.dart';
import 'package:qualif_flutter/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isAgree = false;

  // controller
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // error msg
  String? usernameErrorMsg;
  String? passwordErrorMsg;

  void resetError(){
    setState(() {
      usernameErrorMsg = null;
      passwordErrorMsg = null;
    });
  }

  void validation(){
    resetError();
    String username = usernameController.text;
    String password = passwordController.text;

    if(username.isEmpty){
      setState(() {
        usernameErrorMsg = "Username cannot be empty";
      });
       showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Username cannot be empty"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }

    if(username.length > 16){
      setState(() {
        usernameErrorMsg = "Username must be less than 16 characters long";
      });
       showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Username must be less than 16 characters long"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }

    if(password.isEmpty){
      setState(() {
        passwordErrorMsg = "Password cannot be empty";
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Password cannot be empty"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }
    
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
        builder: (context){
          return MainPage(username: username);
        }
      ),
      (route) => false
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 36, 44, 1),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              "assets/bg.jpg"
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.15),
                BlendMode.dstATop,
              )
            )
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            // const Text(
            //   "Login",
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            TextField(
              controller: usernameController,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(  
                hintText: "Username",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                fillColor: Color.fromRGBO(46, 59, 73, 1),
                filled: true,
                border: InputBorder.none
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              style: const TextStyle(
                color: Colors.white,
              ),
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                fillColor: Color.fromRGBO(46, 59, 73, 1),
                filled: true,
                border: InputBorder.none
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Remember Me",
                style: TextStyle(
                  color: isAgree ? Colors.white : Colors.grey
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: isAgree, 
              onChanged: (value) {
                setState(() {
                  isAgree = value!;
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: validation, 
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}