import 'package:flutter/material.dart';
import 'package:untitled/count_controller.dart';
import 'package:untitled/user_detail.dart';
import 'package:untitled/util.dart';

import 'User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var themeMode=ThemeMode.system;

  CountController countController = CountController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
          actions: [
            // Switch(value: isDark, onChanged: (value) {
            //   isDark=value;
            //   setState(() {
            //
            //   });
            // },)

            IconButton(onPressed: () {

              print("themeMode $themeMode");

              if(themeMode==ThemeMode.system){
                themeMode=ThemeMode.dark;
              }else if(themeMode==ThemeMode.dark){
                themeMode=ThemeMode.light;
              }else{
                themeMode=ThemeMode.system;
              }
              setState(() {

              });


            }, icon: Icon(Icons.settings))
          ],
        ),
        body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            var user = userList[index];
            print("user.name ==>${user.name}");

            return ListTile(
              leading: IconButton(
                onPressed: () async {
                  await Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Userdetail(
                        userIndex: index,
                      );
                    },
                  ));
                  setState(() {});
                },
                icon: Icon(Icons.remove_red_eye),
              ),
              title: TextFormField(
                controller: TextEditingController(text: user.name ?? ""),
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
              onPressed: () async {
                print("goto detail");
                await Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Userdetail();
                  },
                ));
                print("Back to home");
                setState(() {});
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
