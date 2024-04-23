class CountController {
  int count = 0;



  void incrementCounter() {
    if (count < 5) {
      count++;
    }
  }

  void decrementCounter() {
    count--;
  }

}

