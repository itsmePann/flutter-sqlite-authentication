import 'package:authentication/models/model.dart';
import 'package:authentication/service/db_helper.dart';
import 'package:authentication/ui/loginpage.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _LogingpageState();
}

class _LogingpageState extends State<Registerpage> {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final fullname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullname.dispose();
    username.dispose();
    password.dispose();
  }

  bool isObscure1 = true;
  bool isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(width: double.infinity, color: Colors.teal),
          Positioned(
            top: 90,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: SizedBox(
                      height: 180,
                      width: 200,
                      child: Container(
                        color: Colors.grey,
                        child: ClipRRect(
                          child: Image.asset(
                            "asset/image1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 2),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 20,
                      bottom: 25,
                    ),
                    child: Form(
                      key: keyForm,
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Let's Get Started !",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: const Color.fromARGB(255, 3, 102, 92),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Create an account to get all features",
                                style: TextStyle(
                                  color: Colors.grey,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: TextFormField(
                                  controller: fullname,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Kolom full name harus disi";
                                    }
                                    return null;
                                  },
                                  // controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your full name...",
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Icon(Icons.person),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 3, 102, 92),
                                        style: BorderStyle.solid,
                                        width: 1.4,
                                      ),
                                      // borderSide: BorderSide.none
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 1.4,
                                        color: Color.fromARGB(255, 3, 102, 92),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: TextFormField(
                                  controller: username,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Kolom username wajib diisi";
                                    }
                                   if (!RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$').hasMatch(value)) {
                                     
                                   }
                                    return null;
                                  },
                                  // controller: usernameController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your username...",
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Icon(Icons.email),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 3, 102, 92),
                                        style: BorderStyle.solid,
                                        width: 1.4,
                                      ),
                                      // borderSide: BorderSide.none
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 1.4,
                                        color: Color.fromARGB(255, 3, 102, 92),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: TextFormField(
                                  controller: password,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Kolom password harus diisi";
                                    }
                                    return null;
                                  },
                                  // controller: passwordController,
                                  obscuringCharacter: "*",
                                  obscureText: isObscure1,
                                  decoration: InputDecoration(
                                    hintText: "Password..",
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isObscure1 = !isObscure1;
                                          });
                                        },
                                        icon: isObscure1
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility),
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Icon(Icons.lock),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 3, 102, 92),
                                        style: BorderStyle.solid,
                                        width: 1.4,
                                      ),
                                      // borderSide: BorderSide.none
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 3, 102, 92),
                                        width: 1.4,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Kolom confirm password harus diisi";
                                    }
                                    if (value != password.text) {
                                      return "Password tidak sesuai";
                                    }
                                    return null;
                                  },
                                  obscureText: isObscure2,
                                  obscuringCharacter: "*",
                                  decoration: InputDecoration(
                                    hintText: "Confirm password..",
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isObscure2 = !isObscure2;
                                          });
                                        },
                                        icon: isObscure2
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility),
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Icon(Icons.lock),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 3, 102, 92),
                                        style: BorderStyle.solid,
                                        width: 1.4,
                                      ),
                                      // borderSide: BorderSide.none
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 3, 102, 92),
                                        width: 1.4,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      3,
                                      102,
                                      92,
                                    ),
                                    minimumSize: Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (keyForm.currentState!.validate()) {
                                      bool result = await DbHelper().register(
                                        User(
                                          fullname: fullname.text,
                                          username: username.text,
                                          password: password.text,
                                        ),
                                      );
                                      if (result) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Loginpage(),
                                          ),
                                        );
                                        fullname.clear();
                                        username.clear();
                                        password.clear();

                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text("Register Berhasil"),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              "Register gagal, username sudah ada",
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 35,
            left: 2,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
