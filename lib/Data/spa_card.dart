import 'package:flutter/material.dart';

class SpaCard extends StatelessWidget {
  const SpaCard(
      {super.key,
      required this.packageImagePath,
      required this.PackageName,
      required this.PackageDescription,
      required this.PackageDuration,
      required this.PackagePrice});
  final String packageImagePath;
  final String PackageName;
  final String PackageDescription;
  final String PackageDuration;
  final String PackagePrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.circular(12)),
        //color: Colors.deepPurple[100],
        child: Center(
          child: Column(children: [
            Image.asset(packageImagePath, height: 190),
            SizedBox(
              height: 25,
            ),
            Text(PackageName, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text(
              PackageDescription,
            ),
            SizedBox(
              height: 5,
            ),
            Text(PackageDuration),
            Text(PackagePrice),
          ]),
        ),
      ),
    );
  }
}
// Image.asset('images/1.jpg', height: 190),
//             SizedBox(
//               height: 25,
//             ),
//             Text('Friends Package',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               ' we have created this special package \n where our main interest is to provide \n  an atmosphere of relaxation,\n  tranquility and peace.',
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Text('Duration : 90 Minutes'),
//             Text('Price : 1000 EGP'),
//           ]),
//         ),
//       ),
//     );
//   }
// }
