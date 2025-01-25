import 'dart:typed_data';
import 'package:attendances/pages/auth/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() =>_RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true; // State variable to control password visibility

  final _formkey = GlobalKey<FormState>();
  final profilController = TextEditingController();
  final nomPrenomsController = TextEditingController();
  final fonctionController = TextEditingController();
  final emailController = TextEditingController();
  final numeroController = TextEditingController();
  final mdpassController = TextEditingController();
  final codeValidatinController = TextEditingController();



  Uint8List? _image;

  get selectedConfType => null;

  void selectedImage() async {
    //Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      //_image = img;
    });
  }

  @override
  void dispose() {
    super.dispose(); profilController.dispose();
    nomPrenomsController.dispose();
    fonctionController.dispose();
    emailController.dispose();
    numeroController.dispose();
    mdpassController.dispose();
    codeValidatinController.dispose();
    //empreintController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                        key: _formkey,
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(60.0),
                                child: SizedBox(
                                  height: 300,
                                  width: 300,
                                  child: Image.asset(
                                    'images/Login.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(
                              width: 410,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 25, right: 25),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        _image != null
                                            ? CircleAvatar(
                                                radius: 45,
                                                backgroundImage:
                                                    MemoryImage(_image!),
                                                child: Positioned(
                                                  bottom: -100,
                                                  left: 10,
                                                  child: IconButton(
                                                    onPressed: selectedImage,
                                                    icon:
                                                        const Icon(Icons.add_a_photo),
                                                  ),
                                                ),
                                              )
                                            : CircleAvatar(
                                                radius: 45,
                                                backgroundImage: const AssetImage(
                                                    "images/logodedis.jpg"),
                                                child: Positioned(
                                                  bottom: -100,
                                                  left: 10,
                                                  child: IconButton(
                                                    onPressed: selectedImage,
                                                    icon:
                                                        const Icon(Icons.add_a_photo),
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: Colors.red,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set desired radius
                                        ),
                                        hintText: 'Nom & Prenom',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Entre votre nom";
                                        }
                                        return null;
                                      },
                                      controller: nomPrenomsController,
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.web,
                                          color: Colors.red,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set desired radius
                                        ),
                                        hintText: 'Fonction',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Entre votre fonction";
                                        }
                                        return null;
                                      },
                                      controller: fonctionController,
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.email,
                                          color: Colors.red,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set desired radius
                                        ),
                                        hintText: 'Adresse email',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Entre votre Email";
                                        }
                                        return null;
                                      },
                                      controller: emailController,
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.phone,
                                          color: Colors.red,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set desired radius
                                        ),
                                        hintText: 'N° Telephone',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Entre votre Numero de telephone";
                                        }
                                        return null;
                                      },
                                      controller: numeroController,
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: Colors.red,
                                        ),
                                        hintText: 'Creer un Mot de pass',
                                        suffixIcon: IconButton(
                                          icon: _obscureText
                                              ? const Icon(Icons.visibility_off,
                                                  color: Colors.red)
                                              : const Icon(Icons.visibility,
                                                  color: Colors.red),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set desired radius
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Creer un mot de pass";
                                        }
                                        return null;
                                      },
                                      controller: mdpassController,
                                      obscureText: _obscureText,
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.key,
                                          color: Colors.red,
                                        ),
                                        hintText: 'Code d\'Autorisation',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set desired radius
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Code d'autorisation requis par l'administration";
                                        }
                                        return null;
                                      },
                                      controller: codeValidatinController,
                                      obscureText: true,
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        prefixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.fingerprint,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            // Update the visibility state and rebuild the widget
                                          },
                                        ),
                                        hintText:
                                            'Ajouter Empreinte (Facultatif)',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set desired radius
                                        ),
                                      ),
                                      /*validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Empreint";
                            }
                            return null;
                          },
                          //controller: empreintController,*/
                                      obscureText: true,
                                    ),
                                    Visibility(
                                      visible: false,
                                      child: DropdownButton(
                                          items: const [
                                            DropdownMenuItem(
                                                value: 'ODEDIS',
                                                child: Text('Odedis')),
                                          ],
                                          value: selectedConfType,
                                          onChanged: (value) {
                                            setState(() {
                                              //selectedConfType = value!;
                                            });
                                          }),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formkey.currentState!
                                              .validate()) {
                                            //final profil = profilController.text;
                                            final nomPrenom = nomPrenomsController.text;
                                            final fonction = fonctionController.text;
                                            final email = emailController.text;
                                            final numero =
                                                numeroController.text;
                                            final mdpass =
                                                mdpassController.text;
                                            final codeValidation =
                                                codeValidatinController.text;
                                            //final empreint = empreintController.text;
                                            //final direction = directionController.text;

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Incription encours...")));
                                            FocusScope.of(context).requestFocus(FocusNode());
                                           /* CollectionReference employRef = FirebaseFirestore.instance.collection("employee");
                                            employRef.add({
                                              //'profil':profil,
                                              'nomPrenom': nomPrenom,
                                              'fonction': fonction,
                                              'email': email,
                                              'numero': numero,
                                              'mdpass': mdpass,
                                            });*/
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color.fromARGB(0, 62, 17, 50),
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: const BorderSide(
                                                color: Colors.red,
                                                width: 0.1,
                                              )),
                                        ),
                                        child: const Text('VALIDER',
                                            style: TextStyle(
                                                fontSize: 35.0, // Set font size
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red)),
                                      ),
                                    ),
                                    const SizedBox(height: 80),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 5),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  const Text(
                                                    'Deja Inscrit? ',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  //Icon(Icons.person),
                                                  const SizedBox(width: 10.0),
                                                  GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Login()),
                                                        );
                                                      },
                                                      child: const Text(
                                                        'Connectez-Vous',
                                                        style: TextStyle(
                                                            color:
                                                                const Color.fromARGB(
                                                                    255,
                                                                    59,
                                                                    58,
                                                                    58),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ))
                                                ]),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
    ],
    ),
    ),
    ),
    ),
    ),
    );
  }
}