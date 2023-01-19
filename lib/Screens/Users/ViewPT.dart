import 'package:flutter/material.dart';
import '../../Data/classbooking.dart';
import '../../models/Admins/PTmodel.dart';
import '../../Services/PTServices.dart';
class viewPT extends StatefulWidget {

  @override
  State<viewPT> createState() => _viewPTState();
}

class _viewPTState extends State<viewPT> {
  bool _isFavorited = true;
  int _boxcount = 20;
  bool _isbuttonclickable=true;
  @override
  Widget build(BuildContext context2) {
        return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('All Private Trainers'),
      ),
      body: StreamBuilder<List<PrivateTrainers>>(
        stream: readPT(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final allPT = snapshot.data!;
            return Container(
              child: ListView.builder(
                itemCount: allPT.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric( horizontal: 10 ,vertical: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    color: Color(0xFFC0C0C0),
                    //  color: Color.fromARGB(33, 250, 250, 250),
                      child: SizedBox(
                      width: 140,
                      height: 120,
                      child: ListTile( 
                        title: Text(allPT[index].trainername, style: TextStyle(color:Colors.purple,fontSize: 20, fontWeight: FontWeight.bold),),
                        subtitle: Column(
                          children: [
                             SizedBox(height: 6,width: 6,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Available All week except:  ", style:TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11,)),
                                Text(allPT[index].availabledays, style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14,)),
                              ],
                            ),
                            SizedBox(height: 6,),

                             Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Session Duration", style:TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11,)),
                                Text(allPT[index].sessionduration, style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          
                          ],
                        ),
                        

             trailing:Column(
              children: [ 
                Opacity(opacity: 
                _isbuttonclickable? 1.0 : 0.0),
                  ElevatedButton(
                    onPressed: () {
                      
                      if(_isbuttonclickable){
                        _isbuttonclickable=false;
                      }
                       showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Alert'),
                        content: const Text('Are you sure you want to book with this trainer'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'No'),
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Yes'),
                            child: const Text('Yes'),
                            style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.pressed))
                                        return Colors.redAccent; //<-- SEE HERE
                                      return null; // Defer to the widget's default.
                                    },
                                  ),)
                          ),
                        ],
                      ),
                    );
                  
                    
                       style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.redAccent; //<-- SEE HERE
                          return null; // Defer to the widget's default.
                        },
                       ),
                      );
                    },
                    child: Text('Book'),
                     )
              ],
            )
                                  
                      )
                      ),
                    ),
                  );
          },
          ),
    );
  }else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      );
}
}
