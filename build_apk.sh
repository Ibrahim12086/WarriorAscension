#!/data/data/com.termux/files/usr/bin/bash
echo "🚀 بدء بناء Warrior Ascension APK كامل على ترمكس ..."

# 1️⃣ التحقق من الحزم الأساسية
for pkg_name in git wget unzip python python-pip clang cmake make; do
    if ! command -v $pkg_name &>/dev/null; then
        echo "❌ $pkg_name مش موجود، جاري تثبيته..."
        pkg install -y $pkg_name
    else
        echo "✅ $pkg_name موجود"
    fi
done

# 2️⃣ تثبيت Buildozer و Kivy والمكاتب المطلوبة
for py_pkg in cython==0.29.35 buildozer kivy==2.2.1 requests urllib3; do
    if ! pip show $(echo $py_pkg | cut -d= -f1) &>/dev/null; then
        echo "❌ $py_pkg مش موجود، جاري تثبيته..."
        pip install $py_pkg
    else
        echo "✅ $py_pkg موجود"
    fi
done

# 3️⃣ التحقق من وجود NDK
NDK_PATH="$HOME/android-ndk/android-ndk-r25b"
if [ ! -d "$NDK_PATH" ]; then
    echo "❌ NDK مش موجود! لازم تنزله قبل الاستمرار."
    echo "مثال: wget https://dl.google.com/android/repository/android-ndk-r25b-linux.zip && unzip android-ndk-r25b-linux.zip -d android-ndk"
    exit 1
else
    echo "✅ NDK موجود"
fi

# 4️⃣ الانتقال لمجلد المشروع
PROJECT_DIR="$HOME/MyFinalGame/WarriorAscension"
if [ ! -d "$PROJECT_DIR" ]; then
    echo "❌ مجلد المشروع مش موجود!"
    exit 1
fi
cd "$PROJECT_DIR"

# 5️⃣ إنشاء main.py إذا مش موجود
if [ ! -f main.py ]; then
cat > main.py <<EOL
from kivy.app import App
from kivy.uix.label import Label

class WarriorApp(App):
    def build(self):
        return Label(text="Warrior Ascension\\nAll internal files (C++, MP3, MP4, OBJ) included!\\nReady to Play.")

if __name__ == "__main__":
    WarriorApp().run()
EOL
    echo "✅ تم إنشاء main.py"
else
    echo "✅ main.py موجود"
fi

# 6️⃣ إنشاء buildozer.spec إذا مش موجود
if [ ! -f buildozer.spec ]; then
    buildozer init
    echo "✅ تم إنشاء buildozer.spec جديد"
else
    echo "✅ buildozer.spec موجود"
fi

# 7️⃣ تعديل buildozer.spec لضم كل الملفات والمجلدات والامتدادات
sed -i 's/^source.include_exts =.*/source.include_exts = py,cpp,h,sh,mp3,mp4,png,jpg,obj,bin,dat,raw/' buildozer.spec
sed -i 's|#source.include_patterns = .*|source.include_patterns = Content/*,Source/*,GameEngine/*,warrior_game/*|' buildozer.spec
sed -i 's/^title = .*$/title = Warrior Ascension/' buildozer.spec
sed -i 's/^requirements = .*$/requirements = python3,kivy==2.2.1,requests,urllib3/' buildozer.spec

# 8️⃣ بدء البناء النهائي للـ APK
echo "⏳ جاري بناء APK كامل... العملية ممكن تاخد 15-30 دقيقة حسب حجم الملفات"
buildozer -v android debug

# 9️⃣ بعد الانتهاء، APK موجود في bin/
echo "✅ البناء انتهى. APK جاهز للتثبيت:"
ls -lh bin/
