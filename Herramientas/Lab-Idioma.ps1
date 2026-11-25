$script:LabSupportedLanguages = @("en", "es", "fr", "ro", "de")
$script:LabLanguage = "en"
$script:LabTranslations = @{
    en = @{
        PressEnterContinue = "Press ENTER to continue"
        PressEnterExit = "Press ENTER to exit"
        Option = "Option"
        Number = "Number"
        InvalidNumber = "Invalid number."
        InvalidOption = "Invalid option."
        YesNoInvalid = "Answer Y or N."
        Cancelled = "Cancelled."
        ErrorPrefix = "ERROR: {0}"
        Log = "Log"
        YesText = "YES"
        NoShort = "N"
        CommandLabel = "CMD"
        WarningLabel = "WARN"
        ErrorLabel = "ERROR"
        NoText = "NO"
        Low = "LOW"
        Medium = "MEDIUM"
        High = "HIGH"
        Copy = "Copy"
        Back = "Back"
        CopiedClipboard = "Copied to clipboard."
        NotCopied = "I could not copy automatically. Select the command and press Ctrl+C."
        LanguageEnglish = "English"
        LanguageSpanish = "Spanish"
        LanguageFrench = "French"
        LanguageRomanian = "Romanian"
        LanguageGerman = "German"
        LanguageBadge = "EN - English"
        EnterKeyName = "ENTER"
        StepWord = "Step"
        UsbColHeader = "USB"
        UsbSpeedWarnTitle = "USB 2.0 connection detected"
        UsbSpeedWarnBody = "Writing large Windows images (install.wim / boot.wim) over USB 2.0 is very slow."
        UsbSpeedRecommend = "Recommendation: connect the USB drive to a USB 3.0 / 3.1 / 3.2 (SuperSpeed) port before continuing."
        UsbSpeedSuperCapableNote = "Note: this USB drive supports USB 3.x SuperSpeed, but the current port or cable is limiting it to USB 2.0."
        UsbSpeedDiskLabel = "Disk"
        UsbSpeedVolumeLabel = "Volume"
        UsbSpeedSerialLabel = "Serial number"
        UsbSpeedCurrentLabel = "Negotiated speed"
        UsbSpeedOpt1 = "[1] Re-check after switching USB port (ENTER = default, relocates by serial)"
        UsbSpeedOpt2 = "[2] Continue anyway on USB 2.0 (at your own responsibility)"
        UsbSpeedOpt0 = "[0] Cancel"
        UsbSpeedPrompt = "Option [ENTER = 1]"
        UsbSpeedSearching = "Refreshing storage and relocating USB drive..."
        UsbSpeedNotFoundRetry = "USB drive ({0}) was not detected yet. Make sure it is connected and press 1 / ENTER again."
        UsbSpeedRelocatedOk = "USB drive relocated: {0} -> {1}"
        UsbSpeedStillUsb2 = "Drive detected ({0}), but the current port is still negotiating at USB 2.0."
        UsbSpeedContinuedUsb2 = "Continuing on USB 2.0 by user choice."
        UsbNoSerial = "no serial"
    }
    es = @{
        PressEnterContinue = "Pulsa INTRO para continuar"
        PressEnterExit = "Pulsa INTRO para salir"
        Option = "Opción"
        Number = "Número"
        InvalidNumber = "Número no válido."
        InvalidOption = "Opción no válida."
        YesNoInvalid = "Responde S o N."
        Cancelled = "Cancelado."
        ErrorPrefix = "ERROR: {0}"
        Log = "Registro"
        YesText = "SÍ"
        NoShort = "N"
        CommandLabel = "COMANDO"
        WarningLabel = "AVISO"
        ErrorLabel = "ERROR"
        NoText = "NO"
        Low = "BAJO"
        Medium = "MEDIO"
        High = "ALTO"
        Copy = "Copiar"
        Back = "Volver"
        CopiedClipboard = "Copiado al portapapeles."
        NotCopied = "No pude copiar automáticamente. Selecciona el comando y pulsa Ctrl+C."
        LanguageEnglish = "Inglés"
        LanguageSpanish = "Español"
        LanguageFrench = "Francés"
        LanguageRomanian = "Rumano"
        LanguageGerman = "Alemán"
        LanguageBadge = "ES - Español"
        EnterKeyName = "INTRO"
        StepWord = "Paso"
        UsbColHeader = "USB"
        UsbSpeedWarnTitle = "Conexión USB 2.0 detectada"
        UsbSpeedWarnBody = "La escritura de imágenes grandes de Windows (install.wim / boot.wim) por USB 2.0 es muy lenta."
        UsbSpeedRecommend = "Recomendación: conecta la unidad a un puerto USB 3.0 / 3.1 / 3.2 (SuperSpeed) antes de continuar."
        UsbSpeedSuperCapableNote = "Nota: esta unidad soporta USB 3.x SuperSpeed, pero el puerto o cable actual la está limitando a USB 2.0."
        UsbSpeedDiskLabel = "Disco"
        UsbSpeedVolumeLabel = "Volumen"
        UsbSpeedSerialLabel = "Número de serie"
        UsbSpeedCurrentLabel = "Velocidad negociada"
        UsbSpeedOpt1 = "[1] Volver a comprobar tras cambiar de puerto USB (INTRO = por defecto, relocaliza por n.º de serie)"
        UsbSpeedOpt2 = "[2] Continuar igualmente en USB 2.0 (bajo tu responsabilidad)"
        UsbSpeedOpt0 = "[0] Cancelar"
        UsbSpeedPrompt = "Opción [INTRO = 1]"
        UsbSpeedSearching = "Refrescando almacenamiento y relocalizando la unidad USB..."
        UsbSpeedNotFoundRetry = "La unidad USB ({0}) aún no se detecta. Conéctala bien y pulsa 1 / INTRO de nuevo."
        UsbSpeedRelocatedOk = "Unidad USB relocalizada: {0} -> {1}"
        UsbSpeedStillUsb2 = "Unidad detectada ({0}), pero este puerto sigue negociando en USB 2.0."
        UsbSpeedContinuedUsb2 = "Continuando en USB 2.0 bajo responsabilidad del usuario."
        UsbNoSerial = "sin serie"
    }
    fr = @{
        PressEnterContinue = "Appuyez sur ENTRÉE pour continuer"
        PressEnterExit = "Appuyez sur ENTRÉE pour quitter"
        Option = "Option"
        Number = "Numéro"
        InvalidNumber = "Numéro invalide."
        InvalidOption = "Option invalide."
        YesNoInvalid = "Répondez O ou N."
        Cancelled = "Annulé."
        ErrorPrefix = "ERREUR: {0}"
        Log = "Journal"
        YesText = "OUI"
        NoShort = "N"
        CommandLabel = "COMMANDE"
        WarningLabel = "AVERTISSEMENT"
        ErrorLabel = "ERREUR"
        NoText = "NON"
        Low = "FAIBLE"
        Medium = "MOYEN"
        High = "ÉLEVÉ"
        Copy = "Copier"
        Back = "Retour"
        CopiedClipboard = "Copié dans le presse-papiers."
        NotCopied = "Copie automatique impossible. Sélectionnez la commande et appuyez sur Ctrl+C."
        LanguageEnglish = "Anglais"
        LanguageSpanish = "Espagnol"
        LanguageFrench = "Français"
        LanguageRomanian = "Roumain"
        LanguageGerman = "Allemand"
        LanguageBadge = "FR - Français"
        EnterKeyName = "ENTRÉE"
        StepWord = "Étape"
        UsbColHeader = "USB"
        UsbSpeedWarnTitle = "Connexion USB 2.0 détectée"
        UsbSpeedWarnBody = "L'écriture de grandes images Windows (install.wim / boot.wim) en USB 2.0 est très lente."
        UsbSpeedRecommend = "Recommandation : branchez la clé sur un port USB 3.0 / 3.1 / 3.2 (SuperSpeed) avant de continuer."
        UsbSpeedSuperCapableNote = "Note : cette clé prend en charge l'USB 3.x SuperSpeed, mais le port ou câble actuel la limite à l'USB 2.0."
        UsbSpeedDiskLabel = "Disque"
        UsbSpeedVolumeLabel = "Volume"
        UsbSpeedSerialLabel = "Numéro de série"
        UsbSpeedCurrentLabel = "Vitesse négociée"
        UsbSpeedOpt1 = "[1] Revérifier après changement de port USB (ENTRÉE = par défaut, relocalise par n° de série)"
        UsbSpeedOpt2 = "[2] Continuer quand même en USB 2.0 (sous votre responsabilité)"
        UsbSpeedOpt0 = "[0] Annuler"
        UsbSpeedPrompt = "Option [ENTRÉE = 1]"
        UsbSpeedSearching = "Actualisation du stockage et relocalisation de la clé USB..."
        UsbSpeedNotFoundRetry = "La clé USB ({0}) n'est pas encore détectée. Branchez-la bien et appuyez à nouveau sur 1 / ENTRÉE."
        UsbSpeedRelocatedOk = "Clé USB relocalisée : {0} -> {1}"
        UsbSpeedStillUsb2 = "Clé détectée ({0}), mais ce port négocie toujours en USB 2.0."
        UsbSpeedContinuedUsb2 = "Poursuite en USB 2.0 sous la responsabilité de l'utilisateur."
        UsbNoSerial = "sans série"
    }
    ro = @{
        PressEnterContinue = "Apasă ENTER pentru a continua"
        PressEnterExit = "Apasă ENTER pentru ieșire"
        Option = "Opțiune"
        Number = "Număr"
        InvalidNumber = "Număr invalid."
        InvalidOption = "Opțiune invalidă."
        YesNoInvalid = "Răspunde D sau N."
        Cancelled = "Anulat."
        ErrorPrefix = "EROARE: {0}"
        Log = "Jurnal"
        YesText = "DA"
        NoShort = "N"
        CommandLabel = "COMANDĂ"
        WarningLabel = "AVERTIZARE"
        ErrorLabel = "EROARE"
        NoText = "NU"
        Low = "SCĂZUT"
        Medium = "MEDIU"
        High = "RIDICAT"
        Copy = "Copiază"
        Back = "Înapoi"
        CopiedClipboard = "Copiat în clipboard."
        NotCopied = "Nu am putut copia automat. Selectează comanda și apasă Ctrl+C."
        LanguageEnglish = "Engleză"
        LanguageSpanish = "Spaniolă"
        LanguageFrench = "Franceză"
        LanguageRomanian = "Română"
        LanguageGerman = "Germană"
        LanguageBadge = "RO - Română"
        EnterKeyName = "ENTER"
        StepWord = "Pasul"
        UsbColHeader = "USB"
        UsbSpeedWarnTitle = "Conexiune USB 2.0 detectată"
        UsbSpeedWarnBody = "Scrierea imaginilor mari Windows (install.wim / boot.wim) prin USB 2.0 este foarte lentă."
        UsbSpeedRecommend = "Recomandare: conectează unitatea la un port USB 3.0 / 3.1 / 3.2 (SuperSpeed) înainte de a continua."
        UsbSpeedSuperCapableNote = "Notă: această unitate suportă USB 3.x SuperSpeed, dar portul sau cablul actual o limitează la USB 2.0."
        UsbSpeedDiskLabel = "Disc"
        UsbSpeedVolumeLabel = "Volum"
        UsbSpeedSerialLabel = "Număr de serie"
        UsbSpeedCurrentLabel = "Viteză negociată"
        UsbSpeedOpt1 = "[1] Reverifică după schimbarea portului USB (ENTER = implicit, relocalizează după serie)"
        UsbSpeedOpt2 = "[2] Continuă totuși pe USB 2.0 (pe propria răspundere)"
        UsbSpeedOpt0 = "[0] Anulare"
        UsbSpeedPrompt = "Opțiune [ENTER = 1]"
        UsbSpeedSearching = "Se reîmprospătează stocarea și se relocalizează unitatea USB..."
        UsbSpeedNotFoundRetry = "Unitatea USB ({0}) nu a fost detectată încă. Conecteaz-o bine și apasă din nou 1 / ENTER."
        UsbSpeedRelocatedOk = "Unitate USB relocalizată: {0} -> {1}"
        UsbSpeedStillUsb2 = "Unitate detectată ({0}), dar acest port negociază în continuare la USB 2.0."
        UsbSpeedContinuedUsb2 = "Se continuă pe USB 2.0 pe răspunderea utilizatorului."
        UsbNoSerial = "fără serie"
    }
    de = @{
        PressEnterContinue = "EINGABETASTE drücken zum Fortfahren"
        PressEnterExit = "EINGABETASTE drücken zum Beenden"
        Option = "Option"
        Number = "Nummer"
        InvalidNumber = "Ungültige Nummer."
        InvalidOption = "Ungültige Option."
        YesNoInvalid = "Antworten Sie J oder N."
        Cancelled = "Abgebrochen."
        ErrorPrefix = "FEHLER: {0}"
        Log = "Protokoll"
        YesText = "JA"
        NoShort = "N"
        CommandLabel = "BEFEHL"
        WarningLabel = "WARNUNG"
        ErrorLabel = "FEHLER"
        NoText = "NEIN"
        Low = "NIEDRIG"
        Medium = "MITTEL"
        High = "HOCH"
        Copy = "Kopieren"
        Back = "Zurück"
        CopiedClipboard = "In die Zwischenablage kopiert."
        NotCopied = "Automatisches Kopieren nicht möglich. Befehl markieren und Ctrl+C drücken."
        LanguageEnglish = "Englisch"
        LanguageSpanish = "Spanisch"
        LanguageFrench = "Französisch"
        LanguageRomanian = "Rumänisch"
        LanguageGerman = "Deutsch"
        LanguageBadge = "DE - Deutsch"
        EnterKeyName = "EINGABE"
        StepWord = "Schritt"
        UsbColHeader = "USB"
        UsbSpeedWarnTitle = "USB-2.0-Verbindung erkannt"
        UsbSpeedWarnBody = "Das Schreiben großer Windows-Images (install.wim / boot.wim) über USB 2.0 ist sehr langsam."
        UsbSpeedRecommend = "Empfehlung: Schließen Sie das Laufwerk vor dem Fortfahren an einen USB 3.0 / 3.1 / 3.2 (SuperSpeed) Anschluss an."
        UsbSpeedSuperCapableNote = "Hinweis: Dieses Laufwerk unterstützt USB 3.x SuperSpeed, wird aber durch Anschluss oder Kabel auf USB 2.0 begrenzt."
        UsbSpeedDiskLabel = "Datenträger"
        UsbSpeedVolumeLabel = "Volume"
        UsbSpeedSerialLabel = "Seriennummer"
        UsbSpeedCurrentLabel = "Ausgehandelte Geschwindigkeit"
        UsbSpeedOpt1 = "[1] Nach Wechsel des USB-Anschlusses erneut prüfen (EINGABE = Standard, erkennt per Seriennummer)"
        UsbSpeedOpt2 = "[2] Trotzdem mit USB 2.0 fortfahren (auf eigene Verantwortung)"
        UsbSpeedOpt0 = "[0] Abbrechen"
        UsbSpeedPrompt = "Option [EINGABE = 1]"
        UsbSpeedSearching = "Speicher wird aktualisiert und USB-Laufwerk neu gesucht..."
        UsbSpeedNotFoundRetry = "USB-Laufwerk ({0}) wurde noch nicht erkannt. Bitte richtig anschließen und erneut 1 / EINGABE drücken."
        UsbSpeedRelocatedOk = "USB-Laufwerk neu erkannt: {0} -> {1}"
        UsbSpeedStillUsb2 = "Laufwerk erkannt ({0}), aber dieser Anschluss arbeitet weiterhin mit USB 2.0."
        UsbSpeedContinuedUsb2 = "Fortfahren mit USB 2.0 auf eigene Verantwortung."
        UsbNoSerial = "keine Seriennr."
    }
}

