import 'package:flutter/material.dart';

import '../Api/endPoints.dart';
import '../Models/User.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return HomeScreenState();
  }
}
class HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    EndPoint.getUsers().then((value) => {
      users = value,
      setState((){
        users;
        isLoading = false;
    })
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: SafeArea(
        child: isLoading ? const Center(
          child: CircularProgressIndicator(
            color: Colors.teal,
          ),
        ): Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(color: Colors.black12),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index){
                User user = users[index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                            child: CircleAvatar(
                              child: Image(
                                image: NetworkImage(user.imgUrl),
                              ),
                            )
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                   child: Text('First Name : ${user.firstName}'),
                                  ),
                                  Expanded(
                                    flex: 3,
                                     child: Text('Last Name: ${user.lastName}'),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text('Email : ${user.email}')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      ),
    );
  }

}