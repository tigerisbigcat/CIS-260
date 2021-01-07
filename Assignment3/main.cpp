//
//  Lei Hao
//  Assignment3
//

// NOTE: The ONLY files that should be #included for this assignment are iostream,
// cmath (for the pow function),
// and string
// No other files should be #included

#include <iostream>
#include <cmath>
#include <string>

using namespace std;

string addbin(string, string);
string addhex(string, string);


int main()
{
    cout<<"binary 1101 + 1000 = "<<addbin("0010", "1011")<<endl;   //you should get 1101
    cout<<"binary 11000 + 1011 = "<<addbin("10001", "1101")<<endl; //you should get 11110
    cout<<"binary 11111111 + 1 = "<<addbin("11010100", "10")<<endl; //you should get 11010110
    cout<<"binary 101010 + 10 = "<<addbin("101101", "10")<<endl<<endl; //you should get 101111
    
    cout<<"hexadecimal A4 + A5 = "<<addhex("C6", "C7")<<endl;  //you should get 18D
    cout<<"hexadecimal 2B + C = "<<addhex("8E",  "A")<<endl;    //you should get 98
    cout<<"hexadecimal FABC + 789 = "<<addhex("ABBE", "785")<<endl;  //you should get B343
    cout<<"hexadecimal FFFFFF + FF = "<<addhex("FFAFBB", "AB")<<endl<<endl; //you should get FFB066

    system("PAUSE");
    return 0;
}


string addbin(string bin1, string bin2) {
    // comment 1: Initialize result
    string result = "";
    
    // comment 2: Initialize digit sum
    int sum = 0;
    
    int size_1 = bin1.size() - 1;
    int size_2 = bin2.size() - 1;
    
    // comment 3: Traverse both strings starting from last characters
    while (size_1 >= 0 || size_2 >= 0 || sum == 1) {
        
        // comment 4: Comput sum of last digits and carry
        if (size_1 >= 0) {
            sum += bin1[size_1] - '0';
        }
        if (size_2 >= 0) {
            sum += bin2[size_2] - '0';
        }
        
        // comment 5: If current digit sum is 1 or 3, add 1 to result
        result = char(sum % 2 + '0') + result;
        
        // comment 6: Compute carry
        sum /= 2;
        
        size_1--;
        size_2--;
    }
    return result;
}

string addhex(string hex1, string hex2) {
    if (hex1.length() < hex2.length()) {
        hex1.swap(hex2);
    }

    int length1, length2;
    length1 = hex1.length();
    length2 = hex2.length();
    int flag = 0; // carry
    int get1, get2;
    int sum;

    while (length1 > 0) {
        
        // comment 7: Get first number
        if (hex1[length1 - 1] >= 'A') {
            get1 = hex1[length1 - 1] - 55;
        }
        else {
            get1 = hex1[length1 - 1] - '0';
        }

        // comment 8: Get second number
        if (length2 > 0) {
            if (hex2[length2 - 1] >= 'A') {
                get2 = hex2[length2 - 1] - 55;
            }
            else {
                get2 = hex2[length2 - 1] - '0';
            }
        }
        else {
            get2 = 0;
        }

        // comment 9: Get the sum
        sum = get1 + get2 + flag;

        if (sum >= 16) {
            int left = sum % 16;
            if (left >= 10) {
                hex1[length1 - 1] = 'A' + left % 10;
            }
            else {
                hex1[length1 - 1] = '0' + left;
            }
            flag = 1;
        }
        else {
            if (sum >= 10) {
                hex1[length1 - 1] = 'A' + sum % 10;
            }
            else {
                hex1[length1 - 1] = '0' + sum;
            }
            flag = 0;
        }

        // comment 10: Move to next digits
        length1--;
        length2--;
    }

    if (flag == 1) {
        return "1" + hex1;
    }
    else {
        return hex1;
    }
}