function Initialize-LabLanguage {
    param([string]$Language)

    if ([string]::IsNullOrWhiteSpace($Language)) {
        $Language = $env:LAB_WIN11_LANG
    }
    if ([string]::IsNullOrWhiteSpace($Language)) {
        $Language = "en"
    }

    $Language = $Language.Trim().ToLowerInvariant()
    if ($script:LabSupportedLanguages -notcontains $Language) {
        $Language = "en"
    }

    $script:LabLanguage = $Language
    $env:LAB_WIN11_LANG = $Language
    return $script:LabLanguage
}

function Add-LabTranslations {
    param([hashtable]$Translations)

    foreach ($languageKey in $Translations.Keys) {
        if (-not $script:LabTranslations.ContainsKey($languageKey)) {
            $script:LabTranslations[$languageKey] = @{}
        }

        foreach ($textKey in $Translations[$languageKey].Keys) {
            $script:LabTranslations[$languageKey][$textKey] = $Translations[$languageKey][$textKey]
        }
    }
}

function Get-LabLanguage {
    return $script:LabLanguage
}

function Get-LabLanguageDisplay {
    return (Get-LabText "LanguageBadge")
}

function Get-LabText {
    param([string]$Key)

    $language = $script:LabLanguage
    if ($script:LabTranslations.ContainsKey($language) -and $script:LabTranslations[$language].ContainsKey($Key)) {
        return $script:LabTranslations[$language][$Key]
    }
    if ($script:LabTranslations["en"].ContainsKey($Key)) {
        return $script:LabTranslations["en"][$Key]
    }
    return $Key
}

function Format-LabText {
    param(
        [string]$Key,
        [Parameter(ValueFromRemainingArguments = $true)]
        [object[]]$Args
    )

    return [string]::Format((Get-LabText $Key), $Args)
}

function Read-LabHost {
    param(
        [string]$Key,
        [Parameter(ValueFromRemainingArguments = $true)]
        [object[]]$Args
    )

    return Read-Host (Format-LabText $Key @Args)
}

function Confirm-LabYesNo {
    param(
        [string]$Question,
        [bool]$Default = $true
    )

    $language = Get-LabLanguage
    $yesKeys = @{
        en = "Y"
        es = "S"
        fr = "O"
        ro = "D"
        de = "J"
    }
    $yesKey = $yesKeys[$language]
    if (-not $yesKey) { $yesKey = "Y" }
    $enterKey = Get-LabText "EnterKeyName"
    $suffix = if ($Default) {
        "[{0} = {1} / {2}]" -f $enterKey, $yesKey, (Get-LabText "NoShort").ToLowerInvariant()
    } else {
        "[{0} = {1} / {2}]" -f $enterKey, (Get-LabText "NoShort").ToUpperInvariant(), $yesKey.ToLowerInvariant()
    }

    while ($true) {
        $rawAnswer = Read-Host "$Question $suffix"
        $answer = if ($null -ne $rawAnswer) { $rawAnswer.Trim() } else { "" }
        if ([string]::IsNullOrWhiteSpace($answer)) { return $Default }
        if ($answer -match "^[sSyYoOdDjJ]$") { return $true }
        if ($answer -match "^[nN]$") { return $false }
        Write-Host (Get-LabText "YesNoInvalid") -ForegroundColor Yellow
    }
}

