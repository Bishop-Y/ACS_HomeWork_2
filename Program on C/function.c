int function(const char array[100000], int buffer) {
    int index;
    int counter = 0;
    for (index = 0; index < buffer; ++index) {
       if (array[index] == '(') {
           ++counter;
       } else if (array[index] == ')') {
           --counter;
       }
       if (counter < 0) {
           return 0;
       }
    }
    if (counter == 0) {
        return 1;
    } else {
        return 0;
    }
}
