const electron = require('electron')

const app = electron.app
const BrowserWindow = electron.BrowserWindow


let mainWindow
function createWindow() {
  mainWindow = new BrowserWindow({
    width: 930,
    height: 540,
    minWidth: 820,
    minHeight: 320,
    frame: true,
    resizable: true
  })
  mainWindow.loadURL(`file://${ __dirname }/index.html`)
  mainWindow.webContents.openDevTools()
  mainWindow.on('closed', function() {
    mainWindow = null
  })
}

app.on('ready', createWindow)
app.on('window-all-closed', () => {
  app.quit()
})
app.on('activate', () => {
  if (mainWindow === null) {
    createWindow()
  }
})
