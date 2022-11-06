int function(const char array[200], int size) {
    int index;
    int counter = 0;
    for (index = 0; index < size; ++index) {
       if (array[index] == 40) {
           ++counter;
       } else if (array[index] == 41) {
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
