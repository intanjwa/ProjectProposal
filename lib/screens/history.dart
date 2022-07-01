import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class history extends StatefulWidget {
  @override
  State<history> createState() => _historyState();

}

class _historyState extends State<history> {
  final CollectionReference order =
      FirebaseFirestore.instance.collection('order');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text("history"),
        backgroundColor: Colors.deepPurple,
        actions: [
          FlatButton.icon(
              onPressed: () {
                /*FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainScreen()));*/
              },
              icon: const Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              label: const Text(
                'Log out',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ))
        ],
      ),
body: Container(
                    padding: const EdgeInsets.all(20),
                    child: StreamBuilder(
                      stream: order.snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return ListView.builder(
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                                  return Card(
                                    //margin: const EdgeInsets.all(200),
                                    color: Colors.deepPurple,
                                    child: ListTile(
                                      title: Text(documentSnapshot['name']),
                                      subtitle: Text( documentSnapshot['phone'] + 
                                      "\n" + documentSnapshot['selectedLocation']),
                                    ),
                                  );
                            },
                          );
                        }
        
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),


    );
  }
}
