CreateObject("Wscript.Shell").Run _
 "powershell -Command (New-Object Media.SoundPlayer 'CLAP.wav').Play(); Start-Sleep 20", 0, False