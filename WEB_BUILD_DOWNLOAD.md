# Web Build Download

This document explains how to download and use the web build of MathTools.

## Automated Build

The web build is automatically generated using GitHub Actions whenever code is pushed to the repository. The build artifacts are available for download from the GitHub Actions page.

## How to Download

1. Go to the [GitHub Actions page](https://github.com/fischerscode/MathTools/actions)
2. Click on the "Web Build Artifact" workflow
3. Select the most recent successful workflow run
4. Scroll down to the "Artifacts" section
5. Download either:
   - `math-tools-web-build.zip` - Complete web build as a single ZIP file
   - `math-tools-web-files` - Web build files as a folder

## How to Use

### Option 1: Using the ZIP file

1. Download `math-tools-web-build.zip`
2. Extract the ZIP file to a folder
3. Serve the extracted files using a web server:
   
   **Using Python:**
   ```bash
   cd path/to/extracted/files
   python3 -m http.server 8000
   ```
   
   **Using Node.js (with http-server):**
   ```bash
   npm install -g http-server
   cd path/to/extracted/files
   http-server -p 8000
   ```
   
   **Using PHP:**
   ```bash
   cd path/to/extracted/files
   php -S localhost:8000
   ```

4. Open your browser and navigate to `http://localhost:8000`

### Option 2: Using the web files directly

1. Download `math-tools-web-files`
2. Extract to your desired location
3. Follow the same serving instructions as Option 1

## Manual Trigger

You can also manually trigger a web build:

1. Go to the [GitHub Actions page](https://github.com/fischerscode/MathTools/actions)
2. Click on "Web Build Artifact" workflow
3. Click "Run workflow" button
4. Select the branch you want to build
5. Click "Run workflow"

The build will start and the artifacts will be available once completed.

## Deployment

The web build can also be deployed to:
- GitHub Pages (automatically done on master branch via the existing workflow)
- Any static web hosting service (Netlify, Vercel, Firebase Hosting, etc.)
- Your own web server

## Technical Details

- The web build is created using `flutter build web --release`
- Base href is set to `/` for local serving
- The build includes all necessary assets and icons
- Service worker is included for PWA functionality
- Build artifacts are retained for 90 days

## Troubleshooting

### White screen or errors when opening

Make sure you're serving the files through a web server, not opening the `index.html` file directly in a browser. Flutter web apps require a server due to CORS policies.

### Base href issues

If you plan to host the app in a subdirectory (e.g., `example.com/mathtools/`), you need to rebuild with the appropriate base href:

```bash
flutter build web --release --base-href /mathtools/
```