function Initialize-LabConsoleNative {
    if ($null -ne ("LabConsoleNative" -as [type])) {
        return
    }

    $consoleNativeSource = @"
using System;
using System.Runtime.InteropServices;

public static class LabConsoleNative
{
    private const int STD_OUTPUT_HANDLE = -11;
    private const uint ENABLE_VIRTUAL_TERMINAL_PROCESSING = 0x0004;
    private const uint MONITOR_DEFAULTTONEAREST = 2;
    private const uint SWP_NOSIZE = 0x0001;
    private const uint SWP_NOZORDER = 0x0004;
    private const uint SWP_NOACTIVATE = 0x0010;

    [StructLayout(LayoutKind.Sequential)]
    private struct RECT
    {
        public int Left;
        public int Top;
        public int Right;
        public int Bottom;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    private struct MONITORINFO
    {
        public int cbSize;
        public RECT rcMonitor;
        public RECT rcWork;
        public uint dwFlags;
    }

    [DllImport("kernel32.dll", SetLastError = true)]
    private static extern IntPtr GetStdHandle(int nStdHandle);

    [DllImport("kernel32.dll", SetLastError = true)]
    private static extern bool GetConsoleMode(IntPtr hConsoleHandle, out uint lpMode);

    [DllImport("kernel32.dll", SetLastError = true)]
    private static extern bool SetConsoleMode(IntPtr hConsoleHandle, uint dwMode);

    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern bool WriteConsoleW(IntPtr hConsoleOutput, string lpBuffer, uint nNumberOfCharsToWrite, out uint lpNumberOfCharsWritten, IntPtr lpReserved);

    [DllImport("kernel32.dll")]
    private static extern IntPtr GetConsoleWindow();

    [DllImport("user32.dll")]
    private static extern bool IsWindowVisible(IntPtr hWnd);

    [DllImport("user32.dll")]
    private static extern bool IsZoomed(IntPtr hWnd);

    [DllImport("user32.dll", SetLastError = true)]
    private static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);

    [DllImport("user32.dll")]
    private static extern IntPtr MonitorFromWindow(IntPtr hwnd, uint dwFlags);

    [DllImport("user32.dll", CharSet = CharSet.Unicode)]
    private static extern bool GetMonitorInfoW(IntPtr hMonitor, ref MONITORINFO lpmi);

    [DllImport("user32.dll", CharSet = CharSet.Unicode)]
    private static extern int GetClassNameW(IntPtr hWnd, System.Text.StringBuilder lpClassName, int nMaxCount);

    [DllImport("user32.dll", SetLastError = true)]
    private static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);

    public static bool IsConPtyOrTerminalHost()
    {
        IntPtr hwnd = GetConsoleWindow();
        if (hwnd == IntPtr.Zero) return true;
        if (!IsWindowVisible(hwnd)) return true;

        System.Text.StringBuilder sb = new System.Text.StringBuilder(64);
        if (GetClassNameW(hwnd, sb, sb.Capacity) > 0)
        {
            string cls = sb.ToString();
            if (cls.IndexOf("PseudoConsole", StringComparison.OrdinalIgnoreCase) >= 0)
            {
                return true;
            }
        }
        return false;
    }

    public static bool TryResizeVirtualTerminal(int cols, int rows)
    {
        if (cols < 40 || rows < 15) return false;
        IntPtr hOut = GetStdHandle(STD_OUTPUT_HANDLE);
        if (hOut == IntPtr.Zero || hOut == new IntPtr(-1)) return false;

        uint mode = 0;
        if (!GetConsoleMode(hOut, out mode)) return false;

        if ((mode & ENABLE_VIRTUAL_TERMINAL_PROCESSING) == 0)
        {
            if (!SetConsoleMode(hOut, mode | ENABLE_VIRTUAL_TERMINAL_PROCESSING))
            {
                return false;
            }
        }

        string seq = string.Format("\x1b[8;{0};{1}t", rows, cols);
        uint written = 0;
        return WriteConsoleW(hOut, seq, (uint)seq.Length, out written, IntPtr.Zero);
    }

    public static void EnsureWindowWithinWorkArea()
    {
        IntPtr hwnd = GetConsoleWindow();
        if (hwnd == IntPtr.Zero || !IsWindowVisible(hwnd) || IsZoomed(hwnd)) return;

        RECT rect;
        if (!GetWindowRect(hwnd, out rect)) return;

        IntPtr hMon = MonitorFromWindow(hwnd, MONITOR_DEFAULTTONEAREST);
        if (hMon == IntPtr.Zero) return;

        MONITORINFO mi = new MONITORINFO();
        mi.cbSize = Marshal.SizeOf(typeof(MONITORINFO));
        if (!GetMonitorInfoW(hMon, ref mi)) return;

        int w = rect.Right - rect.Left;
        int h = rect.Bottom - rect.Top;
        int newX = rect.Left;
        int newY = rect.Top;

        if (newX + w > mi.rcWork.Right) newX = mi.rcWork.Right - w;
        if (newY + h > mi.rcWork.Bottom) newY = mi.rcWork.Bottom - h;
        if (newX < mi.rcWork.Left) newX = mi.rcWork.Left;
        if (newY < mi.rcWork.Top) newY = mi.rcWork.Top;

        if (newX != rect.Left || newY != rect.Top)
        {
            SetWindowPos(hwnd, IntPtr.Zero, newX, newY, 0, 0, SWP_NOSIZE | SWP_NOZORDER | SWP_NOACTIVATE);
        }
    }
}
"@

    try {
        Add-Type -TypeDefinition $consoleNativeSource -Language CSharp -ErrorAction Stop
    }
    catch {
    }
}

function Set-LabConsoleWindowSize {
    param(
        [int]$MinWidth = 112,
        [int]$MinHeight = 41,
        [int]$BufferHeight = 3000
    )

    try {
        if ([Console]::IsOutputRedirected) {
            return
        }
    }
    catch {
        return
    }

    if ($MinWidth -lt 60) { $MinWidth = 60 }
    if ($MinHeight -lt 24) { $MinHeight = 24 }
    if ($BufferHeight -lt $MinHeight) { $BufferHeight = $MinHeight }

    $targetWidth = $MinWidth
    $targetHeight = $MinHeight
    $resizedViaRawUi = $false

    try {
        $rawUi = $Host.UI.RawUI
        if ($null -ne $rawUi) {
            $maxW = 0
            $maxH = 0
            try {
                $maxPhys = $rawUi.MaxPhysicalWindowSize
                if ($null -ne $maxPhys) {
                    $maxW = [int]$maxPhys.Width
                    $maxH = [int]$maxPhys.Height
                }
            }
            catch {
            }

            if ($maxW -le 0) {
                try { $maxW = [int][Console]::LargestWindowWidth } catch { $maxW = 0 }
            }
            if ($maxH -le 0) {
                try { $maxH = [int][Console]::LargestWindowHeight } catch { $maxH = 0 }
            }

            $usableMaxW = if ($maxW -gt 64) { $maxW - 2 } elseif ($maxW -gt 0) { $maxW } else { 140 }
            $usableMaxH = if ($maxH -gt 26) { $maxH - 2 } elseif ($maxH -gt 0) { $maxH } else { 52 }

            $curWin = $rawUi.WindowSize
            $curBuf = $rawUi.BufferSize

            $targetWidth = [Math]::Min([Math]::Max([int]$curWin.Width, $MinWidth), $usableMaxW)
            $targetHeight = [Math]::Min([Math]::Max([int]$curWin.Height, $MinHeight), $usableMaxH)

            $targetBufW = $targetWidth
            $targetBufH = [Math]::Min(9999, [Math]::Max([Math]::Max([int]$curBuf.Height, $BufferHeight), $targetHeight))

            if ([int]$curWin.Width -ne $targetWidth -or [int]$curWin.Height -ne $targetHeight -or [int]$curBuf.Width -ne $targetBufW) {
                try {
                    $curPos = $rawUi.WindowPosition
                    if ($null -ne $curPos -and [int]$curPos.X -gt 0) {
                        $rawUi.WindowPosition = New-Object System.Management.Automation.Host.Coordinates(0, [int]$curPos.Y)
                    }
                }
                catch {
                }

                if ([int]$curWin.Width -gt $targetBufW -or [int]$curWin.Height -gt $targetBufH) {
                    $shrinkW = [Math]::Min([int]$curWin.Width, $targetBufW)
                    $shrinkH = [Math]::Min([int]$curWin.Height, $targetBufH)
                    try {
                        $rawUi.WindowSize = New-Object System.Management.Automation.Host.Size($shrinkW, $shrinkH)
                    }
                    catch {
                    }
                }

                try {
                    $rawUi.BufferSize = New-Object System.Management.Automation.Host.Size($targetBufW, $targetBufH)
                }
                catch {
                }

                try {
                    $rawUi.WindowSize = New-Object System.Management.Automation.Host.Size($targetWidth, $targetHeight)
                }
                catch {
                }
            }

            $afterWin = $rawUi.WindowSize
            $resizedViaRawUi = ([int]$afterWin.Width -ge $targetWidth -and [int]$afterWin.Height -ge $targetHeight)
        }
    }
    catch {
    }

    try {
        Initialize-LabConsoleNative
        if ($null -ne ("LabConsoleNative" -as [type])) {
            $isTerminalOrConPty = (-not [string]::IsNullOrWhiteSpace($env:WT_SESSION)) -or [LabConsoleNative]::IsConPtyOrTerminalHost()
            if ($isTerminalOrConPty -or (-not $resizedViaRawUi)) {
                [void][LabConsoleNative]::TryResizeVirtualTerminal($targetWidth, $targetHeight)
            }
            else {
                [LabConsoleNative]::EnsureWindowWithinWorkArea()
            }
        }
    }
    catch {
    }
}

function Set-LabConsoleStyle {
    try {
        [Console]::BackgroundColor = [ConsoleColor]::Black
        [Console]::ForegroundColor = [ConsoleColor]::Gray
    }
    catch {
    }

    try {
        $rawUi = $Host.UI.RawUI
        $rawUi.BackgroundColor = [ConsoleColor]::Black
        $rawUi.ForegroundColor = [ConsoleColor]::Gray
    }
    catch {
    }
}

function Get-LabConsoleWidth {
    try {
        $width = [int]$Host.UI.RawUI.WindowSize.Width
        if ($width -lt 56) { return 56 }
        if ($width -gt 120) { return 120 }
        return ($width - 1)
    }
    catch {
        return 76
    }
}

function New-LabSeparator {
    param(
        [string]$Character = "=",
        [object]$Width = $null
    )

    if ([string]::IsNullOrEmpty($Character)) {
        $Character = "="
    }

    if ($null -ne $Width -and $Width -ne "") {
        try {
            $targetWidth = [int]$Width
        }
        catch {
            $targetWidth = Get-LabConsoleWidth
        }
    }
    else {
        $targetWidth = Get-LabConsoleWidth
    }

    if ($targetWidth -lt 20) { $targetWidth = 20 }
    return ($Character.Substring(0, 1) * $targetWidth)
}

function Write-LabBanner {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Title,
        [string]$Subtitle = "",
        [string]$Badge = "",
        [ConsoleColor]$Color = [ConsoleColor]::Cyan,
        [switch]$CompactTop
    )

    $width = Get-LabConsoleWidth
    $effectiveBadge = if ([string]::IsNullOrWhiteSpace($Badge)) { Get-LabLanguageDisplay } else { $Badge }
    $badgeToken = "[{0}]" -f $effectiveBadge

    if (-not $CompactTop) {
        Write-Host ""
    }
    Write-Host (New-LabSeparator "=" $width) -ForegroundColor DarkCyan

    $leftTitle = "  {0}" -f $Title.Trim()
    $spaceCount = $width - $leftTitle.Length - $badgeToken.Length - 2
    if ($spaceCount -ge 2) {
        Write-Host -NoNewline $leftTitle -ForegroundColor $Color
        Write-Host -NoNewline (" " * $spaceCount)
        Write-Host ("{0}  " -f $badgeToken) -ForegroundColor Yellow
    }
    else {
        Write-Host $leftTitle -ForegroundColor $Color
        Write-Host ("  {0}" -f $badgeToken) -ForegroundColor Yellow
    }

    if (-not [string]::IsNullOrWhiteSpace($Subtitle)) {
        Write-Host ("  {0}" -f $Subtitle.Trim()) -ForegroundColor DarkGray
    }

    Write-Host (New-LabSeparator "=" $width) -ForegroundColor DarkCyan
}

function Write-LabStepHeader {
    param(
        [Parameter(Mandatory = $true)]
        [int]$Step,
        [Parameter(Mandatory = $true)]
        [int]$TotalSteps,
        [Parameter(Mandatory = $true)]
        [string]$Title,
        [ConsoleColor]$Color = [ConsoleColor]::Cyan
    )

    $stepTag = "[{0} {1}/{2}]" -f (Get-LabText "StepWord"), $Step, $TotalSteps
    Write-Host ""
    Write-Host (New-LabSeparator "-") -ForegroundColor DarkGray
    Write-Host -NoNewline ("{0} " -f $stepTag) -ForegroundColor Yellow
    Write-Host $Title -ForegroundColor $Color
}

