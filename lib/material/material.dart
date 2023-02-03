import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vanchan_admin/material/materialtype.dart';
import 'package:vanchan_admin/services/Create/material/addmaterial.dart';

class MaterialDataPage extends StatefulWidget {
  MaterialDataPage({super.key});

  @override
  State<MaterialDataPage> createState() => _MaterialDataPageState();
}

class _MaterialDataPageState extends State<MaterialDataPage> {
  late String sortsubname;
  late String subname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Material").snapshots(),
        builder:
            (__, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            if (snapshot.data!.docs.isNotEmpty) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (___, int index) {
                    Map<String, dynamic> docMaterial =
                        snapshot.data!.docs[index].data();
                    String uid = snapshot.data!.docs[index].id;
                    if (docMaterial.isEmpty) {
                      return const SizedBox(
                        child: Center(
                          child: Text("No Material Avalible"),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  docMaterial["Sort Subject Name"],
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  docMaterial["Subject Name"],
                                  style: GoogleFonts.ubuntu(fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MaterialTypePage(
                                          sortsubname:
                                              docMaterial['Sort Subject Name'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Find Material",
                                    style: GoogleFonts.ubuntu(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: Text("Material not available"),
              );
            }
          } else {
            return const Center(
              child: Text("Getting Error"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add Subject'),
                  content: Container(
                    height: 100,
                    child: Column(
                      children: [
                        TextField(
                          autofocus: true,
                          decoration: const InputDecoration(hintText: "DSA"),
                          onChanged: (value) {
                            setState(() {
                              sortsubname = value;
                            });
                          },
                        ),
                        TextField(
                          decoration: const InputDecoration(
                              hintText: "Data Structure and Algorithm"),
                          onChanged: (value) {
                            setState(() {
                              subname = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Map<String, dynamic> subject = {
                          'Sort Subject Name': sortsubname.toUpperCase(),
                          'Subject Name': subname
                        };
                        WriteData()
                            .addSubject(
                                sortsubname.toUpperCase(), subject, context)
                            .then((result) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Subject Added"),
                            backgroundColor: Colors.red,
                          ));
                        });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'DONE',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
