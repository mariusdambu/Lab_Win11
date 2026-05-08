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
    }
    es = @{
        PressEnterContinue = "Pulsa ENTER para continuar"
        PressEnterExit = "Pulsa ENTER para salir"
        Option = "Opcion"
        Number = "Numero"
        InvalidNumber = "Numero no valido."
        InvalidOption = "Opcion no valida."
        YesNoInvalid = "Responde S o N."
        Cancelled = "Cancelado."
        ErrorPrefix = "ERROR: {0}"
        Log = "Log"
        YesText = "SI"
        NoText = "NO"
        Low = "BAJO"
        Medium = "MEDIO"
        High = "ALTO"
        Copy = "Copiar"
        Back = "Volver"
        CopiedClipboard = "Copiado al portapapeles."
        NotCopied = "No pude copiar automaticamente. Selecciona el comando y pulsa Ctrl+C."
        LanguageEnglish = "Ingles"
        LanguageSpanish = "Espanol"
        LanguageFrench = "Frances"
        LanguageRomanian = "Rumano"
        LanguageGerman = "Aleman"
    }
    fr = @{
        PressEnterContinue = "Appuyez sur ENTREE pour continuer"
        PressEnterExit = "Appuyez sur ENTREE pour quitter"
        Option = "Option"
        Number = "Numero"
        InvalidNumber = "Numero invalide."
        InvalidOption = "Option invalide."
        YesNoInvalid = "Repondez O ou N."
        Cancelled = "Annule."
        ErrorPrefix = "ERREUR: {0}"
        Log = "Journal"
        YesText = "OUI"
        NoText = "NON"
        Low = "FAIBLE"
        Medium = "MOYEN"
        High = "ELEVE"
        Copy = "Copier"
        Back = "Retour"
        CopiedClipboard = "Copie dans le presse-papiers."
        NotCopied = "Copie automatique impossible. Selectionnez la commande et appuyez sur Ctrl+C."
        LanguageEnglish = "Anglais"
        LanguageSpanish = "Espagnol"
        LanguageFrench = "Francais"
        LanguageRomanian = "Roumain"
        LanguageGerman = "Allemand"
    }
    ro = @{
        PressEnterContinue = "Apasa ENTER pentru a continua"
        PressEnterExit = "Apasa ENTER pentru iesire"
        Option = "Optiune"
        Number = "Numar"
        InvalidNumber = "Numar invalid."
        InvalidOption = "Optiune invalida."
        YesNoInvalid = "Raspunde D sau N."
        Cancelled = "Anulat."
        ErrorPrefix = "EROARE: {0}"
        Log = "Log"
        YesText = "DA"
        NoText = "NU"
        Low = "SCAZUT"
        Medium = "MEDIU"
        High = "RIDICAT"
        Copy = "Copiaza"
        Back = "Inapoi"
        CopiedClipboard = "Copiat in clipboard."
        NotCopied = "Nu am putut copia automat. Selecteaza comanda si apasa Ctrl+C."
        LanguageEnglish = "Engleza"
        LanguageSpanish = "Spaniola"
        LanguageFrench = "Franceza"
        LanguageRomanian = "Romana"
        LanguageGerman = "Germana"
    }
    de = @{
        PressEnterContinue = "ENTER druecken zum Fortfahren"
        PressEnterExit = "ENTER druecken zum Beenden"
        Option = "Option"
        Number = "Nummer"
        InvalidNumber = "Ungueltige Nummer."
        InvalidOption = "Ungueltige Option."
        YesNoInvalid = "Antworten Sie J oder N."
        Cancelled = "Abgebrochen."
        ErrorPrefix = "FEHLER: {0}"
        Log = "Protokoll"
        YesText = "JA"
        NoText = "NEIN"
        Low = "NIEDRIG"
        Medium = "MITTEL"
        High = "HOCH"
        Copy = "Kopieren"
        Back = "Zurueck"
        CopiedClipboard = "In die Zwischenablage kopiert."
        NotCopied = "Automatisches Kopieren nicht moeglich. Befehl markieren und Ctrl+C druecken."
        LanguageEnglish = "Englisch"
        LanguageSpanish = "Spanisch"
        LanguageFrench = "Franzoesisch"
        LanguageRomanian = "Rumaenisch"
        LanguageGerman = "Deutsch"
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
    $suffix = if ($Default) { "[{0}/n]" -f $yesKey } else { "[{0}/N]" -f $yesKey.ToLowerInvariant() }

    while ($true) {
        $answer = (Read-Host "$Question $suffix").Trim()
        if ([string]::IsNullOrWhiteSpace($answer)) { return $Default }
        if ($answer -match "^[sSyYoOdDjJ]$") { return $true }
        if ($answer -match "^[nN]$") { return $false }
        Write-Host (Get-LabText "YesNoInvalid") -ForegroundColor Yellow
    }
}

function Write-LabSection {
    param(
        [string]$Title,
        [ConsoleColor]$Color = [ConsoleColor]::Cyan
    )

    Write-Host ""
    Write-Host ("=" * 72) -ForegroundColor DarkGray
    Write-Host $Title -ForegroundColor $Color
    Write-Host ("=" * 72) -ForegroundColor DarkGray
}

function Write-LabSubsection {
    param(
        [string]$Title,
        [ConsoleColor]$Color = [ConsoleColor]::Cyan
    )

    Write-Host ""
    Write-Host ("-- {0}" -f $Title) -ForegroundColor $Color
}

function Write-LabOk {
    param([string]$Message)

    Write-Host ("OK  {0}" -f $Message) -ForegroundColor Green
}

function Format-LabBytes {
    param([UInt64]$Bytes)

    if ($Bytes -ge 1TB) { return "{0:N2} TB" -f ($Bytes / 1TB) }
    if ($Bytes -ge 1GB) { return "{0:N2} GB" -f ($Bytes / 1GB) }
    if ($Bytes -ge 1MB) { return "{0:N2} MB" -f ($Bytes / 1MB) }
    return "$Bytes bytes"
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

    $buffer = New-Object byte[] (4MB)
    $total = [UInt64]$sourceItem.Length
    $copied = [UInt64]0
    $lastPercent = -1
    $inputStream = $null
    $outputStream = $null

    try {
        $inputStream = [System.IO.File]::Open($sourceItem.FullName, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::Read)
        $outputStream = [System.IO.File]::Open($Destination, [System.IO.FileMode]::Create, [System.IO.FileAccess]::Write, [System.IO.FileShare]::None)

        while (($read = $inputStream.Read($buffer, 0, $buffer.Length)) -gt 0) {
            $outputStream.Write($buffer, 0, $read)
            $copied += [UInt64]$read

            $percent = if ($total -gt 0) { [int][Math]::Min(100, [Math]::Floor(($copied * 100.0) / $total)) } else { 100 }
            if ($percent -ne $lastPercent) {
                $lastPercent = $percent
                Write-Progress -Activity $Activity -Status ("{0}: {1} / {2}" -f $sourceItem.Name, (Format-LabBytes $copied), (Format-LabBytes $total)) -PercentComplete $percent
            }
        }
    }
    finally {
        if ($outputStream) { $outputStream.Dispose() }
        if ($inputStream) { $inputStream.Dispose() }
        Write-Progress -Activity $Activity -Completed
    }

    $destinationItem = Get-Item -LiteralPath $Destination -ErrorAction Stop
    $destinationItem.LastWriteTime = $sourceItem.LastWriteTime
    return $destinationItem
}

Set-Alias -Name L -Value Get-LabText -Scope Script
Set-Alias -Name LF -Value Format-LabText -Scope Script
