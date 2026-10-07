# RapidDeploy Toolkit

Portable, optional tools for Windows OOBE diagnostics and enterprise provisioning.

## English (EN)

This toolkit is **100% optional**. It is intended for enterprise Windows Autopilot, Microsoft Intune, and Microsoft Entra ID deployments. It can capture the Autopilot hardware hash through `MDM_DevDetail_Ext01`, add a preset or custom Group Tag to the CSV, display local Autopilot/Enrollment Status Page diagnostics, resynchronize time through Windows Time/NTP, and trigger a manual MDM check-in with `DeviceEnroller.exe`. It also includes disk and network utilities and a WIM image manager.

If you only prepare a standard Windows 11 ISO or USB for personal or home use, you can ignore this toolkit completely.

### Start from OOBE

1. Copy the **entire contents** of `RapidDeploy_Toolkit` directly to the root of the USB drive (or another partition accessible from OOBE). `menu.cmd` must be at that root.
2. At the Windows first-setup screen, press **Shift + F10** to open Command Prompt.
3. Change to the drive containing the toolkit (for example, `E:`), then run `menu.cmd`.
4. Use the menu for hash capture and Group Tags, diagnostics, time synchronization, MDM check-in, or other deployment tasks.

The hash CSV is written under `HardwareIDs` beside the toolkit. It contains a device serial number and hardware hash; handle it as sensitive provisioning data.

### Disk erase warning

The quick and confirmed wipe actions both target **Disk 0** from `scripts\clean_disk0.txt`. The quick action has no confirmation; the safer menu action asks you to type `ERASE`. Both run DiskPart `clean` and convert Disk 0 to GPT. `clean` removes partition information; it is **not** a secure data-overwrite or media-sanitization operation. Before either action, verify that Disk 0 is the intended disposable drive and that required data is backed up. The confirmation does not change the target disk.

The toolkit is designed for Windows OOBE. Hash capture requires Windows/OOBE and may not work in bare WinPE. The time and MDM actions need the appropriate network, Windows services, and enrollment context.

## Español (ES)

Este toolkit es **100 % opcional** y está pensado para aprovisionamiento empresarial de Windows con Autopilot, Microsoft Intune y Microsoft Entra ID. Permite capturar el hash de hardware de Autopilot mediante `MDM_DevDetail_Ext01`, añadir al CSV una Group Tag predefinida o personalizada, mostrar diagnósticos locales de Autopilot y de la página de estado de inscripción, resincronizar la hora mediante el servicio de hora de Windows/NTP y solicitar una sincronización MDM manual con `DeviceEnroller.exe`. También incluye utilidades de disco y red y un administrador de imágenes WIM.

Si solo preparas una ISO o un USB estándar de Windows 11 para uso personal o doméstico, puedes ignorarlo por completo.

### Inicio desde OOBE

1. Copia el **contenido íntegro** de `RapidDeploy_Toolkit` directamente a la raíz del USB (o a otra partición accesible desde OOBE). `menu.cmd` debe quedar en esa raíz.
2. En la pantalla de configuración inicial de Windows, pulsa **Mayús + F10** para abrir la consola de comandos.
3. Cambia a la unidad del toolkit (por ejemplo, `E:`) y ejecuta `menu.cmd`.
4. Usa el menú para capturar el hash y asignar Group Tags, consultar diagnósticos, resincronizar la hora, solicitar la sincronización MDM u otras tareas de despliegue.

El CSV del hash se guarda en `HardwareIDs`, junto al toolkit. Contiene el número de serie y el hash de hardware del dispositivo; trátalo como información sensible de aprovisionamiento.

### Advertencia sobre el borrado de disco

Las opciones de borrado rápido y con confirmación actúan ambas sobre el **Disco 0**, según `scripts\clean_disk0.txt`. La opción rápida no pide confirmación; la opción más segura del menú exige escribir `ERASE`. Ambas ejecutan DiskPart `clean` y convierten el Disco 0 a GPT. `clean` elimina la información de particiones, pero **no sobrescribe de forma segura los datos ni sanitiza el soporte**. Antes de usar cualquiera, verifica que el Disco 0 sea la unidad prescindible correcta y que los datos necesarios estén respaldados. La confirmación no cambia el disco de destino.

