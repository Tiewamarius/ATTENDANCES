import 'package:attendances/pages/auth/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _ObscureText = true;
  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child:Container(
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formkey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: SizedBox(
                    height: 250,
                    width: 200,
                    child: Image.asset(
                      'images/Admin.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 350,
                  width: 365,
                  child: Column(children: [
                    SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Set desired radius
                        ),
                        hintText: 'Entrer votre Email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Entre votre Email";
                        }
                        return null;
                      },
                      controller: emailController,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        hintText: 'Entrer votre Mot de pass',
                        suffixIcon: IconButton(
                          icon: _ObscureText
                              ? Icon(Icons.visibility_off, color: Colors.blue)
                              : Icon(Icons.visibility, color: Colors.blue),
                          onPressed: () {
                            setState(() {
                              _ObscureText = !_ObscureText;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Set desired radius
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veillez entrer le mot de pass";
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: _ObscureText,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            // final email = emailController.text;
                            // final mdpass = passwordController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Login...")));
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(0, 62, 17, 50),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Colors.blue,
                                width: 0.1,
                              )),
                        ),
                        child: Text('VALIDER',
                            style: TextStyle( fontSize: 25.0, fontWeight: FontWeight.bold,
                                color:Colors.blue)),
                      ),
                    ),
                    const SizedBox(height: 80),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  'Pas de compte Admin? ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 10.0),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Register()));
                                    },
                                    child: const Text(
                                      'Creer',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ]),
                        ],
                      ),
                    ),
                  ]),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
