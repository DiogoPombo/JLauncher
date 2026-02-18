JLauncher ☕🚀

A friendly, interactive launcher for Java applications on Windows.

Windows
Java
Batch
PowerShell


✨ What is JLauncher?
JLauncher is a unified launcher for Java applications on Windows, built using Batch Script, PowerShell, and a touch of VBS for sound effects.
It provides a simple, user-friendly, graphical experience for selecting and running .jar files — no terminal knowledge required.
Perfect for:
- Users who don’t want to type commands
- Developers distributing Java apps
- Anyone who wants a clean, automated way to run .jar files


✨ Features
- 🖱️ Interactive .jar selection via graphical PowerShell dialog
- 🌎 Automatic bilingual support (Portuguese 🇧🇷 / English 🇺🇸)
- 🌐 Optional URL launcher (e.g., open http://localhost:8080 after startup)
- 💾 Persistent configuration (remembers last selected JAR, URL, and delay)
- 📜 Execution logs stored in launcher.log
- 🎨 Console animations, banners, and color effects
- 🛑 Robust error handling (missing Java, missing JAR, cancellation, etc.)
- 🔊 Sound effects using VBS scripts
- ⚙️ Multiple launch modes (-s, -m, -b, etc.)


📂 Project Structure
JLauncher/
 ├── JLauncher.cmd           # Main script
 ├── LAUNCHERCORE.cmd        # Core execution logic
 ├── filelocation.ps1        # PowerShell file selector
 ├── play.vbs                # Sound effect
 ├── play2.vbs               # Sound effect
 ├── arquivo_selecionado.txt # Last selected .jar path
 ├── nome_jar.txt            # Last executed .jar name
 ├── url_config.txt          # Saved URL (optional)
 ├── delay_seconds.txt       # Browser startup delay
 └── launcher.log            # Execution logs




▶️ How to Use
- Run JLauncher.cmd
- On the first launch:
- Select a .jar file
- (Optional) Enter a URL to open after startup
- (Optional) Configure delay time
- JLauncher saves your preferences for next time
- Your application runs with:
java -jar YourFile.jar
- If a URL was configured, it will open automatically in your browser


⚙️ Requirements
- Windows 10 or 11
- Java installed and available in PATH
- PowerShell enabled
- Permission to run scripts (ExecutionPolicy bypass is handled automatically)


📜 License
Developed by Diogo Santos Pombo — © 2025
Feel free to use, modify, and improve.


💡 Why JLauncher?
Because not every user wants to type:
java -jar myapp.jar



And because Java apps deserve a friendly launcher, not a cryptic command line.
