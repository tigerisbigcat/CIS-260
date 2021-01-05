//
//  Catherine_Hao_260_assign1
//


#include <iostream>
using namespace std;

const int COLS = 5;

// comment 1: prototypes for the program.
int getTotal(int[][COLS], int);
double getAverage(int[][COLS], int);
int getRowTotal(int[][COLS], int);
int getColumnTotal(int[][COLS], int, int);
int getHighestInRow(int[][COLS], int);
int getLowestInRow(int[][COLS], int);


// comment 2: main function.
int main() {
    const int ROWS = 4;

    // comment 3: initialize the array.
    int testArray[ROWS][COLS] =
    { { 1,   2,  3,  4,  5 },
    {   6,   7,  8,  9, 10 },
    {  11,  12, 13, 14, 15 },
    {  16,  17, 18, 19, 20 } };

    cout << "The total of the array elements is "
        << getTotal(testArray, ROWS)
        << endl;

    cout << "The average value of an element is "
        << getAverage(testArray, ROWS)
        << endl;

    cout << "The total of row 0 is "
        << getRowTotal(testArray, 0)
        << endl;


    cout << "The total of col 2 is "
        << getColumnTotal(testArray, 2, ROWS)
        << endl;


    cout << "The highest value in row 2 is "
        << getHighestInRow(testArray, 2)
        << endl;

    cout << "The lowest value in row 2 is "
        << getLowestInRow(testArray, 2)
        << endl;

    system("PAUSE");
    return 0;
}

// comment 4: getTotal function. This function is calculating the sum
// of the elements in the array.
int getTotal(int array[][COLS], int rows) {
    int sum = 0;
    for (int i = 0; i < COLS; i++) {
        for (int j = 0; j < rows; j++) {
            sum += array[j][i];
        }
    }
    return sum;
}

// comment 5: getAverage function. This function is calculating the average
// of the elements in the array.
double getAverage(int array[][COLS], int rows) {
    double sum = getTotal(array, rows);
    return sum / (COLS * rows);
}

// comment 6: getRowTotal function. This function is calculating the sum
// of the row elements in the array.
int getRowTotal(int array[][COLS], int rowToTotal) {
    int rowTotal = 0;
    for(int i = 0; i < COLS; i++) {
        rowTotal += array[rowToTotal][i];
    }
    return rowTotal;
}

// comment 7: getColumnTotal function. This function is calculating the sum
// of the column elements in the array.
int getColumnTotal(int array[][COLS], int colToTotal, int rows) {
    int columnTotal = 0;
    for(int i = 0; i < rows; i++) {
        columnTotal += array[i][colToTotal];
    }
    return columnTotal;
}

// comment 8: getHighestInRow function. This function is finding the highest
// number of the row in the array.
int getHighestInRow(int array[][COLS], int rowToSearch) {
    int heightInRow = array[rowToSearch][0];
    for(int i = 1; i < COLS; i++) {
        
        // comment 9: if the first of element of the number is smaller than
        // next elment, set the heightest number to heightInRow variable.
        if(heightInRow < array[rowToSearch][i]) {
            heightInRow = array[rowToSearch][i];
        }
    }
    return heightInRow;
}

// comment 10: getLowestInRow function. This function is finding the lowest
// number of the row in the array.
int getLowestInRow(int array[][COLS], int rowToSearch) {
    int lowestInRow = array[rowToSearch][0];
    for(int i = 1; i < COLS; i++) {
        
        // comment 11: if the first of element of the number is bigger than
        // next elment, set the lowest number to lowestInRow variable.
        if(lowestInRow > array[rowToSearch][i]) {
            lowestInRow = array[rowToSearch][i];
        }
    }
    return lowestInRow;
}

