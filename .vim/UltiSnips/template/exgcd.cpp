int exgcd(int a, int b, int &x, int &y) {
    if (b == 0) {
        x = 1;
        y = 1;
        return a;
    }
    exgcd(b, a % b, y, x);
    y = y - (a / b) * x;
}

