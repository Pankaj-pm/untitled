import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/count_controller.dart';

void main() {
  test("MyLogin", () {
    CountController countController = CountController();

    countController.incrementCounter();
    countController.incrementCounter();
    countController.incrementCounter();
    countController.incrementCounter();
    countController.incrementCounter();
    countController.incrementCounter();
    countController.incrementCounter();
    countController.incrementCounter();
    countController.incrementCounter();
    countController.incrementCounter();
    countController.incrementCounter();
    countController.incrementCounter();
    expect(countController.count, 5);
  });

  test("UserListTest", () {
    CountController countController = CountController();
    expect(countController.userList.length, 0);
    var user = User();
    countController.addUser(user);
    countController.addUser(user);
    countController.addUser(user);
    expect(countController.userList.length, 3);
    countController.removeUser(user);
    expect(countController.userList.length, 2);
  });
}
