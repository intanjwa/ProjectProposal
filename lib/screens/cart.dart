import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalassessment/screens/homepage.dart';

import 'package:finalassessment/screens/listproducts.dart';
import 'package:finalassessment/screens/login.dart';
import 'package:finalassessment/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  final formKey = GlobalKey<FormState>(); //key for form
  late String name;
  late String phone;
  late String myEmail;

  @override
  Widget build(BuildContext context) {
    //final TextEditingController locationController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    var selectedLocation;

    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    final List<String> chooseLocation = <String>[
      'Mahallah Asma',
      'Mahallah Hafsa',
      'Mahallah Halimah',
      'Mahallah Asiah',
      'Mahallah Aminah',
      'Mahallah Ruqayyah',
      'Mahallah Sumayyah',
      'Mahallah Maryam',
      'Mahallah Bilal',
      'Mahallah Faruq',
      'Mahallah Siddiq',
      'Mahallah Zubair',
      'Mahallah Uthman',
      'Mahallah Sallahudin',
    ];

    return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.deepPurple,
          actions: [
            FlatButton.icon(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
                label: const Text(
                  'Log out',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ))
          ],
        ),
        key: _scaffoldKey,
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                const Text(
                  "One step to get your",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                const Text(
                  "Ice Cream",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                SizedBox(height: height * 0.05),
                FutureBuilder(
                  future: _fetch(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const Text("Loading data...Please wait");
                    }
                    return Text("Email : $myEmail");
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: "Name"), // Input Decoration
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter correct name";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    name = value;
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: phoneController,
                  decoration: const InputDecoration(
                      labelText: "Phone Number"), // Input Decoration
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[+]*[[]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                            .hasMatch(value)) {
                      return "Enter correct phone number";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    phone = value;
                  },
                ),
                SizedBox(height: height * 0.05),
                DropdownButton(
                  icon: const Icon(Icons.arrow_circle_down),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 1.5,
                    color: Colors.grey,
                  ),
                  items: chooseLocation
                      .map((value) => DropdownMenuItem(
                            child: Text(
                              value.toString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            value: value,
                          ))
                      .toList(),
                  onChanged: (selectedChooseLocation) {
                    selectedLocation = selectedChooseLocation;
                  },
                  value: selectedLocation,
                  isExpanded: true,
                  hint: const Text(
                    'Select Mahallah',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                SizedBox(height: height * 0.05),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("",
                          style: TextStyle(fontSize: 22, color: Colors.black)),
                      ElevatedButton(
                        child: const Text("Checkout"),
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.purple,
                          elevation: 20,
                          minimumSize: const Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            newOrder(name, phone, selectedLocation);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          }
                        },
                      )
                    ])
              ],
            ),
          ),
        ));
  }

  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get()
        .then((ds) {
      myEmail = ds['email'];
      print(myEmail);
    }).catchError((e) {
      print(e);
    });
  }
}
