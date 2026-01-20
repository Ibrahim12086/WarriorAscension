#include <iostream>
#include <string>
#include <unistd.h>

using namespace std;

int main() {
    int gold = 5000;
    cout << "\033[1;33m--- [متجر أسلحة المقبرة] ---\033[0m" << endl;
    cout << "ذهبك الحالي: " << gold << endl;
    
    cout << "1. شراء خاتم_السرعة (1000)" << endl;
    cout << "2. شراء درع_البرق (2000)" << endl;
    cout << "[System] جاري التجهيز التلقائي للمعركة..." << endl;
    sleep(1);

    cout << "\n\033[1;31m[BATTLE] التايتان يرتجف خوفاً منك الآن!\033[0m" << endl;
    for(int i=0; i<3; i++) {
        cout << "الضربة " << i+1 << " تزلزل الأرض..." << endl;
        usleep(500000);
    }

    cout << "\n\033[1;32m[FINISH] الضربة القاضية! مبروك الفوز باللعبة!\033[0m" << endl;
    cout << "\033[1;30m(Created by Ibrahim ali)\033[0m" << endl;

    return 0;
}
