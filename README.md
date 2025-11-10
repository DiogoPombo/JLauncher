JLauncher ☕
A Java application launcher for Windows, built with Batch Script, that makes it easy to select and run .jar files with optional URL configuration and an interactive interface powered by PowerShell.
✨ Features
- Interactive .jar file selection through a graphical PowerShell dialog.
- Bilingual support: Portuguese 🇧🇷 and English 🇺🇸 (auto-detected from system locale).
- Option to configure a URL to open in the browser alongside the application.
- Saves the last configuration in helper files (.txt) for quick re-launch.
- Execution logs stored in launcher.log.
- Console visual effects (colors, banners, animations).
- Error handling for missing files, user cancellation, and more.
📂 Project Structure
JLauncher/
 ├── JLauncher.cmd           # Main script
 ├── LAUNCHER.CMD            # Script containing the execution logic.
 ├── LAUNCHERW10.CMD         # Script containing the execution logic for old Windows versions.
 ├── filelocation.ps1        # PowerShell script for file selection
 ├── play.vbs                # Auxiliary script for sound/effects
 ├── arquivo_selecionado.txt # Stores last selected .jar path
 ├── nome_jar.txt            # Stores last executed .jar name
 ├── url_config.txt          # Stores configured URL (if any)
 └── launcher.log            # Execution logs


▶️ How to Use
- Run JLauncher.cmd.
- On the first run:
- You will be prompted to select a .jar file.
- You can configure an optional URL (e.g., http://localhost:8080).
- The launcher saves your choices for future runs.
- The .jar will be executed with:
java -jar YourFile.jar
- If configured, the URL will be opened in your default browser.
⚙️ Requirements
- Windows (Batch + PowerShell support).
- Java installed and available in the system PATH.
- Permission to run PowerShell scripts (ExecutionPolicy Bypass is already handled in the code).
📜 License
Developed by Diogo Santos Pombo - @2025.

