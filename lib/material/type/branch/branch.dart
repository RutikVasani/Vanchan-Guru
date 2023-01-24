import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholar/material/type/branch/ce.dart';
import 'package:scholar/material/type/branch/cse.dart';
import 'package:scholar/material/type/branch/it.dart';

class BranchPage extends StatelessWidget {
  const BranchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          elevation: 3.0,
          backgroundColor: const Color.fromARGB(255, 16, 121, 174),
          title: Text(
            "Branch",
            style: TextStyle(fontSize: 25, letterSpacing: 2),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 235,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MCsepage(),
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "CSE",
                        style: GoogleFonts.ubuntu(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MCepage(),
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "CE",
                        style: GoogleFonts.ubuntu(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MItpage(),
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "It",
                        style: GoogleFonts.ubuntu(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5)
              ],
            ),
          ),
        ));
  }
}
