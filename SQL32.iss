[Setup]
AppName=SQL32
AppVersion=25.9.12.1
DefaultDirName={userappdata}\SQL32
DefaultGroupName={{9C6137AF-F463-4F95-8FA1-DA23B0253E75}
OutputBaseFilename=SETUP
Compression=lzma
SolidCompression=yes
PrivilegesRequired=lowest
DisableProgramGroupPage=yes
SetupIconFile=favicon.ico
OutputDir=.
Uninstallable=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
;Name: "chinese"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

[Files]
Source: ".\favicon.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\Binaries\SQL32.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{{B9B1264C-184F-4FA3-BE31-11D90A2D9E9A}\SQL32"; Filename: "{app}\SQL32.exe"; IconFilename: "{app}\favicon.ico"
Name: "{userdesktop}\SQL32"; Filename: "{app}\SQL32.exe"; IconFilename: "{app}\favicon.ico"

[Run]
Filename: "{app}\SQL32.exe"; Description: "{cm:LaunchProgram,SQL32}"; Flags: nowait postinstall skipifsilent

[CustomMessages]
english.LaunchProgram=Run %1
spanish.LaunchProgram=Ejecutar %1
italian.LaunchProgram=Esegui %1
portuguese.LaunchProgram=Executar %1
japanese.LaunchProgram=%1 を実行
;chinese.LaunchProgram=运行 %1
