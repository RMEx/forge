import electron from 'electron'
import util from './util'
import ruby from './ruby'
import forage from './forage'
import path from 'path'
import fs from 'fs'
import elm from '../elm/Main.elm'
const {remote} = electron

const fetchPath = function() {
  const potentialPath = forage.fetch('project-path')
  if (potentialPath !== null) {
    const rvproj = path.join(potentialPath, 'Game.rvproj2')
    if (fs.existsSync(rvproj)) {
      return potentialPath
    }
  }
  return null
}

const container = document.getElementById('app');
const projectPath = fetchPath()
const elmApp = elm.Main.embed(container, {
  path: projectPath
});

// Ports

// Retreive the current project
elmApp.ports.fetchProject.subscribe(
  function(pwd) {
    const dir = path.resolve(pwd)
    ruby.run('project_reader.rb', [dir], (data) => {
      forage.remove('project-path')
      if(data.ok) {
        forage.store('project-path', data.payload.path)
      } elmApp.ports.sendProject.send(data)
    })
  }
)

// Open project selection
const {dialog} = remote
elmApp.ports.selectProject.subscribe(
  function(forgetful) {
    dialog.showOpenDialog({ properties: ['openDirectory']}, (pwds) => {
      const pwd = util.fetchHead(pwds)
      if (pwd === null) {
        forage.remove('project-path')
      }
      elmApp.ports.selectedProject.send(pwd)
    })
  }
)
