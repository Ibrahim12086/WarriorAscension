#include <iostream>
#include <string>

using namespace std;

int main() {
    string playerName = "Ibrahim ali";
    int gold = 5000;

    cout << "--- [أسلحة المقبرة] ---" << endl;
    cout << "ذهبك الحالي: " << gold << endl;
    cout << "1. شراء خاتم_السرعة (1000)" << endl;
    cout << "2. شراء درع_البرق (2000)" << endl;
    cout << "[System] جاري التجهيز التلقائي للمعركة..." << endl << endl;

    cout << "[BATTLE] التايتان يرتجف خوفاً منك الآن يا " << playerName << "!" << endl;
    for(int i=1; i<=3; i++) {
        cout << "الضربة " << i << " تزلزل الأرض..." << endl;
    }

    cout << endl << "[FINISH] الضربة القاضية! مبروك الفوز باللعبة!" << endl;
    cout << "(Created by " << playerName << ")" << endl;

    return 0;
}