function Write-LabStatusPanel {
    param(
        [string]$Title = "",
        [Parameter(Mandatory = $true)]
        [object]$Items,
        [ConsoleColor]$TitleColor = [ConsoleColor]::Cyan,
        [ConsoleColor]$BorderColor = [ConsoleColor]::DarkGray
    )

    $rows = [System.Collections.Generic.List[object]]::new()
    $tmpEntries = [System.Collections.Generic.List[object]]::new()
    $handledAsDict = $false

    $rawItems = $Items
    if ($null -ne $rawItems -and $rawItems -is [psobject]) {
        $rawItems = $rawItems.PSObject.BaseObject
    }

    if ($null -eq $rawItems) {
        $handledAsDict = $true
    }
    elseif ($rawItems -is [System.Collections.IDictionary]) {
        if ($rawItems.Contains("Label") -and $rawItems.Contains("Value")) {
            $tmpEntries.Add($rawItems)
        }
        else {
            $handledAsDict = $true
            foreach ($key in $rawItems.Keys) {
                $val = $rawItems[$key]
                $rows.Add([pscustomobject]@{
                    Label = [string]$key
                    Value = if ($null -eq $val) { "" } else { [string]$val }
                    Color = [ConsoleColor]::Gray
                })
            }
        }
    }
    elseif (($rawItems -is [System.Collections.IEnumerable]) -and -not ($rawItems -is [string])) {
        $enumerator = ([System.Collections.IEnumerable]$rawItems).GetEnumerator()
        while ($enumerator.MoveNext()) {
            $tmpEntries.Add($enumerator.Current)
        }
    }
    else {
        $tmpEntries.Add($rawItems)
    }

    if (-not $handledAsDict) {
        for ($idx = 0; $idx -lt $tmpEntries.Count; $idx++) {
            $entry = $tmpEntries[$idx]
            if ($null -eq $entry) { continue }
            $rawEntry = $entry
            if ($rawEntry -is [psobject] -and $rawEntry.PSObject.BaseObject -is [System.Collections.IDictionary]) {
                $rawEntry = $rawEntry.PSObject.BaseObject
            }
            if ($rawEntry -is [System.Collections.IDictionary]) {
                $lbl = if ($rawEntry.Contains("Label") -and $null -ne $rawEntry["Label"]) { [string]$rawEntry["Label"] } elseif ($rawEntry.Contains("Key") -and $null -ne $rawEntry["Key"]) { [string]$rawEntry["Key"] } else { "" }
                $val = if ($rawEntry.Contains("Value") -and $null -ne $rawEntry["Value"]) { [string]$rawEntry["Value"] } else { "" }
                $clr = [ConsoleColor]::Gray
                if ($rawEntry.Contains("Color") -and $null -ne $rawEntry["Color"]) {
                    try { $clr = [ConsoleColor]$rawEntry["Color"] } catch { $clr = [ConsoleColor]::Gray }
                }
                $rows.Add([pscustomobject]@{ Label = $lbl; Value = $val; Color = $clr })
            }
            else {
                $lblProp = $entry.PSObject.Properties["Label"]
                $valProp = $entry.PSObject.Properties["Value"]
                $clrProp = $entry.PSObject.Properties["Color"]
                $lbl = if ($lblProp -and $null -ne $lblProp.Value) { [string]$lblProp.Value } else { "" }
                $val = if ($valProp -and $null -ne $valProp.Value) { [string]$valProp.Value } else { "" }
                $clr = [ConsoleColor]::Gray
                if ($clrProp -and $null -ne $clrProp.Value) {
                    try { $clr = [ConsoleColor]$clrProp.Value } catch { $clr = [ConsoleColor]::Gray }
                }
                $rows.Add([pscustomobject]@{ Label = $lbl; Value = $val; Color = $clr })
            }
        }
    }

    $rowArray = $rows.ToArray()
    $width = Get-LabConsoleWidth
    Write-Host ""
    Write-Host (New-LabSeparator "-" $width) -ForegroundColor $BorderColor
    if (-not [string]::IsNullOrWhiteSpace($Title)) {
        Write-Host ("  {0}" -f $Title) -ForegroundColor $TitleColor
        Write-Host (New-LabSeparator "-" $width) -ForegroundColor $BorderColor
    }

    $maxLabel = 0
    foreach ($row in $rowArray) {
        if ($row.Label.Length -gt $maxLabel) {
            $maxLabel = $row.Label.Length
        }
    }
    if ($maxLabel -lt 8) { $maxLabel = 8 }

    foreach ($row in $rowArray) {
        $padded = $row.Label.PadRight($maxLabel)
        Write-Host -NoNewline ("  {0} : " -f $padded) -ForegroundColor DarkCyan
        Write-Host $row.Value -ForegroundColor $row.Color
    }

    Write-Host (New-LabSeparator "-" $width) -ForegroundColor $BorderColor
}

function Write-LabSection {
    param(
        [string]$Title,
        [ConsoleColor]$Color = [ConsoleColor]::Cyan
    )

    Write-Host ""
    Write-Host (New-LabSeparator "=") -ForegroundColor DarkGray
    Write-Host $Title -ForegroundColor $Color
    Write-Host (New-LabSeparator "=") -ForegroundColor DarkGray
}

function Write-LabSubsection {
    param(
        [string]$Title,
        [ConsoleColor]$Color = [ConsoleColor]::Cyan
    )

    Write-Host ""
    Write-Host (New-LabSeparator "-") -ForegroundColor DarkGray
    Write-Host $Title -ForegroundColor $Color
}

function Write-LabInfo {
    param(
        [string]$Message,
        [ConsoleColor]$Color = [ConsoleColor]::Gray
    )

    Write-Host ("[INFO] {0}" -f $Message) -ForegroundColor $Color
}

function Write-LabOk {
    param([string]$Message)

    Write-Host ("[OK] {0}" -f $Message) -ForegroundColor Green
}

function Write-LabWarning {
    param([string]$Message)

    Write-Host ("[{0}] {1}" -f (Get-LabText "WarningLabel"), $Message) -ForegroundColor Yellow
}

function Write-LabError {
    param([string]$Message)

    Write-Host ("[{0}] {1}" -f (Get-LabText "ErrorLabel"), $Message) -ForegroundColor Red
}

function Write-LabCommand {
    param([string]$Command)

    Write-Host ("[{0}]" -f (Get-LabText "CommandLabel")) -ForegroundColor DarkGray
    Write-Host $Command -ForegroundColor DarkGray
}

function Write-LabPrompt {
    param([string]$Message)

    Write-Host ("[?] {0}" -f $Message) -ForegroundColor Yellow
}

function Write-LabPhase {
    param([string]$Title)

    Write-LabSection -Title $Title -Color Cyan
}

function Format-LabBytes {
    param([UInt64]$Bytes)

    if ($Bytes -ge 1TB) { return "{0:N2} TB" -f ($Bytes / 1TB) }
    if ($Bytes -ge 1GB) { return "{0:N2} GB" -f ($Bytes / 1GB) }
    if ($Bytes -ge 1MB) { return "{0:N2} MB" -f ($Bytes / 1MB) }
    return "$Bytes bytes"
}

function New-LabProgressBar {
    param(
        [int]$Percent,
        [int]$Width = 20
    )

    if ($Percent -lt 0) { $Percent = 0 }
    if ($Percent -gt 100) { $Percent = 100 }
    if ($Width -lt 10) { $Width = 10 }

    $filled = [int][Math]::Round(($Percent * $Width) / 100.0)
    if ($filled -gt $Width) { $filled = $Width }
    $empty = $Width - $filled
    return "[{0}{1}]" -f ("#" * $filled), ("-" * $empty)
}

function Copy-LabFileWithProgress {
    param(
        [string]$Source,
        [string]$Destination,
        [string]$Activity
    )

    $sourceItem = Get-Item -LiteralPath $Source -ErrorAction Stop
    $destinationDirectory = Split-Path -Parent $Destination
    if (-not [string]::IsNullOrWhiteSpace($destinationDirectory) -and -not (Test-Path -LiteralPath $destinationDirectory -PathType Container)) {
        New-Item -ItemType Directory -Path $destinationDirectory -Force | Out-Null
    }
    if (Test-Path -LiteralPath $Destination -PathType Leaf) {
        try { (Get-Item -LiteralPath $Destination -ErrorAction Stop).IsReadOnly = $false } catch {}
    }

    $total = [UInt64]$sourceItem.Length
    Write-Host ("  {0} [{1}]" -f $sourceItem.Name, (Format-LabBytes $total)) -ForegroundColor Cyan

    $canRewriteLine = $false
    try {
        $canRewriteLine = (-not [Console]::IsOutputRedirected)
        if ($canRewriteLine) {
            $null = [Console]::CursorLeft
        }
    }
    catch {
        $canRewriteLine = $false
    }

    $buffer = New-Object byte[] (4MB)
    $copied = [UInt64]0
    $nextReport = 10
    $lastInteractivePercent = -1
    $inputStream = $null
    $outputStream = $null

    try {
        $inputStream = [System.IO.File]::Open($sourceItem.FullName, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::Read)
        $outputStream = [System.IO.File]::Open($Destination, [System.IO.FileMode]::Create, [System.IO.FileAccess]::Write, [System.IO.FileShare]::None)

        while (($read = $inputStream.Read($buffer, 0, $buffer.Length)) -gt 0) {
            $outputStream.Write($buffer, 0, $read)
            $copied += [UInt64]$read

            $percent = if ($total -gt 0) { [int][Math]::Min(100, [Math]::Floor(($copied * 100.0) / $total)) } else { 100 }
            if ($canRewriteLine) {
                if ($percent -ne $lastInteractivePercent) {
                    $bar = New-LabProgressBar -Percent $percent -Width 20
                    $line = "  {0} {1,3}% - {2} / {3}   " -f $bar, $percent, (Format-LabBytes $copied), (Format-LabBytes $total)
                    Write-Host -NoNewline ("`r{0}" -f $line) -ForegroundColor Gray
                    $lastInteractivePercent = $percent
                }
            }
            else {
                while ($percent -ge $nextReport -and $nextReport -lt 100) {
                    $bar = New-LabProgressBar -Percent $nextReport -Width 20
                    Write-Host ("  {0} {1,3}% - {2} / {3}" -f $bar, $nextReport, (Format-LabBytes $copied), (Format-LabBytes $total)) -ForegroundColor DarkGray
                    $nextReport += 10
                }
            }
        }
    }
    finally {
        if ($outputStream) { $outputStream.Dispose() }
        if ($inputStream) { $inputStream.Dispose() }
    }

    $destinationItem = Get-Item -LiteralPath $Destination -ErrorAction Stop
    $destinationItem.LastWriteTime = $sourceItem.LastWriteTime
    $doneBar = New-LabProgressBar -Percent 100 -Width 20
    if ($canRewriteLine) {
        Write-Host ("`r  {0} 100% - {1} [{2}]          " -f $doneBar, $destinationItem.Name, (Format-LabBytes ([UInt64]$destinationItem.Length))) -ForegroundColor Green
    }
    else {
        Write-Host ("  {0} 100% - {1} [{2}]" -f $doneBar, $destinationItem.Name, (Format-LabBytes ([UInt64]$destinationItem.Length))) -ForegroundColor Green
    }
    return $destinationItem
}

