import 'package:flutter/material.dart';
import '../../Data/classbooking.dart';

class Book_Tile extends StatefulWidget {
  final String Instructor;
  final String classname;
  final String Duration;
  // final String Spots;
  // final Booking;
  Book_Tile(
      {Key? key,
      required this.classname,
      required this.Duration,
      //  required this.Spots,
      required this.Instructor})
      : super(key: key);

  @override
  State<Book_Tile> createState() => _Book_TileState();
}

class _Book_TileState extends State<Book_Tile> {
  bool _isFavorited = true;
  int _boxcount = 20;

  final classbooking book = new classbooking();
  @override
  Widget build(BuildContext context2) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(34),
        decoration: BoxDecoration(
            color: Color(0xFFC0C0C0), borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.Instructor,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 17),
                    ),
                    Text(
                      widget.Duration,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      widget.classname,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
                    ),
                    //  Text(
                    // widget.Spots,
                    // style: TextStyle(
                    //  color: Colors.white,
                    //  fontWeight: FontWeight.w800,
                    //  ),
                    // ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_isFavorited) {
                        _boxcount -= 1;
                        _isFavorited = false;
                      } else {
                        _boxcount += 1;
                        _isFavorited = true;
                      }
                    });
                  },
                  icon: (_isFavorited
                      ? const Icon(Icons.bookmark_add_outlined)
                      : const Icon(Icons.bookmark)),
                  color: Colors.red[500],
                ),
                Text(
                  '$_boxcount ' "Spots left",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
