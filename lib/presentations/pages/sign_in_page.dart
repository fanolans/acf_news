import 'package:acf_news/presentations/pages/home_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  static const routeName = '/signIn';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Image.asset(
                  'assets/images/Lovepik_com-450121913- a trendy flat illustration of login password.png'),
              Text("Login"),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    labelText: "E-mail"),
              ),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outlined),
                    labelText: "Password"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Forgot Password"),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, HomePage.routeName);
                    },
                    child: const Text("Login"),
                  ),
                ),
              ),
              Text("Or"),
              Container(
                width: MediaQuery.of(context).size.width * 0.70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/icons8-google-36(-ldpi).png"),
                        const Text(
                          "Login with Google",
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Text("Don't have an account?"),
                  InkWell(
                    onTap: () {},
                    child: Text("Sign up"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