function Initialize-LabUsbNative {
    if ($null -ne ("LabUsbNative" -as [type])) {
        return
    }

    $usbNativeSource = @"
using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;
using Microsoft.Win32.SafeHandles;

public sealed class LabUsbProbeResult
{
    public bool FoundChain;
    public bool IsUsb;
    public bool IsUsb2;
    public bool IsUsb3;
    public bool SuperSpeedCapable;
    public string UsbDisplay;
    public string DetectionSource;
    public string UsbSerial;
    public string HubDeviceId;
    public int PortNumber;
}

public static class LabUsbNative
{
    private const int CR_SUCCESS = 0;
    private const uint CM_DRP_HARDWAREID = 0x00000002;
    private const uint CM_DRP_COMPATIBLEIDS = 0x00000003;
    private const uint CM_DRP_SERVICE = 0x00000005;
    private const uint CM_DRP_LOCATION_INFORMATION = 0x0000000E;
    private const uint CM_DRP_ADDRESS = 0x0000001D;

    private const uint GENERIC_WRITE = 0x40000000;
    private const uint FILE_SHARE_READ = 0x00000001;
    private const uint FILE_SHARE_WRITE = 0x00000002;
    private const uint OPEN_EXISTING = 3;

    private const uint IOCTL_USB_GET_NODE_CONNECTION_INFORMATION_EX = 0x00220448;
    private const uint IOCTL_USB_GET_NODE_CONNECTION_INFORMATION_EX_V2 = 0x0022045C;

    private static Guid GUID_DEVINTERFACE_USB_HUB = new Guid("f18a0e88-c30c-11d0-8815-00a0c906bed8");

    [DllImport("CfgMgr32.dll", CharSet = CharSet.Unicode)]
    private static extern int CM_Locate_DevNodeW(out uint pdnDevInst, string pDeviceID, int ulFlags);

    [DllImport("CfgMgr32.dll")]
    private static extern int CM_Get_Parent(out uint pdnDevInst, uint dnDevInst, int ulFlags);

    [DllImport("CfgMgr32.dll", CharSet = CharSet.Unicode)]
    private static extern int CM_Get_Device_IDW(uint dnDevInst, StringBuilder buffer, int bufferLen, int ulFlags);

    [DllImport("CfgMgr32.dll", CharSet = CharSet.Unicode)]
    private static extern int CM_Get_DevNode_Registry_PropertyW(uint dnDevInst, uint ulProperty, out uint pulRegDataType, byte[] buffer, ref uint pulLength, int ulFlags);

    [DllImport("CfgMgr32.dll", CharSet = CharSet.Unicode)]
    private static extern int CM_Get_Device_Interface_List_SizeW(out uint pulLen, ref Guid interfaceClassGuid, string pDeviceID, uint ulFlags);

    [DllImport("CfgMgr32.dll", CharSet = CharSet.Unicode)]
    private static extern int CM_Get_Device_Interface_ListW(ref Guid interfaceClassGuid, string pDeviceID, char[] buffer, uint bufferLen, uint ulFlags);

    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern SafeFileHandle CreateFileW(string lpFileName, uint dwDesiredAccess, uint dwShareMode, IntPtr lpSecurityAttributes, uint dwCreationDisposition, uint dwFlagsAndAttributes, IntPtr hTemplateFile);

    [DllImport("kernel32.dll", SetLastError = true)]
    private static extern bool DeviceIoControl(SafeFileHandle hDevice, uint dwIoControlCode, byte[] lpInBuffer, int nInBufferSize, byte[] lpOutBuffer, int nOutBufferSize, out int lpBytesReturned, IntPtr lpOverlapped);

    private static string GetDeviceId(uint devInst)
    {
        StringBuilder sb = new StringBuilder(1024);
        if (CM_Get_Device_IDW(devInst, sb, sb.Capacity, 0) == CR_SUCCESS)
        {
            return sb.ToString();
        }
        return string.Empty;
    }

    private static uint GetUIntProperty(uint devInst, uint prop)
    {
        uint regType = 0;
        uint len = 4;
        byte[] buf = new byte[4];
        if (CM_Get_DevNode_Registry_PropertyW(devInst, prop, out regType, buf, ref len, 0) == CR_SUCCESS && len >= 4)
        {
            return BitConverter.ToUInt32(buf, 0);
        }
        return 0;
    }

    private static string GetStringProperty(uint devInst, uint prop)
    {
        uint regType = 0;
        uint len = 2048;
        byte[] buf = new byte[len];
        int cr = CM_Get_DevNode_Registry_PropertyW(devInst, prop, out regType, buf, ref len, 0);
        if (cr == CR_SUCCESS && len > 0)
        {
            return Encoding.Unicode.GetString(buf, 0, (int)len).TrimEnd(new char[] { (char)0 });
        }
        return string.Empty;
    }

    private static string GetHubInterfacePath(string hubDeviceId, uint hubDevInst)
    {
        if (string.IsNullOrEmpty(hubDeviceId)) return string.Empty;
        Guid guid = GUID_DEVINTERFACE_USB_HUB;
        uint size = 0;
        if (CM_Get_Device_Interface_List_SizeW(out size, ref guid, hubDeviceId, 0) == CR_SUCCESS && size > 1)
        {
            char[] buf = new char[size];
            if (CM_Get_Device_Interface_ListW(ref guid, hubDeviceId, buf, size, 0) == CR_SUCCESS)
            {
                string raw = new string(buf);
                int nul = raw.IndexOf((char)0);
                string first = nul >= 0 ? raw.Substring(0, nul) : raw;
                if (!string.IsNullOrEmpty(first)) return first;
            }
        }
        string hubSvc = GetStringProperty(hubDevInst, CM_DRP_SERVICE);
        if (hubDeviceId.StartsWith("USB\\ROOT_HUB", StringComparison.OrdinalIgnoreCase) ||
            hubSvc.IndexOf("HUB", StringComparison.OrdinalIgnoreCase) >= 0)
        {
            return "\\\\?\\" + hubDeviceId.Replace((char)92, (char)35) + "#{f18a0e88-c30c-11d0-8815-00a0c906bed8}";
        }
        return string.Empty;
    }

    public static LabUsbProbeResult ProbeByPnpDeviceId(string pnpDeviceId, bool busLooksUsb)
    {
        LabUsbProbeResult res = new LabUsbProbeResult();
        res.UsbDisplay = "-";
        res.DetectionSource = "None";
        res.UsbSerial = string.Empty;
        res.HubDeviceId = string.Empty;
        res.IsUsb = busLooksUsb;

        if (string.IsNullOrWhiteSpace(pnpDeviceId))
        {
            return res;
        }

        uint current = 0;
        if (CM_Locate_DevNodeW(out current, pnpDeviceId, 0) != CR_SUCCESS)
        {
            return res;
        }

        res.FoundChain = true;
        List<string> chainText = new List<string>();
        bool anyIoctlSucceeded = false;
        bool sawUsb2Link = false;
        bool sawUsb3Link = false;

        for (int depth = 0; depth < 16; depth++)
        {
            string curId = GetDeviceId(current);
            string curSvc = GetStringProperty(current, CM_DRP_SERVICE);
            string curHw = GetStringProperty(current, CM_DRP_HARDWAREID);
            string curCompat = GetStringProperty(current, CM_DRP_COMPATIBLEIDS);
            chainText.Add(curId + " | " + curSvc + " | " + curHw + " | " + curCompat);

            if (curId.StartsWith("USB\\", StringComparison.OrdinalIgnoreCase) ||
                curId.StartsWith("USBSTOR\\", StringComparison.OrdinalIgnoreCase) ||
                curSvc.IndexOf("UASP", StringComparison.OrdinalIgnoreCase) >= 0 ||
                curSvc.IndexOf("USBSTOR", StringComparison.OrdinalIgnoreCase) >= 0)
            {
                res.IsUsb = true;
            }

            if (string.IsNullOrEmpty(res.UsbSerial) &&
                curId.StartsWith("USB\\VID_", StringComparison.OrdinalIgnoreCase) &&
                curId.IndexOf("&MI_", StringComparison.OrdinalIgnoreCase) < 0)
            {
                int lastSlash = curId.LastIndexOf((char)92);
                if (lastSlash > 0 && lastSlash + 1 < curId.Length)
                {
                    string candidateSerial = curId.Substring(lastSlash + 1).Trim();
                    if (candidateSerial.IndexOf((char)38) < 0)
                    {
                        res.UsbSerial = candidateSerial;
                    }
                }
            }

            uint parent = 0;
            if (CM_Get_Parent(out parent, current, 0) != CR_SUCCESS)
            {
                break;
            }

            string parentId = GetDeviceId(parent);
            string hubPath = GetHubInterfacePath(parentId, parent);
            if (!string.IsNullOrEmpty(hubPath))
            {
                uint port = GetUIntProperty(current, CM_DRP_ADDRESS);
                if (port == 0)
                {
                    string loc = GetStringProperty(current, CM_DRP_LOCATION_INFORMATION);
                    Match m = Regex.Match(loc, @"Port_#0*(\d+)", RegexOptions.IgnoreCase);
                    if (m.Success)
                    {
                        uint parsedPort = 0;
                        if (uint.TryParse(m.Groups[1].Value, out parsedPort)) port = parsedPort;
                    }
                }

                if (port > 0)
                {
                    SafeFileHandle hHub = CreateFileW(hubPath, GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, IntPtr.Zero, OPEN_EXISTING, 0, IntPtr.Zero);
                    if (hHub == null || hHub.IsInvalid)
                    {
                        hHub = CreateFileW(hubPath, 0, FILE_SHARE_READ | FILE_SHARE_WRITE, IntPtr.Zero, OPEN_EXISTING, 0, IntPtr.Zero);
                    }

                    if (hHub != null && !hHub.IsInvalid)
                    {
                        using (hHub)
                        {
                            res.IsUsb = true;
                            if (string.IsNullOrEmpty(res.HubDeviceId))
                            {
                                res.HubDeviceId = parentId;
                                res.PortNumber = (int)port;
                            }

                            byte[] bufEx = new byte[1024];
                            Array.Copy(BitConverter.GetBytes(port), 0, bufEx, 0, 4);
                            int retEx = 0;
                            bool okEx = DeviceIoControl(hHub, IOCTL_USB_GET_NODE_CONNECTION_INFORMATION_EX, bufEx, bufEx.Length, bufEx, bufEx.Length, out retEx, IntPtr.Zero);

                            byte[] bufV2 = new byte[16];
                            Array.Copy(BitConverter.GetBytes(port), 0, bufV2, 0, 4);
                            Array.Copy(BitConverter.GetBytes((uint)16), 0, bufV2, 4, 4);
                            Array.Copy(BitConverter.GetBytes((uint)0x07), 0, bufV2, 8, 4);
                            int retV2 = 0;
                            bool okV2 = DeviceIoControl(hHub, IOCTL_USB_GET_NODE_CONNECTION_INFORMATION_EX_V2, bufV2, bufV2.Length, bufV2, bufV2.Length, out retV2, IntPtr.Zero);

                            bool hopEvaluated = false;
                            bool hopIsSuper = false;

                            uint v2Protocols = 0;
                            uint v2Flags = 0;
                            bool hasV2 = (okV2 && retV2 >= 16);
                            if (hasV2)
                            {
                                v2Protocols = BitConverter.ToUInt32(bufV2, 8);
                                v2Flags = BitConverter.ToUInt32(bufV2, 12);
                                if ((v2Flags & 0x0F) != 0)
                                {
                                    res.SuperSpeedCapable = true;
                                }
                            }

                            // On Windows 8/10/11 USBHUB3.SYS, IOCTL_EX caps Speed at UsbHighSpeed (2)
                            // even for USB 3.x / USB-C SuperSpeed connections; IOCTL_EX_V2 Flags
                            // (0x01 = SuperSpeed+, 0x04 = SuperSpeedPlus+) and SS-only companion ports
                            // (SupportedUsbProtocols == 0x04) report the true USB 3.x link state.
                            bool v2OperatingSuper = hasV2 && (((v2Flags & 0x01) != 0) || ((v2Flags & 0x04) != 0));
                            bool v2PortUsb3Only = hasV2 && ((v2Protocols & 0x04) != 0) && ((v2Protocols & 0x03) == 0);
                            bool v2PortNoUsb3 = hasV2 && ((v2Protocols & 0x04) == 0);

                            if (okEx && retEx >= 35 && BitConverter.ToInt32(bufEx, 31) == 1)
                            {
                                byte speed = bufEx[23];
                                ushort bcdUsb = BitConverter.ToUInt16(bufEx, 6);
                                if (bcdUsb >= 0x0300) res.SuperSpeedCapable = true;

                                if (v2OperatingSuper || v2PortUsb3Only)
                                {
                                    hopEvaluated = true;
                                    hopIsSuper = true;
                                    if (res.DetectionSource == "None")
                                    {
                                        res.DetectionSource = "IOCTL_V2";
                                    }
                                }
                                else if (speed >= 3 || (!v2PortNoUsb3 && bcdUsb >= 0x0300))
                                {
                                    hopEvaluated = true;
                                    hopIsSuper = true;
                                    if (res.DetectionSource == "None")
                                    {
                                        res.DetectionSource = "IOCTL_EX";
                                    }
                                }
                                else if (speed <= 2)
                                {
                                    hopEvaluated = true;
                                    hopIsSuper = false;
                                    if (res.DetectionSource == "None")
                                    {
                                        res.DetectionSource = "IOCTL_EX";
                                    }
                                }
                            }
                            else if (v2OperatingSuper)
                            {
                                hopEvaluated = true;
                                hopIsSuper = true;
                                if (res.DetectionSource == "None")
                                {
                                    res.DetectionSource = "IOCTL_V2";
                                }
                            }

                            if (hopEvaluated)
                            {
                                anyIoctlSucceeded = true;
                                if (hopIsSuper) sawUsb3Link = true;
                                else sawUsb2Link = true;
                            }
                        }
                    }
                }
            }

            current = parent;
        }

        if (anyIoctlSucceeded)
        {
            if (sawUsb2Link)
            {
                res.IsUsb2 = true;
                res.IsUsb3 = false;
                res.UsbDisplay = "USB 2.0";
            }
            else if (sawUsb3Link)
            {
                res.IsUsb2 = false;
                res.IsUsb3 = true;
                res.UsbDisplay = "USB 3.x";
            }
            return res;
        }


        return res;
    }
}
"@

    try {
        Add-Type -TypeDefinition $usbNativeSource -Language CSharp -ErrorAction Stop
    }
    catch {
    }
}

