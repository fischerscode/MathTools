# Web Build Setup - Summary

## Zusammenfassung (German Summary)

### Was wurde gemacht?

Ich habe einen automatisierten Web-Build-Prozess für das MathTools Flutter-Projekt eingerichtet. Das Projekt ist relativ alt (Flutter SDK >=2.16.1), aber ich habe mich entschieden, **nicht zu upgraden**, sondern mit der aktuellen stabilen Flutter-Version zu bauen, die mit den bestehenden Dependencies kompatibel ist.

### Die Lösung umfasst:

1. **GitHub Actions Workflow** (`.github/workflows/web_build_artifact.yaml`)
   - Baut automatisch die Web-Version bei jedem Push auf master, main oder copilot branches
   - Kann auch manuell über die GitHub Actions UI gestartet werden
   - Erstellt zwei herunterladbare Artifacts:
     - `math-tools-web-build.zip` - Komplettes Web-Build als ZIP-Datei
     - `math-tools-web-files` - Web-Build-Dateien als Ordner
   - Artifacts werden 90 Tage aufbewahrt

2. **Dokumentation** (`WEB_BUILD_DOWNLOAD.md`)
   - Ausführliche Anleitung zum Herunterladen des Web-Builds
   - Anleitungen zum lokalen Testen mit Python, Node.js oder PHP
   - Troubleshooting-Tipps
   - Deployment-Optionen

3. **README-Aktualisierung**
   - Link zur Dokumentation
   - Schnellstart-Anleitung

### Wie verwendet man es?

#### Sofort verfügbar (nach Genehmigung):
1. Gehe zu: https://github.com/fischerscode/MathTools/actions/workflows/web_build_artifact.yaml
2. Wähle den neuesten erfolgreichen Workflow-Run
3. Scrolle zu "Artifacts" und lade `math-tools-web-build.zip` herunter
4. Entpacke die Datei und starte einen lokalen Webserver:
   ```bash
   python3 -m http.server 8000
   ```
5. Öffne http://localhost:8000 im Browser

#### Nach Merge auf master:
- Der Build läuft automatisch bei jedem Push
- Artifacts sind immer verfügbar unter Actions

### Wichtiger Hinweis:
Der Workflow benötigt eine einmalige Genehmigung vom Repository-Besitzer, um auf Pull-Request-Branches zu laufen. Dies ist eine Sicherheitsfunktion von GitHub. Nach dem Merge auf master läuft der Workflow automatisch ohne Genehmigung.

### Technische Entscheidungen:
- **Keine Upgrade der Dependencies**: Das Projekt ist stabil mit den aktuellen Versionen
- **Verwendung von Flutter Stable Channel**: Garantiert Kompatibilität
- **Base-href "/"**: Ermöglicht einfaches lokales Testen
- **Sicherheit**: Explizite Permissions im Workflow gesetzt
- **Retention**: 90 Tage Aufbewahrung der Artifacts

---

## English Summary

### What was done?

I have set up an automated web build process for the MathTools Flutter project. The project is relatively old (Flutter SDK >=2.16.1), but I decided **not to upgrade**, instead building with the current stable Flutter version which is compatible with the existing dependencies.

### The solution includes:

1. **GitHub Actions Workflow** (`.github/workflows/web_build_artifact.yaml`)
   - Automatically builds the web version on every push to master, main, or copilot branches
   - Can also be triggered manually via the GitHub Actions UI
   - Creates two downloadable artifacts:
     - `math-tools-web-build.zip` - Complete web build as a ZIP file
     - `math-tools-web-files` - Web build files as a folder
   - Artifacts are retained for 90 days

2. **Documentation** (`WEB_BUILD_DOWNLOAD.md`)
   - Detailed guide for downloading the web build
   - Instructions for local testing with Python, Node.js, or PHP
   - Troubleshooting tips
   - Deployment options

3. **README Update**
   - Link to documentation
   - Quick start guide

### How to use it?

#### Available immediately (after approval):
1. Go to: https://github.com/fischerscode/MathTools/actions/workflows/web_build_artifact.yaml
2. Select the most recent successful workflow run
3. Scroll to "Artifacts" and download `math-tools-web-build.zip`
4. Extract the file and start a local web server:
   ```bash
   python3 -m http.server 8000
   ```
5. Open http://localhost:8000 in your browser

#### After merge to master:
- Build runs automatically on every push
- Artifacts are always available under Actions

### Important Note:
The workflow requires one-time approval from the repository owner to run on pull request branches. This is a GitHub security feature. After merging to master, the workflow runs automatically without approval.

### Technical Decisions:
- **No dependency upgrade**: Project is stable with current versions
- **Using Flutter Stable Channel**: Guarantees compatibility
- **Base-href "/"**: Enables easy local testing
- **Security**: Explicit permissions set in workflow
- **Retention**: 90 days retention for artifacts
