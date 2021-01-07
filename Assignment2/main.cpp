//
//  Lei_Hao_260_assign2
//

// NOTE: The ONLY files that should be #included for this assignment are iostream,
// cmath (for the pow function),
// and string
// No other files should be #included

#include <iostream>
#include <cmath>
#include <string>

using namespace std;

// comment 1: prototypes for the program.
int bin_to_dec(string);
string dec_to_bin(int);
int hex_to_dec(string);
string dec_to_hex(int);


int main()
{
    // you should get 131
    cout<<"10000011 binary = "<<bin_to_dec("10000011")<<" decimal\n";

    // you should get 85
    cout<<"01010101 binary = "<<bin_to_dec("01010101")<<" decimal\n";

    // you should get 65,535
    cout<<"1111111111111111 binary = "<<bin_to_dec("1111111111111111")
        <<" decimal\n";

    // you should get 32,767
    cout<<"0111111111111111 binary = "<<bin_to_dec("0111111111111111")
        <<" decimal\n\n";


    //you should get 11111111
    cout<<"255 decimal = "<<dec_to_bin(255)<<" binary\n";

    //you should get 1111111111111100
    cout<<"65532 decimal = "<<dec_to_bin(65532)<<" binary\n";

    //you should get 1100
    cout<<"12 decimal = "<<dec_to_bin(12)<<" binary\n";

    //you should get 11110100001001000000
    cout<<"1000000 decimal = "<<dec_to_bin(1000000)<<" binary\n\n";


    //you should get 2,748
    cout<<"ABC hexadecimal = "<<hex_to_dec("ABC")<<" decimal\n";
    
    //you should get 245
    cout<<"F5 hexadecimal = "<<hex_to_dec("F5")<<" decimal\n";

    //you should get 4,660
    cout<<"1234 hexadecimal = "<<hex_to_dec("1234")<<" decimal\n";

    //you should get 1,040,075
    cout<<"FDECB hexadecimal = "<<hex_to_dec("FDECB")<<" decimal\n\n";


    //you should get 200
    cout<<"512 decimal = "<<dec_to_hex(512)<<" hexadecimal\n";

    //you should get 1388
    cout<<"5000 decimal = "<<dec_to_hex(5000)<<" hexadecimal\n";

    //you should get DBBA0
    cout<<"900000 decimal = "<<dec_to_hex(900000)<<" hexadecimal\n";

    //you should get FFF5
    cout<<"65525 decimal = "<<dec_to_hex(65525)<<" hexadecimal\n\n";


//    system("PAUSE");
    return 0;

}

// Converts any UNsigned binary number to decimal
int bin_to_dec(string s)
{
    int decimal = 0;
    int base = 1;
    int lengthOfBinary = s.length();
    for (int i = lengthOfBinary - 1; i >= 0; i--) {
        
        // comment 2: if the binary is 1, then add it to decimal.
        //            if the binary is 0, do nothing.
        if (s[i] == '1') {
            decimal += base;
        }
        
        // comment 3: every time before the loop, base will increse to two times.
        base *= 2;
    }
    return decimal;
}


//Converts any non-negative decimal number to binary
string dec_to_bin(int n)
{
    // comment 4: the int limit to 32(or depends on the system.
    //            can use sizeof(n) * 8 instead of 32.
    string binaryElement[32];
    string binary;
    int i = 1;
    while (n > 0) {
        binaryElement[i] = to_string(n % 2);
        n /= 2;
        i++;
    }
    for (int j = i - 1; j >= 0; j--) {
        
        // comment 5: combine all the binary elements into a string.
        binary = binary.append(binaryElement[j]);
    }
    return binary;
}


//Converts any UNsigned hexadecimal number to decimal
int hex_to_dec(string s)
{
    int decimal = 0;
    int lengthOfHex = s.length();

    for (int i = lengthOfHex - 1; i >= 0; i--) {
        if (int(s[i]) >= '0' && int(s[i]) <= '9') {
            
            // comment 6: the ASCII code for ‘0’ is 48.
            decimal += pow(16, lengthOfHex - i - 1) * (int(s[i]) - 48);
        }
        
        // comment 7: if the element is A to F, multiply by 10 - 15.
        else if (s[i] == 'A') {
            decimal += (pow(16, lengthOfHex - i - 1)) * 10;
        }
        else if (s[i] == 'B') {
            decimal += (pow(16, lengthOfHex - i - 1)) * 11;
        }
        else if (s[i] == 'C') {
            decimal += (pow(16, lengthOfHex - i - 1)) * 12;
        }
        else if (s[i] == 'D') {
            decimal += (pow(16, lengthOfHex - i - 1)) * 13;
        }
        else if (s[i] == 'E') {
            decimal += (pow(16, lengthOfHex - i - 1)) * 14;
        }
        else if (s[i] == 'F') {
            decimal += (pow(16, lengthOfHex - i - 1)) * 15;
        }
    }
    return decimal;
}



//Converts any non-negative decimal number to hexadecimalConverts
//any non-negative decimal number to hexadecimal
string dec_to_hex(int n)
{
    string hexElement[100];
    string hex;
    int i = 1;
    while (n > 0) {
        
        // comment 8: if the remainder is 10 - 15, translate them to A - F.
        if (n % 16 == 10) {
            hexElement[i] = 'A';
        }
        else if (n % 16 == 11) {
            hexElement[i] = 'B';
        }
        else if (n % 16 == 12) {
            hexElement[i] = 'C';
        }
        else if (n % 16 == 13) {
            hexElement[i] = 'D';
        }
        else if (n % 16 == 14) {
            hexElement[i] = 'E';
        }
        else if (n % 16 == 15) {
            hexElement[i] = 'F';
        }
        else {
            
            // comment 9: if the element is 0 - 9, save them as string.
            hexElement[i] = to_string(n % 16);
        }
        
        n /= 16;
        i++;
    }
    for (int j = i - 1; j >= 0; j--) {
        
        // comment 10: combine all the hexadecimal elements into a string.
        hex = hex.append(hexElement[j]);
    }
    return hex;
}



