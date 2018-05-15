Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install SQL Server 2014 Management Studio
choco install mssqlservermanagementstudio2014express -y --version 12.2.5000.20170905

# Install SQL Server 2014
choco install mssqlserver2014express -y --version 12.2.5000.20170905