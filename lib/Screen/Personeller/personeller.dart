import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../const/constant.dart';

class Personeller extends StatefulWidget {
  const Personeller({super.key});

  @override
  State<Personeller> createState() => _PersonellerState();
}

bool isExpanded = false;

class _PersonellerState extends State<Personeller> {
  List<Map<String, dynamic>> medCat = [
    {"icon": FontAwesomeIcons.userDoctor, "category": "Ahmet Karaman"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Kerem Dadak"},
    {"icon": FontAwesomeIcons.hand, "category": "Mehmet Sakin"},
    {"icon": FontAwesomeIcons.lungs, "category": "Ayşe Yenilmez"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Kerem Dadak"},
    {"icon": FontAwesomeIcons.hand, "category": "Mehmet Sakin"},
    {"icon": FontAwesomeIcons.lungs, "category": "Ayşe Yenilmez"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Kerem Dadak"},
    {"icon": FontAwesomeIcons.hand, "category": "Mehmet Sakin"},
    {"icon": FontAwesomeIcons.lungs, "category": "Ayşe Yenilmez"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Kerem Dadak"},
    {"icon": FontAwesomeIcons.hand, "category": "Mehmet Sakin"},
    {"icon": FontAwesomeIcons.lungs, "category": "Ayşe Yenilmez"}
  ];
  List<dynamic> tumGorevler = [
    {"icerik": "Oda 1 temizlenecek", "kod": "0"},
    {"icerik": "Oda 2 temizlenecek", "kod": "1"}
  ];

  @override
  void initState() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference testCollectionRef =
        FirebaseFirestore.instance.collection('testCollection');
    testCollectionRef.add({'test': ''});

    super.initState();
  }

  late final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference demoRef = _firestore.collection("metaOzcePersonel");
    var babaRef = _firestore.collection("metaOzcePersonel").doc("MerveKaynak");
    // late List<dynamic> personeller = [
    //   {"adi": "ceren"}
    // ];
    getData() async {
      // var response = await babaRef.get();
      // var veri = response.data();
      // print(veri);
      // personeller = json.decode(response.data as String);
      // return personeller;

      // var response = await demoRef.get();
      // var list = response.docs;
      // print(list[1].data());
    }

    @override
    void initState() {
      getData();
      super.initState();
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 60, right: 60),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                children: [
                  // StreamBuilder<DocumentSnapshot>(
                  //     stream: babaRef.snapshots(),
                  //     builder:
                  //         (BuildContext context, AsyncSnapshot asyncSnapshot) {
                  //       return Text('${asyncSnapshot.data.data()['soyad']}');
                  //     }),

                  Text("personeller as String"),
                  IconButton(
                    onPressed: () {
                      //let's trigger the navigation expansion
                      setState(() {
                        getData();
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: const Icon(Icons.menu),
                  ),
                  buildCalisanlar(),
                  buildTableOlusturma(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool flagUsertype = false;
  Widget buildGorevAtama() => Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: DropdownButtonFormField<dynamic>(
          decoration: const InputDecoration(
            labelText: "Görevler",
            hintText: 'Atanacak görevi seçin',
            icon: Icon(Icons.person_pin_circle),

            enabledBorder: OutlineInputBorder(
                //borderSide: BorderSide(color: Colors.blue, width: 2),

                ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 35, 35, 35), width: 0.4),
            ),
            //filled: true,
            fillColor: Colors.white,
          ),
          value: null,
          items: tumGorevler
              .map((gorev) => DropdownMenuItem<dynamic>(
                  value: gorev,
                  child: Container(
                    height: 32,
                    child: Text(gorev['icerik'].toString(),
                        style: const TextStyle(fontSize: 15)),
                  )))
              .toList(),
          onChanged: (value) {},
          // onChanged: (userType) {
          //   setState(() {
          //     userTypeApi = userType;
          //     if (userType == null) {
          //       flagUsertype = false;
          //     } else {
          //       flagUsertype = true;
          //     }
          //     // selectedUserType = userType;
          //   });
          // },
          validator: (userType) {
            if (userType == null) {
              return "Select one";
            } else {
              return null;
            }
          },
        ),
      );
  Widget buildCalisanlar() {
    CollectionReference calisanRef = _firestore.collection("metaOzcePersonel");
    var gorevKategorileriRef =
        calisanRef.doc('AliYenilmez').collection('gorevKategorileri');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Personeller",
                style: TextStyle(fontSize: 42, color: kPrimaryColor),
              ),
            ],
          ),
        ),
        new Divider(
          color: kPrimaryColor,
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 250,
          child: StreamBuilder<QuerySnapshot>(
              stream: calisanRef.snapshots(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                List<DocumentSnapshot> listOfDocumentSnap =
                    asyncSnapshot.data.docs;
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: listOfDocumentSnap.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          // Text("${listOfDocumentSnap[index].data()}"),
                          Container(
                            height: 150,
                            width: 100,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  const BoxShadow(
                                      color: kPrimaryColor,
                                      blurRadius: 4,
                                      spreadRadius: 2)
                                ]),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "${listOfDocumentSnap[index].data()} "),
                                                content: Column(
                                                  children: [
                                                    StreamBuilder<
                                                            QuerySnapshot>(
                                                        stream:
                                                            gorevKategorileriRef
                                                                .snapshots(),
                                                        builder: (BuildContext
                                                                context,
                                                            AsyncSnapshot
                                                                asyncSnapshot) {
                                                          List<DocumentSnapshot>
                                                              listOfGorevler =
                                                              asyncSnapshot
                                                                  .data.docs;
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 20,
                                                                    left: 5,
                                                                    right: 5),
                                                            child:
                                                                DropdownButtonFormField<
                                                                    dynamic>(
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    "Görevler",
                                                                hintText:
                                                                    'Atanacak görevi seçin',
                                                                icon: Icon(Icons
                                                                    .person_pin_circle),

                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                        //borderSide: BorderSide(color: Colors.blue, width: 2),

                                                                        ),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          35,
                                                                          35,
                                                                          35),
                                                                      width:
                                                                          0.4),
                                                                ),
                                                                //filled: true,
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                              value: null,
                                                              items: listOfGorevler
                                                                  .map((gorev) => DropdownMenuItem<dynamic>(
                                                                      value: gorev,
                                                                      child: Container(
                                                                        height:
                                                                            32,
                                                                        child: Text(
                                                                            gorev['gorev']
                                                                                .toString(),
                                                                            style:
                                                                                const TextStyle(fontSize: 15)),
                                                                      )))
                                                                  .toList(),
                                                              onChanged:
                                                                  (value) {},
                                                              // onChanged: (userType) {
                                                              //   setState(() {
                                                              //     userTypeApi = userType;
                                                              //     if (userType == null) {
                                                              //       flagUsertype = false;
                                                              //     } else {
                                                              //       flagUsertype = true;
                                                              //     }
                                                              //     // selectedUserType = userType;
                                                              //   });
                                                              // },
                                                              validator:
                                                                  (userType) {
                                                                if (userType ==
                                                                    null) {
                                                                  return "Select one";
                                                                } else {
                                                                  return null;
                                                                }
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                    buildYorum(),

                                                    // Text(
                                                    //     listOfGorevler[
                                                    //             0]
                                                    //         .get(
                                                    //             "gorev"))
                                                  ],
                                                ),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text("Ok"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(0),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15),
                                                        child: Image.asset(
                                                          "assets/images/rob1.png",
                                                          width: 80,
                                                          height: 100,
                                                        )),
                                                  ]),
                                            )),
                                      )
                                    ],
                                  ),
                                ]),
                          ),
                          Text('${listOfDocumentSnap[index].get('ad')}',
                              style: const TextStyle(
                                  fontSize: 15, color: kPrimaryColor),
                              textAlign: TextAlign.center),
                        ],
                      );
                    });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Ekle"),
                      content: Column(
                        children: [
                          buildGorevAtama(),
                          buildYorum(),
                        ],
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Ok"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ],
    );
  }

  bool flagUsername = false;
  Widget buildYorum() => Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Not',
            hintText: 'At least 4 charachter',
            icon: const Icon(Icons.person),
            fillColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
              borderSide: flagUsername == true
                  ? const BorderSide(color: Colors.green)
                  : const BorderSide(color: Colors.red),
            ),
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.length < 4) {
              return "At least 4 charachter";
            } else {
              return null;
            }
          },
          maxLength: 30,
          onChanged: (value) {
            setState(() {
              if (value!.length < 4) {
                flagUsername = false;
              } else {
                flagUsername = true;
              }
              // username = value;
            });
          },
        ),
      );

  buildTableOlusturma() => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Görevler",
                    style: TextStyle(fontSize: 42, color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            new Divider(
              color: kPrimaryColor,
            ),
            DataTable(
                headingRowColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.grey.shade200),
                columns: [
                  const DataColumn(label: Text("ID")),
                  const DataColumn(label: Text("Article Title")),
                  const DataColumn(label: Text("Creation Date")),
                  const DataColumn(label: Text("Views")),
                  const DataColumn(label: Text("Comments")),
                ],
                rows: [
                  DataRow(cells: [
                    const DataCell(Text("0")),
                    const DataCell(Text("How to build a Flutter Web App")),
                    DataCell(Text("${DateTime.now()}")),
                    const DataCell(Text("2.3K Views")),
                    const DataCell(Text("102Comments")),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("1")),
                    const DataCell(Text("How to build a Flutter Mobile App")),
                    DataCell(Text("${DateTime.now()}")),
                    const DataCell(Text("21.3K Views")),
                    const DataCell(Text("1020Comments")),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("2")),
                    const DataCell(Text("Flutter for your first project")),
                    DataCell(Text("${DateTime.now()}")),
                    const DataCell(Text("2.3M Views")),
                    const DataCell(Text("10K Comments")),
                  ]),
                ]),
            //Now let's set the pagination
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "1",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "2",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "3",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
