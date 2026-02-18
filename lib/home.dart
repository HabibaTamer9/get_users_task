import 'package:flutter/material.dart';
import 'package:get_users_task/api_helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 1000,
          width: 1000,
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      users = await ApiHelper().getData();
                      setState(() {});
                    },
                    child: Text("Get Users", style: TextStyle(fontSize: 20))),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: users.length,
                        itemBuilder: (context, i) {
                          var user = users[i];
                          return ListTile(
                            leading: Image.network(user["image"]),
                              title: Text(
                            "${user["firstName"]} ${user["lastName"]}",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                            subtitle: Text(
                              "${user["email"]}}",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                            ),
                            trailing: Icon(Icons.phone),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
