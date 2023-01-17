import 'package:flutter/material.dart';
import '../../models/Users/usermodel.dart';
import '../../services/registerusers.dart';


class AllUsersPage extends StatefulWidget {
  const AllUsersPage({super.key});

  @override
  State<AllUsersPage> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(child: const Text('All Users Registered')),
      ),
      body: StreamBuilder<List<Users>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final allUsers = snapshot.data!;
            return Container(
              color: Color.fromARGB(232, 249, 249, 249),
              child: ListView.builder(
                itemCount: allUsers.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile( 
                      leading: Icon(Icons.account_circle_rounded, size: 30),
                      title: Text(allUsers[index].name, style: TextStyle(fontSize: 18,),),
                      subtitle: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Email: '),
                              Text(allUsers[index].email),
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Mobile: '),
                              Text(allUsers[index].mobile),
                            ],
                          ),
                        ],
                      ),
                      trailing:  IconButton(
                              onPressed: () => delete(allUsers[index].id.toString()),
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
