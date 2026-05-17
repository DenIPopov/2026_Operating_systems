#include <iostream>
#include "factorial.h"
#include <fstream>
#include <thread>
using namespace std;

void factor(int n) {
    ofstream out("res.txt");
    out << factorial(n);
    out.close();
}
int main() {
    int n = 10;
    thread t(factor, n);
    t.join();
    unsigned long long res;
    ifstream in("res.txt");
    in >> res;
    in.close();
    cout << res << endl;
    return 0;
}