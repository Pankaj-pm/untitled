import 'package:flutter/material.dart';
import 'package:untitled/User.dart';
import 'package:untitled/util.dart';

class Userdetail extends StatefulWidget {
  int? userIndex;

  Userdetail({super.key, this.userIndex});

  @override
  State<Userdetail> createState() => _UserdetailState();
}

class _UserdetailState extends State<Userdetail> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.userIndex != null) {
      textEditingController.text = userList[widget.userIndex!].name ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextFormField(
          controller: textEditingController,
        ),
        if (widget.userIndex != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_circle),
              ),
              Text("${userList[widget.userIndex ?? 0].count}"),
              IconButton(
                onPressed: () {
                  print((userList[widget.userIndex ?? 0].count ?? 0));
                  userList[widget.userIndex ?? 0].count = (userList[widget.userIndex ?? 0].count ?? 0) + 1;

                  setState(() {});
                },
                icon: Icon(Icons.add_box),
              ),
            ],
          )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.userIndex == null) {
            userList.add(User(
              count: 0,
              name: textEditingController.text,
            ));
            Navigator.pop(context);
            print("Add");
          } else {
            userList[widget.userIndex!] = User(
              count: (userList[widget.userIndex ?? 0].count ?? 0),
              name: textEditingController.text,
            );
            print("Update");
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