El toolkit está pensado para OOBE de Windows. La captura del hash requiere Windows/OOBE y puede no funcionar en WinPE básico. Las funciones de hora y MDM necesitan red, servicios de Windows y el contexto de inscripción correspondiente.

## Français (FR)

Cette boîte à outils est **100 % facultative**. Elle vise le provisionnement d’entreprise avec Windows Autopilot, Microsoft Intune et Microsoft Entra ID. Elle peut capturer le hash matériel Autopilot via `MDM_DevDetail_Ext01`, ajouter au CSV un Group Tag prédéfini ou personnalisé, afficher les diagnostics locaux Autopilot/ESP, resynchroniser l’heure avec le service Windows Time/NTP et déclencher une synchronisation MDM manuelle avec `DeviceEnroller.exe`. Elle comprend aussi des utilitaires de disque et de réseau ainsi qu’un gestionnaire d’images WIM.

Si vous préparez uniquement une ISO ou une clé USB Windows 11 standard pour un usage personnel ou familial, vous pouvez ignorer complètement cet outil.

### Lancement depuis OOBE

1. Copiez **tout le contenu** de `RapidDeploy_Toolkit` directement à la racine de la clé USB (ou d’une autre partition accessible depuis OOBE). `menu.cmd` doit se trouver à cette racine.
2. À l’écran de première configuration de Windows, appuyez sur **Maj + F10** pour ouvrir l’invite de commandes.
3. Passez sur le lecteur du toolkit (par exemple `E:`), puis lancez `menu.cmd`.
4. Utilisez le menu pour capturer le hash et définir des Group Tags, consulter les diagnostics, resynchroniser l’heure ou déclencher le contrôle MDM.

Le CSV du hash est enregistré dans `HardwareIDs`, à côté du toolkit. Il contient le numéro de série et le hash matériel de l’appareil : protégez-le comme une donnée sensible de provisionnement.

### Avertissement concernant l’effacement du disque

Les deux options d’effacement ciblent le **Disque 0**, comme indiqué dans `scripts\clean_disk0.txt`. L’effacement rapide ne demande aucune confirmation ; l’option avec confirmation exige de saisir `ERASE`. Les deux exécutent DiskPart `clean` puis convertissent le Disque 0 en GPT. `clean` supprime les informations de partition ; il **n’effectue pas d’écrasement sécurisé des données ni de sanitisation du support**. Vérifiez que le Disque 0 est bien le disque destiné à être effacé et sauvegardez les données nécessaires. La confirmation ne change pas le disque ciblé.

L’outil est prévu pour OOBE Windows. La capture du hash nécessite Windows/OOBE et peut échouer dans un WinPE minimal. Les fonctions d’heure et de MDM nécessitent le réseau, les services Windows et un contexte d’inscription adapté.

## Română (RO)

Acest toolkit este **100% opțional** și este destinat aprovizionării enterprise Windows cu Autopilot, Microsoft Intune și Microsoft Entra ID. Poate captura hash-ul hardware Autopilot prin `MDM_DevDetail_Ext01`, poate adăuga în CSV un Group Tag presetat sau personalizat, poate afișa diagnostice locale Autopilot/ESP, poate resincroniza ora prin serviciul Windows Time/NTP și poate declanșa o sincronizare MDM manuală cu `DeviceEnroller.exe`. Include și utilitare pentru discuri și rețea, precum și un manager de imagini WIM.

Dacă pregătești doar un ISO sau un USB Windows 11 standard pentru uz personal sau casnic, poți ignora complet acest toolkit.

### Pornire din OOBE

1. Copiază **întregul conținut** al folderului `RapidDeploy_Toolkit` direct în rădăcina stickului USB (sau a unei alte partiții accesibile din OOBE). `menu.cmd` trebuie să fie în acea rădăcină.
2. În ecranul de configurare inițială Windows, apasă **Shift + F10** pentru a deschide Command Prompt.
3. Schimbă pe unitatea toolkitului (de exemplu `E:`), apoi rulează `menu.cmd`.
4. Folosește meniul pentru capturarea hash-ului și Group Tags, diagnosticare, resincronizarea orei, sincronizarea MDM sau alte sarcini de deployment.

