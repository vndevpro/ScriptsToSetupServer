Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# 7Zip - https://chocolatey.org/packages/7zip
choco install 7zip -y

# Notepad++ - https://chocolatey.org/packages/notepadplusplus.install
choco install notepadplusplus.install -y

# TreeSize Free https://chocolatey.org/packages/treesizefree
choco install treesizefree -y

# Chromium
choco install chromium -y