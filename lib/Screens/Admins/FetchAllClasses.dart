import 'package:flutter/material.dart';
import '../../models/Admins/classesModel.dart';
import '../../Services/classesServices.dart';

class AllClassesPage extends StatefulWidget {
  const AllClassesPage({super.key});

  @override
  State<AllClassesPage> createState() => _AllClassesPageState();
}

class _AllClassesPageState extends State<AllClassesPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(child: const Text('All Added Classes')),
      ),
      body: StreamBuilder<List<Classes>>(
        stream: readClasses(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final allClasses = snapshot.data!;
            return Container(
              color: Color.fromARGB(232, 249, 249, 249),
              child: ListView.builder(
                itemCount: allClasses.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile( 
                      leading: Icon(Icons.account_circle_rounded, size: 30),
                      title: Text(allClasses[index].classname, style: TextStyle(fontSize: 18,),),
                      subtitle: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Duration: '),
                              Text(allClasses[index].duration),
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Instructor Name: '),
                              Text(allClasses[index].instructorname),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('No Of Slots: '),
                              Text(allClasses[index].noOfSlots),
                            ],
                          ),
                        ],
                      ),
                      trailing:  IconButton(
                              onPressed: () => deleteClasses(allClasses[index].id),
                              icon: const Icon(Icons.delete)),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
