import 'package:flutter/material.dart';
import 'package:untitled/count_controller.dart';
import 'package:untitled/user_detail.dart';
import 'package:untitled/util.dart';

import 'User.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CountController countController = CountController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          var user = userList[index];
          print("user.name ==>${user.name}");

          return ListTile(
            leading: IconButton(
              onPressed: () async{
                await Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Userdetail(userIndex: index,);
                  },
                ));
                setState(() {

                });
              },
              icon: Icon(Icons.remove_red_eye),
            ),
            title: TextFormField(
              controller: TextEditingController(text:user.name ?? "" ),
              // initialValue: user.name ?? "",
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_circle),
                ),
                Text("${user.count ?? 0}"),
                IconButton(
                  onPressed: () {
                    if (user.count == null) {
                      user.count = 1;
                    } else {
                      user.count = user.count! + 1;
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.add_box),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          FloatingActionButton(
            onPressed: () async{
              print("goto detail");
              await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Userdetail();
                },
              ));
              print("Back to home");
              setState(() {

              });

            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
