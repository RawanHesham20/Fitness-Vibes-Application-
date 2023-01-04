import 'package:flutter/material.dart';

class Book_Spa extends StatelessWidget {
  final String Name;
  final String Price;
  final String Duration;
  final String Description;
  final String image;
  const Book_Spa(
      {Key? key,
      required this.Name,
      required this.Price,
      required this.Duration,
      required this.Description,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          // width:370,
          // height:200,
          padding: const EdgeInsets.all(34),
          decoration: BoxDecoration(
              color: Color(0xFFC0C0C0),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                      Text(
                        Duration,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        Price,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        Description,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Image.asset(image, width: 150, fit: BoxFit.fitHeight)
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.spa),
                  ElevatedButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Alert'),
                        content: const Text(
                            'Are you sure you want to book this package'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    ),
                    child: Text('Book'),
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: Color(0xFF9340BA),
                      minimumSize: Size(30, 30),
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
