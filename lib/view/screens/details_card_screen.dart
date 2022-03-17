import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsCardScreen extends StatelessWidget {
   DetailsCardScreen({Key? key, required this.image}) : super(key: key);
  String? image ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xff8b2bc4),
      elevation: 10.0,),
      body: Container(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xff8b2bc4),
              Color(0xff4c0c5a),
            ])),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 15),
                      child:  CircleAvatar(
                        minRadius: 50,
                        child: const Card(
                          shadowColor: Colors.cyanAccent,
                          elevation: 10,
                          margin: EdgeInsetsDirectional.only(start: 80,top: 70),
                          child: Text('10\$',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 23,
                            ) ,
                          ),
                        ),
                        backgroundImage: NetworkImage(image!),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      '0',
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.minimize_outlined),
                    )
                  ],
                );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
