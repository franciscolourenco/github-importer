Development
------------------
```
cd chrome-extension
npm install
npm run dev
```
Then open [chrome://extensions/](chrome://extensions/), enable developer mode, and load `chrome-extension/src`.

Build
-----------------------
```
cd chrome-extension
npm run build
```
Then open [chrome://extensions/](chrome://extensions/), enable developer mode, and load `chrome-extension/dist`.


Release
----------------------
```
cd chrome-extension
(npm run build)
npm run release
```
Compresses `chrome-extension/dist` into `chrome-extension/releases` using the version number from package.json.
The zip file is ready to upload.
