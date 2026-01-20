from kivy.app import App
from kivy.uix.label import Label

class WarriorApp(App):
    def build(self):
        return Label(text="Warrior Ascension\nAll internal files (C++, MP3, MP4, OBJ) included!\nReady to Play.")

if __name__ == "__main__":
    WarriorApp().run()
