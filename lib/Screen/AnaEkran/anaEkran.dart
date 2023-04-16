import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 60.0, left: 60.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //let's add the navigation menu for this project
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
              const SizedBox(
                height: 20.0,
              ),
              //Now let's start with the dashboard main rapports
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.article,
                                  size: 26.0,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                const Text(
                                  "Personeller",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "6 Personel",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.comment,
                                  size: 26.0,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                const Text(
                                  "Comments",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "+32 Comments",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.people,
                                  size: 26.0,
                                  color: Colors.amber,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                const Text(
                                  "Müşteriler",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "3.142 Müşteri",
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.monetization_on_outlined,
                                  size: 26.0,
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                const Text(
                                  "Revenue",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "2.300 \$",
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Now let's set the article section
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "6 Articles",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "3 new Articles",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Container(
                    width: 300.0,
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Type Article Title",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),

              //let's set the filter section

              const SizedBox(
                height: 40.0,
              ),
              //Now let's add the Table
            ],
          ),
        ),
      ),
    );
  }
}

//  DropdownButton(
//                           hint: const Text("Order by"),
//                           items: [
//                             const DropdownMenuItem(
//                               value: "Date",
//                               child: Text("Date"),
//                             ),
//                             const DropdownMenuItem(
//                               value: "Comments",
//                               child: Text("Comments"),
//                             ),
//                             const DropdownMenuItem(
//                               value: "Views",
//                               child: Text("Views"),
//                             ),
//                           ],
//                           onChanged: (value) {}),