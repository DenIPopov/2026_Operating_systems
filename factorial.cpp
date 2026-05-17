#include <iostream>
using namespace std;
unsigned long long factorial(int n)
{
    if (n <= 1)
        return 1;
    return n * factorial(n - 1);
}
int main()
{
    int n;
    cout << "Enter number (0-20): ";
    cin >> n;
    if (n < 0 || n > 20)
    {
        cout << "Error: number must be between 0 and 20" << endl;
        return 1;
    }
    cout << n << "! = " << factorial(n) << endl;
    return 0;
}