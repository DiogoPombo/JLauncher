#--------------------------------------------#
# JLauncher - Unified launcher for Java apps #
#  Author: Diogo Santos Pombo - \Õ/ - @2025  #
#--------------------------------------------#

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

# Configura a janela de seleção
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
$FileBrowser.Filter = "Java (*.jar)|*.jar"
$FileBrowser.Title  = "Java APP"
$FileBrowser.CheckFileExists = $true
$FileBrowser.ValidateNames   = $true

# Mostra e processa a seleção
$result = $FileBrowser.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK -and 
    -not [string]::IsNullOrWhiteSpace($FileBrowser.FileName)) {

    $ScriptPath = Split-Path -Parent $PSCommandPath
    $OutputFile = Join-Path $ScriptPath "arquivo_selecionado.txt"

    # Grava o caminho COM quebra de linha (compatível com leitura no CMD)
    Set-Content -Path $OutputFile -Value $FileBrowser.FileName -Encoding ASCII

    exit 0   # sinaliza sucesso
}
else {
    exit 1   # sinaliza cancelamento
}