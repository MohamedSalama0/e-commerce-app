// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:convert';
import 'package:e_commerce_app/common/app_style.dart';
import 'package:e_commerce_app/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: getResponsiveScreenWidth(3), 
                    top:  getResponsiveScreenHeight(3),
                  ),
                  height: getResponsiveScreenHeight(6),
                  width: getResponsiveScreenWidth(65),
                  decoration: BoxDecoration(
                    color: kTextColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(
                      18
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Products',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: kPrimaryColor,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),

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
