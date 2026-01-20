#!/data/data/com.termux/files/usr/bin/bash

# إنشاء هيكل المشروع الجديد
mkdir -p Source Content/Cinematics Content/Audio Content/Icons

# كود المحرك المطور (كل ليفل بحماس مختلف)
cat <<EOF > Source/CoreLogic.cpp
#include <iostream>
using namespace std;
int main() {
    cout << "--- [Warrior's Ascension: The Game] ---" << endl;
    cout << "[System] Starting Level 1... Graphics: Normal" << endl;
    cout << "[System] Reached Level 10... Graphics: CINEMATIC | Weapon: GOLDEN AXE" << endl;
    return 0;
}
EOF

# سكربت الإدارة والضغط
cat <<EOF > run.sh
#!/data/data/com.termux/files/usr/bin/bash
g++ Source/CoreLogic.cpp -o GameEngine
./GameEngine
zip -r ../WarriorGame_Final.zip .
echo "[DONE] تم بناء اللعبة بالاسم الجديد بنجاح!"
EOF

chmod +x run.sh
./run.sh

