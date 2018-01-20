import childProcess from 'child_process'
import path from 'path'

/* A Simple example :
 * `ruby.run('project_reader.rb', ['sample/AlmostHeroic'], console.log)`
 */
const run = function(script, params, callback) {
  const obj = path.join('src', 'ruby', script)
  const cmd = 'ruby ' + obj + ' ' + params.join(' ')
  childProcess.exec(cmd, (err, output, errout) => {
    if(err) {
      callback({'ok': false, 'message': '' + err, 'payload': null})
    } else {
      const param = JSON.parse(output)
      callback(param)
    }
  })
}

export default {run}