function ConvertFrom-LabDeviceInterfacePath {
    param([string]$DevicePath)

    if ([string]::IsNullOrWhiteSpace($DevicePath)) {
        return ""
    }

    $trimmed = $DevicePath.Trim()
    if ($trimmed.StartsWith("\\?\", [System.StringComparison]::OrdinalIgnoreCase)) {
        $trimmed = $trimmed.Substring(4)
    }
    $trimmed = [regex]::Replace($trimmed, '#\{[0-9a-fA-F\-]+\}(\\.*)?$', '')
    if ([string]::IsNullOrWhiteSpace($trimmed)) {
        return ""
    }
    return $trimmed.Replace('#', '\')
}

function Get-LabNormalizedSerial {
    param([string]$Serial)

    if ([string]::IsNullOrWhiteSpace($Serial)) {
        return ""
    }
    return ($Serial.Trim() -replace '\s+', '')
}

function Update-LabStorageState {
    try {
        if (Get-Command Update-HostStorageCache -ErrorAction SilentlyContinue) {
            Update-HostStorageCache -ErrorAction SilentlyContinue | Out-Null
        }
    }
    catch {
    }
}

function Get-LabDiskUsbSpeedInfo {
    param(
        [Parameter(Mandatory = $true)]
        [int]$DiskNumber,
        [object]$Disk = $null
    )

    Initialize-LabUsbNative

    $busType = ""
    $friendlyName = ""
    $diskSerial = ""
    $uniqueId = ""
    $diskSize = [UInt64]0
    $pnpDeviceId = ""

    if ($null -eq $Disk) {
        try {
            $Disk = Get-Disk -Number $DiskNumber -ErrorAction SilentlyContinue
        }
        catch {
            $Disk = $null
        }
    }

    if ($null -ne $Disk) {
        if ($Disk.PSObject.Properties["BusType"] -and $null -ne $Disk.BusType) { $busType = [string]$Disk.BusType }
        if ($Disk.PSObject.Properties["FriendlyName"] -and $null -ne $Disk.FriendlyName) { $friendlyName = [string]$Disk.FriendlyName }
        if ($Disk.PSObject.Properties["SerialNumber"] -and $null -ne $Disk.SerialNumber) { $diskSerial = [string]$Disk.SerialNumber }
        if ($Disk.PSObject.Properties["UniqueId"] -and $null -ne $Disk.UniqueId) { $uniqueId = [string]$Disk.UniqueId }
        if ($Disk.PSObject.Properties["Size"] -and $null -ne $Disk.Size) { $diskSize = [UInt64]$Disk.Size }
        if ($Disk.PSObject.Properties["Path"] -and $null -ne $Disk.Path) {
            $pnpDeviceId = ConvertFrom-LabDeviceInterfacePath -DevicePath ([string]$Disk.Path)
        }
    }

    try {
        $wmiDisk = Get-CimInstance -ClassName Win32_DiskDrive -Filter ("Index = {0}" -f $DiskNumber) -ErrorAction Stop | Select-Object -First 1
        if ($null -ne $wmiDisk) {
            if ($null -ne $wmiDisk.PNPDeviceID -and -not [string]::IsNullOrWhiteSpace([string]$wmiDisk.PNPDeviceID)) {
                $pnpDeviceId = [string]$wmiDisk.PNPDeviceID
            }
            if ([string]::IsNullOrWhiteSpace($friendlyName) -and $null -ne $wmiDisk.Caption) {
                $friendlyName = [string]$wmiDisk.Caption
            }
            if ([string]::IsNullOrWhiteSpace($diskSerial) -and $null -ne $wmiDisk.SerialNumber) {
                $diskSerial = [string]$wmiDisk.SerialNumber
            }
            if ([string]::IsNullOrWhiteSpace($busType) -and $null -ne $wmiDisk.InterfaceType) {
                $busType = [string]$wmiDisk.InterfaceType
            }
            if ($diskSize -eq 0 -and $null -ne $wmiDisk.Size) {
                $diskSize = [UInt64]$wmiDisk.Size
            }
        }
    }
    catch {
    }

    if ([string]::IsNullOrWhiteSpace($pnpDeviceId)) {
        try {
            $enumReg = Get-ItemProperty -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\disk\Enum" -Name ([string]$DiskNumber) -ErrorAction SilentlyContinue
            if ($null -ne $enumReg) {
                $prop = $enumReg.PSObject.Properties[[string]$DiskNumber]
                if ($prop -and -not [string]::IsNullOrWhiteSpace([string]$prop.Value)) {
                    $pnpDeviceId = [string]$prop.Value
                }
            }
        }
        catch {
        }
    }

    $busLooksUsb = ($busType -ieq "USB" -or $busType -eq "7")
    $isUsb = $busLooksUsb
    $isUsb2 = $false
    $isUsb3 = $false
    $superCapable = $false
    $usbDisplay = "-"
    $detectionSource = "None"
    $usbSerial = ""

    if ($null -ne ("LabUsbNative" -as [type]) -and -not [string]::IsNullOrWhiteSpace($pnpDeviceId)) {
        try {
            $probe = [LabUsbNative]::ProbeByPnpDeviceId($pnpDeviceId, $busLooksUsb)
            if ($null -ne $probe) {
                $isUsb = [bool]$probe.IsUsb
                $isUsb2 = [bool]$probe.IsUsb2
                $isUsb3 = [bool]$probe.IsUsb3
                $superCapable = [bool]$probe.SuperSpeedCapable
                $usbDisplay = [string]$probe.UsbDisplay
                $detectionSource = [string]$probe.DetectionSource
                $usbSerial = [string]$probe.UsbSerial
            }
        }
        catch {
        }
    }

    $normDiskSerial = Get-LabNormalizedSerial -Serial $diskSerial
    $normUsbSerial = Get-LabNormalizedSerial -Serial $usbSerial
    $effectiveSerial = if (-not [string]::IsNullOrWhiteSpace($normDiskSerial)) { $normDiskSerial } else { $normUsbSerial }

    return [pscustomobject]@{
        DiskNumber = $DiskNumber
        FriendlyName = $friendlyName
        BusType = $busType
        IsUsb = $isUsb
        IsUsb2 = $isUsb2
        IsUsb3 = $isUsb3
        SuperSpeedCapable = $superCapable
        UsbDisplay = $usbDisplay
        SerialNumber = $normDiskSerial
        UsbSerial = $normUsbSerial
        EffectiveSerial = $effectiveSerial
        UniqueId = $uniqueId
        Size = $diskSize
        PnpDeviceId = $pnpDeviceId
        DetectionSource = $detectionSource
    }
}

function Get-LabVolumeUsbSpeedInfo {
    param(
        [Parameter(Mandatory = $true)]
        [string]$DriveLetter
    )

    $letter = $DriveLetter.Trim().TrimEnd(":\/").ToUpperInvariant()
    $diskNumber = $null
    $partitionNumber = $null
    $fsLabel = ""
    $fsName = ""
    $volumeSerial = ""

    if ($letter -match "^[A-Z]$") {
        try {
            $vol = Get-Volume -DriveLetter $letter -ErrorAction SilentlyContinue | Select-Object -First 1
            if ($null -ne $vol) {
                if ($null -ne $vol.FileSystemLabel) { $fsLabel = [string]$vol.FileSystemLabel }
                if ($null -ne $vol.FileSystem) { $fsName = [string]$vol.FileSystem }
            }
        }
        catch {
        }

        try {
            $part = Get-Partition -DriveLetter $letter -ErrorAction SilentlyContinue | Select-Object -First 1
            if ($null -ne $part) {
                $diskNumber = [int]$part.DiskNumber
                $partitionNumber = [int]$part.PartitionNumber
            }
        }
        catch {
        }

        try {
            $logical = Get-CimInstance -ClassName Win32_LogicalDisk -Filter ("DeviceID = '{0}:'" -f $letter) -ErrorAction Stop | Select-Object -First 1
            if ($null -ne $logical) {
                if ($null -ne $logical.VolumeSerialNumber) { $volumeSerial = ([string]$logical.VolumeSerialNumber).Trim().ToUpperInvariant() }
                if ([string]::IsNullOrWhiteSpace($fsLabel) -and $null -ne $logical.VolumeName) { $fsLabel = [string]$logical.VolumeName }
                if ([string]::IsNullOrWhiteSpace($fsName) -and $null -ne $logical.FileSystem) { $fsName = [string]$logical.FileSystem }

                if ($null -eq $diskNumber) {
                    $ldParts = @(Get-CimAssociatedInstance -InputObject $logical -ResultClassName Win32_DiskPartition -ErrorAction SilentlyContinue)
                    foreach ($dp in $ldParts) {
                        if ($null -ne $dp.DiskIndex) {
                            $diskNumber = [int]$dp.DiskIndex
                            if ($null -ne $dp.Index) { $partitionNumber = [int]$dp.Index + 1 }
                            break
                        }
                    }
                }
            }
        }
        catch {
        }
    }

    if ($null -ne $diskNumber) {
        $diskInfo = Get-LabDiskUsbSpeedInfo -DiskNumber $diskNumber
        return [pscustomobject]@{
            DriveLetter = $letter
            DiskNumber = $diskNumber
            PartitionNumber = $partitionNumber
            FileSystemLabel = $fsLabel
            FileSystem = $fsName
            VolumeSerialNumber = $volumeSerial
            IsUsb = [bool]$diskInfo.IsUsb
            IsUsb2 = [bool]$diskInfo.IsUsb2
            IsUsb3 = [bool]$diskInfo.IsUsb3
            SuperSpeedCapable = [bool]$diskInfo.SuperSpeedCapable
            UsbDisplay = [string]$diskInfo.UsbDisplay
            DiskFriendlyName = [string]$diskInfo.FriendlyName
            EffectiveSerial = [string]$diskInfo.EffectiveSerial
            DiskSerialNumber = [string]$diskInfo.SerialNumber
            UsbSerial = [string]$diskInfo.UsbSerial
            DiskSize = [UInt64]$diskInfo.Size
        }
    }

    return [pscustomobject]@{
        DriveLetter = $letter
        DiskNumber = $null
        PartitionNumber = $null
        FileSystemLabel = $fsLabel
        FileSystem = $fsName
        VolumeSerialNumber = $volumeSerial
        IsUsb = $false
        IsUsb2 = $false
        IsUsb3 = $false
        SuperSpeedCapable = $false
        UsbDisplay = "-"
        DiskFriendlyName = ""
        EffectiveSerial = ""
        DiskSerialNumber = ""
        UsbSerial = ""
        DiskSize = [UInt64]0
    }
}

function Find-LabRelocatedDisk {
    param(
        [string]$SerialNumber,
        [string]$UsbSerial,
        [string]$UniqueId,
        [string]$FriendlyName,
        [UInt64]$Size,
        [int]$FallbackDiskNumber
    )

    for ($waitAttempt = 1; $waitAttempt -le 5; $waitAttempt++) {
        Update-LabStorageState
        $candidates = @()
        try {
            $candidates = @(Get-Disk -ErrorAction Stop | Where-Object { -not $_.IsBoot -and -not $_.IsSystem } | Sort-Object Number)
        }
        catch {
            $candidates = @()
        }

        foreach ($cand in $candidates) {
            $candInfo = Get-LabDiskUsbSpeedInfo -DiskNumber $cand.Number -Disk $cand
            if (-not [string]::IsNullOrWhiteSpace($SerialNumber)) {
                if ($candInfo.SerialNumber -ieq $SerialNumber -or $candInfo.EffectiveSerial -ieq $SerialNumber) {
                    return $cand
                }
            }
            if (-not [string]::IsNullOrWhiteSpace($UsbSerial)) {
                if ($candInfo.UsbSerial -ieq $UsbSerial -or $candInfo.EffectiveSerial -ieq $UsbSerial) {
                    return $cand
                }
            }
            if (-not [string]::IsNullOrWhiteSpace($UniqueId) -and -not [string]::IsNullOrWhiteSpace([string]$cand.UniqueId)) {
                if (([string]$cand.UniqueId).Equals($UniqueId, [System.StringComparison]::OrdinalIgnoreCase)) {
                    return $cand
                }
            }
        }

        if ([string]::IsNullOrWhiteSpace($SerialNumber) -and [string]::IsNullOrWhiteSpace($UsbSerial)) {
            $bySignature = @($candidates | Where-Object {
                $_.FriendlyName -eq $FriendlyName -and [UInt64]$_.Size -eq $Size
            })
            if ($bySignature.Count -eq 1) {
                return $bySignature[0]
            }
            $byNum = @($candidates | Where-Object { $_.Number -eq $FallbackDiskNumber })
            if ($byNum.Count -eq 1) {
                return $byNum[0]
            }
        }

        if ($waitAttempt -lt 5) {
            Start-Sleep -Seconds 1
        }
    }

    return $null
}

function Confirm-LabUsbDiskSpeed {
    param(
        [Parameter(Mandatory = $true)]
        [object]$Disk
    )

    $currentDisk = $Disk
    $speedInfo = Get-LabDiskUsbSpeedInfo -DiskNumber $currentDisk.Number -Disk $currentDisk
    if (-not $speedInfo.IsUsb2) {
        return $currentDisk
    }

    $savedDiskSerial = $speedInfo.SerialNumber
    $savedUsbSerial = $speedInfo.UsbSerial
    $savedEffectiveSerial = $speedInfo.EffectiveSerial
    $savedUniqueId = $speedInfo.UniqueId
    $savedFriendlyName = $speedInfo.FriendlyName
    $savedSize = $speedInfo.Size

    while ($speedInfo.IsUsb2) {
        $serialText = if (-not [string]::IsNullOrWhiteSpace($speedInfo.EffectiveSerial)) { $speedInfo.EffectiveSerial } else { Get-LabText "UsbNoSerial" }
        Write-LabStatusPanel -Title (Get-LabText "UsbSpeedWarnTitle") -TitleColor Yellow -BorderColor Yellow -Items @(
            @{ Label = (Get-LabText "UsbSpeedDiskLabel"); Value = ("#{0} - {1} ({2})" -f $currentDisk.Number, $speedInfo.FriendlyName, (Format-LabBytes $speedInfo.Size)); Color = [ConsoleColor]::White },
            @{ Label = (Get-LabText "UsbSpeedSerialLabel"); Value = $serialText; Color = [ConsoleColor]::Gray },
            @{ Label = (Get-LabText "UsbSpeedCurrentLabel"); Value = $speedInfo.UsbDisplay; Color = [ConsoleColor]::Yellow }
        )
        Write-LabWarning (Get-LabText "UsbSpeedWarnBody")
        Write-Host ("  {0}" -f (Get-LabText "UsbSpeedRecommend")) -ForegroundColor Yellow
        if ($speedInfo.SuperSpeedCapable) {
            Write-Host ("  {0}" -f (Get-LabText "UsbSpeedSuperCapableNote")) -ForegroundColor Cyan
        }
        Write-Host ""
        Write-Host ("  {0}" -f (Get-LabText "UsbSpeedOpt1")) -ForegroundColor Green
        Write-Host ("  {0}" -f (Get-LabText "UsbSpeedOpt2")) -ForegroundColor Yellow
        Write-Host ("  {0}" -f (Get-LabText "UsbSpeedOpt0")) -ForegroundColor Gray
        Write-Host ""

        $rawChoice = Read-Host (Get-LabText "UsbSpeedPrompt")
        $choice = if ($null -ne $rawChoice) { $rawChoice.Trim() } else { "0" }
        if ([string]::IsNullOrWhiteSpace($choice)) {
            $choice = "1"
        }

        switch ($choice) {
            "1" {
                Write-LabInfo (Get-LabText "UsbSpeedSearching") Cyan
                $relocated = Find-LabRelocatedDisk -SerialNumber $savedDiskSerial -UsbSerial $savedUsbSerial -UniqueId $savedUniqueId -FriendlyName $savedFriendlyName -Size $savedSize -FallbackDiskNumber $currentDisk.Number
                if ($null -eq $relocated) {
                    $idDisplay = if (-not [string]::IsNullOrWhiteSpace($savedEffectiveSerial)) { $savedEffectiveSerial } else { $savedFriendlyName }
                    Write-LabWarning (Format-LabText "UsbSpeedNotFoundRetry" $idDisplay)
                    continue
                }

                $currentDisk = $relocated
                $speedInfo = Get-LabDiskUsbSpeedInfo -DiskNumber $currentDisk.Number -Disk $currentDisk
                if (-not [string]::IsNullOrWhiteSpace($speedInfo.SerialNumber)) { $savedDiskSerial = $speedInfo.SerialNumber }
                if (-not [string]::IsNullOrWhiteSpace($speedInfo.UsbSerial)) { $savedUsbSerial = $speedInfo.UsbSerial }
                if (-not [string]::IsNullOrWhiteSpace($speedInfo.EffectiveSerial)) { $savedEffectiveSerial = $speedInfo.EffectiveSerial }

                $diskSummary = ("#{0} {1}" -f $currentDisk.Number, $speedInfo.FriendlyName).Trim()
                if (-not $speedInfo.IsUsb2) {
                    Write-LabOk (Format-LabText "UsbSpeedRelocatedOk" $diskSummary $speedInfo.UsbDisplay)
                    return $currentDisk
                }

                Write-LabWarning (Format-LabText "UsbSpeedStillUsb2" $diskSummary)
            }
            "2" {
                Write-LabWarning (Get-LabText "UsbSpeedContinuedUsb2")
                return $currentDisk
            }
            "0" {
                throw (Get-LabText "Cancelled")
            }
            default {
                Write-LabWarning (Get-LabText "InvalidOption")
            }
        }
    }

    return $currentDisk
}

function Find-LabRelocatedVolumeLetter {
    param([pscustomobject]$TrackedVolume)

    for ($waitAttempt = 1; $waitAttempt -le 5; $waitAttempt++) {
        Update-LabStorageState
        $allLetters = @()
        try {
            $allLetters = @(Get-Volume -ErrorAction Stop | Where-Object DriveLetter | ForEach-Object { ([string]$_.DriveLetter).ToUpperInvariant() })
        }
        catch {
            try {
                $allLetters = @(Get-CimInstance -ClassName Win32_LogicalDisk -ErrorAction Stop | Where-Object DeviceID | ForEach-Object { $_.DeviceID.TrimEnd(":").ToUpperInvariant() })
            }
            catch {
                $allLetters = @()
            }
        }

        $volInfos = @(foreach ($ltr in $allLetters) {
            Get-LabVolumeUsbSpeedInfo -DriveLetter $ltr
        })

        if (-not [string]::IsNullOrWhiteSpace($TrackedVolume.VolumeSerialNumber)) {
            $byVolSerial = @($volInfos | Where-Object {
                $_.VolumeSerialNumber -ieq $TrackedVolume.VolumeSerialNumber -and (
                    [string]::IsNullOrWhiteSpace($TrackedVolume.EffectiveSerial) -or
                    $_.EffectiveSerial -ieq $TrackedVolume.EffectiveSerial -or
                    $_.DiskSerialNumber -ieq $TrackedVolume.DiskSerialNumber -or
                    $_.UsbSerial -ieq $TrackedVolume.UsbSerial
                )
            })
            if ($byVolSerial.Count -ge 1) {
                return $byVolSerial[0].DriveLetter
            }
        }

        if (-not [string]::IsNullOrWhiteSpace($TrackedVolume.EffectiveSerial)) {
            $onSameSerialDisk = @($volInfos | Where-Object {
                $_.EffectiveSerial -ieq $TrackedVolume.EffectiveSerial -or
                (-not [string]::IsNullOrWhiteSpace($TrackedVolume.DiskSerialNumber) -and $_.DiskSerialNumber -ieq $TrackedVolume.DiskSerialNumber) -or
                (-not [string]::IsNullOrWhiteSpace($TrackedVolume.UsbSerial) -and $_.UsbSerial -ieq $TrackedVolume.UsbSerial)
            })

            if ($onSameSerialDisk.Count -eq 1) {
                return $onSameSerialDisk[0].DriveLetter
            }
            if ($onSameSerialDisk.Count -gt 1) {
                $byPart = @($onSameSerialDisk | Where-Object { $null -ne $TrackedVolume.PartitionNumber -and $_.PartitionNumber -eq $TrackedVolume.PartitionNumber })
                if ($byPart.Count -eq 1) { return $byPart[0].DriveLetter }

                $byFsLabel = @($onSameSerialDisk | Where-Object { $_.FileSystem -ieq $TrackedVolume.FileSystem -and $_.FileSystemLabel -eq $TrackedVolume.FileSystemLabel })
                if ($byFsLabel.Count -ge 1) { return $byFsLabel[0].DriveLetter }

                return $onSameSerialDisk[0].DriveLetter
            }
        }

        if (-not [string]::IsNullOrWhiteSpace($TrackedVolume.VolumeSerialNumber)) {
            $byVolOnly = @($volInfos | Where-Object { $_.VolumeSerialNumber -ieq $TrackedVolume.VolumeSerialNumber })
            if ($byVolOnly.Count -eq 1) {
                return $byVolOnly[0].DriveLetter
            }
        }

        if ($waitAttempt -lt 5) {
            Start-Sleep -Seconds 1
        }
    }

    return $null
}

function Confirm-LabUsbVolumesSpeed {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$DriveLetters
    )

    $tracked = [System.Collections.Generic.List[object]]::new()
    foreach ($rawLetter in @($DriveLetters)) {
        $ltr = $rawLetter.Trim().TrimEnd(":\/").ToUpperInvariant()
        if ([string]::IsNullOrWhiteSpace($ltr)) { continue }
        $vInfo = Get-LabVolumeUsbSpeedInfo -DriveLetter $ltr
        $tracked.Add([pscustomobject]@{
            CurrentLetter = $ltr
            PartitionNumber = $vInfo.PartitionNumber
            FileSystemLabel = $vInfo.FileSystemLabel
            FileSystem = $vInfo.FileSystem
            VolumeSerialNumber = $vInfo.VolumeSerialNumber
            EffectiveSerial = $vInfo.EffectiveSerial
            DiskSerialNumber = $vInfo.DiskSerialNumber
            UsbSerial = $vInfo.UsbSerial
            DiskFriendlyName = $vInfo.DiskFriendlyName
            Info = $vInfo
        })
    }

    $trackedItems = $tracked.ToArray()
    while ($true) {
        $usb2Entries = @($trackedItems | Where-Object { $_.Info.IsUsb2 })
        if ($usb2Entries.Count -eq 0) {
            $finalLetters = @($trackedItems | ForEach-Object { $_.CurrentLetter })
            return [pscustomobject]@{
                Approved = $true
                DriveLetters = $finalLetters
            }
        }

        $panelItems = [System.Collections.Generic.List[object]]::new()
        $anySuperCapable = $false
        foreach ($entry in $usb2Entries) {
            if ($entry.Info.SuperSpeedCapable) { $anySuperCapable = $true }
            $labelPart = if (-not [string]::IsNullOrWhiteSpace($entry.Info.FileSystemLabel)) { $entry.Info.FileSystemLabel } else { $entry.Info.FileSystem }
            $serialPart = if (-not [string]::IsNullOrWhiteSpace($entry.EffectiveSerial)) { $entry.EffectiveSerial } else { Get-LabText "UsbNoSerial" }
            $panelItems.Add(@{
                Label = ("{0} {1}:" -f (Get-LabText "UsbSpeedVolumeLabel"), $entry.CurrentLetter)
                Value = ("[{0}] {1} | S/N: {2} -> {3}" -f $labelPart, $entry.Info.DiskFriendlyName, $serialPart, $entry.Info.UsbDisplay)
                Color = [ConsoleColor]::Yellow
            })
        }

        Write-LabStatusPanel -Title (Get-LabText "UsbSpeedWarnTitle") -TitleColor Yellow -BorderColor Yellow -Items ($panelItems.ToArray())
        Write-LabWarning (Get-LabText "UsbSpeedWarnBody")
        Write-Host ("  {0}" -f (Get-LabText "UsbSpeedRecommend")) -ForegroundColor Yellow
        if ($anySuperCapable) {
            Write-Host ("  {0}" -f (Get-LabText "UsbSpeedSuperCapableNote")) -ForegroundColor Cyan
        }
        Write-Host ""
        Write-Host ("  {0}" -f (Get-LabText "UsbSpeedOpt1")) -ForegroundColor Green
        Write-Host ("  {0}" -f (Get-LabText "UsbSpeedOpt2")) -ForegroundColor Yellow
        Write-Host ("  {0}" -f (Get-LabText "UsbSpeedOpt0")) -ForegroundColor Gray
        Write-Host ""

        $rawChoice = Read-Host (Get-LabText "UsbSpeedPrompt")
        $choice = if ($null -ne $rawChoice) { $rawChoice.Trim() } else { "0" }
        if ([string]::IsNullOrWhiteSpace($choice)) {
            $choice = "1"
        }

        switch ($choice) {
            "1" {
                Write-LabInfo (Get-LabText "UsbSpeedSearching") Cyan
                $missingAny = $false
                foreach ($entry in $trackedItems) {
                    if (-not $entry.Info.IsUsb) { continue }
                    $newLetter = Find-LabRelocatedVolumeLetter -TrackedVolume $entry
                    if ([string]::IsNullOrWhiteSpace($newLetter)) {
                        $idDisplay = if (-not [string]::IsNullOrWhiteSpace($entry.EffectiveSerial)) { ("{0}: / S/N {1}" -f $entry.CurrentLetter, $entry.EffectiveSerial) } else { ("{0}:" -f $entry.CurrentLetter) }
                        Write-LabWarning (Format-LabText "UsbSpeedNotFoundRetry" $idDisplay)
                        $missingAny = $true
                        break
                    }
                    $entry.CurrentLetter = $newLetter
                    $entry.Info = Get-LabVolumeUsbSpeedInfo -DriveLetter $newLetter
                    if (-not [string]::IsNullOrWhiteSpace($entry.Info.EffectiveSerial)) { $entry.EffectiveSerial = $entry.Info.EffectiveSerial }
                    if (-not [string]::IsNullOrWhiteSpace($entry.Info.DiskSerialNumber)) { $entry.DiskSerialNumber = $entry.Info.DiskSerialNumber }
                    if (-not [string]::IsNullOrWhiteSpace($entry.Info.UsbSerial)) { $entry.UsbSerial = $entry.Info.UsbSerial }
                }

                if ($missingAny) {
                    continue
                }

                $stillUsb2 = @($trackedItems | Where-Object { $_.Info.IsUsb2 })
                if ($stillUsb2.Count -eq 0) {
                    foreach ($entry in @($trackedItems | Where-Object { $_.Info.IsUsb })) {
                        Write-LabOk (Format-LabText "UsbSpeedRelocatedOk" ("{0}: ({1})" -f $entry.CurrentLetter, $entry.Info.DiskFriendlyName) $entry.Info.UsbDisplay)
                    }
                    $finalLetters = @($trackedItems | ForEach-Object { $_.CurrentLetter })
                    return [pscustomobject]@{
                        Approved = $true
                        DriveLetters = $finalLetters
                    }
                }

                $stillSummary = (($stillUsb2 | ForEach-Object { "{0}:" -f $_.CurrentLetter }) -join ", ")
                Write-LabWarning (Format-LabText "UsbSpeedStillUsb2" $stillSummary)
            }
            "2" {
                Write-LabWarning (Get-LabText "UsbSpeedContinuedUsb2")
                $finalLetters = @($trackedItems | ForEach-Object { $_.CurrentLetter })
                return [pscustomobject]@{
                    Approved = $true
                    DriveLetters = $finalLetters
                }
            }
            "0" {
                return [pscustomobject]@{
                    Approved = $false
                    DriveLetters = @()
                }
            }
            default {
                Write-LabWarning (Get-LabText "InvalidOption")
            }
        }
    }
}

Set-LabConsoleStyle

Set-Alias -Name L -Value Get-LabText -Scope Script
Set-Alias -Name LF -Value Format-LabText -Scope Script