Fișierul CSV cu hash-ul este salvat în `HardwareIDs`, lângă toolkit. Conține numărul de serie și hash-ul hardware al dispozitivului; păstrează-l ca dată sensibilă de aprovizionare.

### Avertisment privind ștergerea discului

Ambele opțiuni de ștergere vizează **Discul 0**, conform `scripts\clean_disk0.txt`. Ștergerea rapidă nu cere confirmare; opțiunea cu confirmare cere să tastezi `ERASE`. Ambele rulează DiskPart `clean` și convertesc Discul 0 la GPT. `clean` elimină informațiile despre partiții; **nu suprascrie în mod securizat datele și nu sanitizează suportul**. Verifică înainte că Discul 0 este unitatea care trebuie ștearsă și salvează datele necesare. Confirmarea nu schimbă discul țintă.

Toolkitul este destinat OOBE Windows. Capturarea hash-ului necesită Windows/OOBE și poate să nu funcționeze în WinPE simplu. Funcțiile de oră și MDM necesită rețea, serviciile Windows și contextul de înscriere corespunzător.

## Deutsch (DE)

Dieses Toolkit ist **zu 100 % optional**. Es ist für die Unternehmensbereitstellung mit Windows Autopilot, Microsoft Intune und Microsoft Entra ID vorgesehen. Es kann den Autopilot-Hardwarehash über `MDM_DevDetail_Ext01` erfassen, einen voreingestellten oder benutzerdefinierten Group Tag in die CSV-Datei aufnehmen, lokale Autopilot-/ESP-Diagnosen anzeigen, die Uhrzeit über Windows Time/NTP neu synchronisieren und mit `DeviceEnroller.exe` eine manuelle MDM-Synchronisierung anstoßen. Zusätzlich enthält es Festplatten- und Netzwerkwerkzeuge sowie einen WIM-Image-Manager.

Wenn Sie nur eine normale Windows-11-ISO oder einen USB-Stick für den privaten Gebrauch erstellen, können Sie dieses Toolkit vollständig ignorieren.

### Start aus OOBE

1. Kopieren Sie den **gesamten Inhalt** von `RapidDeploy_Toolkit` direkt in das Stammverzeichnis des USB-Sticks (oder einer anderen in OOBE erreichbaren Partition). `menu.cmd` muss dort direkt liegen.
2. Drücken Sie am Windows-Ersteinrichtungsbildschirm **Umschalt + F10**, um die Eingabeaufforderung zu öffnen.
3. Wechseln Sie zum Laufwerk des Toolkits (zum Beispiel `E:`) und starten Sie `menu.cmd`.
4. Nutzen Sie das Menü für Hash-Erfassung und Group Tags, Diagnosen, Zeitsynchronisierung, MDM-Abgleich und weitere Bereitstellungsaufgaben.

Die Hash-CSV wird im Ordner `HardwareIDs` neben dem Toolkit gespeichert. Sie enthält Seriennummer und Hardwarehash des Geräts und ist als vertrauliche Bereitstellungsinformation zu behandeln.

### Warnung zum Löschen des Datenträgers

Beide Löschfunktionen zielen auf **Datenträger 0**, wie in `scripts\clean_disk0.txt` festgelegt. Die schnelle Löschfunktion fragt nicht nach; die bestätigte Variante verlangt die Eingabe von `ERASE`. Beide führen DiskPart `clean` aus und konvertieren Datenträger 0 zu GPT. `clean` entfernt die Partitionsinformationen; es **überschreibt die Daten nicht sicher und löscht den Datenträger nicht gemäß einem Sanitization-Verfahren**. Prüfen Sie vorab, dass Datenträger 0 tatsächlich gelöscht werden darf, und sichern Sie benötigte Daten. Die Bestätigung ändert das Ziel nicht.

Das Toolkit ist für Windows-OOBE vorgesehen. Die Hash-Erfassung benötigt Windows/OOBE und funktioniert möglicherweise nicht in einer einfachen WinPE-Umgebung. Zeit- und MDM-Funktionen benötigen Netzwerkzugriff, Windows-Dienste und einen passenden Registrierungsstatus.
