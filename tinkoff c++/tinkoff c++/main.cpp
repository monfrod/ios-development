//
//  main.cpp
//  tinkoff c++
//
//  Created by yunus on 11.03.2024.
//

#include <iostream>
using namespace std;

int main(){
    int a, b, c, d;
    cin >> a;
    cin >> b;
    cin >> c;
    cin >> d;
    if (d > b){
        int e = d-b;
        cout << a+(e*c);
    } else{
        cout << a*b;
    }
}
