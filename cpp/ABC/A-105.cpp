#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


int main(){
    int N,K;
    cin >> N >> K;
    cout << !(N % K == 0) << endl;
}