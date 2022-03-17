import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../common/app_style.dart';
import 'details_card_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getData() async {
    var url = Uri.parse("http://10.0.2.2/test_for_flutter/index.php");
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    // print(responsebody);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    String img_PS =
        "https://www.allkeyshop.com/blog/wp-content/uploads/PlayStationNetworkGiftCard.jpg";
    String img_xbox =
        "https://blackhawknetwork.com/on-demand/wp-content/uploads/2020/10/Microsoft-Xbox.png";
    return Scaffold(
      backgroundColor: const Color(0xFFE7E9F5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 30,
              width: 200,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search Something',

                ),
                style: const TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   height:  120,
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [
            //         Color(0xffBB44CA),
            //         Color(0xff7726DA),
            //       ],
            //     ),
            //     borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(18),
            //         bottomRight: Radius.circular(18)),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(10, 35, 12, 12),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text('(Your cards)', style: kTitle2),
            //         const SizedBox(height: 30),
            //         Row(
            //           children: const [
            //             SizedBox(
            //               // width: MediaQuery.of(context).size.width,
            //               height: 120,
            //               child: ListTile(
            //                 leading: Icon(Icons.ac_unit_outlined),
            //                 title: Text(
            //                   'Anydhs',
            //                   style: kBodyText2,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               // width: MediaQuery.of(context).size.width,
            //               height: 120,
            //               child: ListTile(
            //                 leading: Icon(Icons.ac_unit_outlined),
            //                 title: Text(
            //                   'Anydhs',
            //                   style: kBodyText2,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //         const SizedBox(height: 30),
            //         Row(
            //           children: const [
            //             SizedBox(
            //               // width: MediaQuery.of(context).size.width,
            //               height: 120,
            //               child: ListTile(
            //                 leading: Icon(Icons.ac_unit_outlined),
            //                 title: Text(
            //                   'Anydhs',
            //                   style: kBodyText2,
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               // width: MediaQuery.of(context).size.width,
            //               height: 120,
            //               child: ListTile(
            //                 leading: Icon(Icons.ac_unit_outlined),
            //                 title: Text(
            //                   'Anydhs',
            //                   style: kBodyText2,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Align(
            //         alignment: Alignment.topLeft,
            //         child: Padding(
            //           padding: EdgeInsets.all(15.0),
            //           child: Text(
            //             'Choose your\ntype of card',
            //             style: kTitle2,
            //           ),
            //         )),
            //     Padding(
            //       padding: const EdgeInsets.only(right: 12.0),
            //       child: CircleAvatar(
            //         backgroundColor: Colors.white,
            //         child: IconButton(
            //           color: kBlack,
            //           onPressed: () {},
            //           icon: const Icon(Icons.filter),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 100),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                      // childAspectRatio: 0.75,
                    ),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return DetailsCardScreen(
                                    image: img_PS,
                                  );
                                }),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 130,
                                  height: 120,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  // margin: const EdgeInsets.only(left: 20),
                                  // padding: const EdgeInsets.all(10),
                                  child: const Card(
                                    color: Color(0xffFDCA1F),
                                  )
                                  // Image.network(
                                  //   img_PS,
                                  //   fit: BoxFit.cover,
                                  //   // alignment: Alignment.topCenter/3.9,
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
