var http = require('http')
const exec = require('child_process').execSync
var requestHandler = function (req, res) {
    try {
        // do something here,certification authorization etc
        //  passing parameters ,just like:exec('bash ~/blog-ci.sh'+' '+'sss') or use execFile()
        exec('bash ~/blog-ci.sh');
        res.end('ok');
    }
    catch (e) {
        console.log('script exec error', e);
        res.statusCode = 500;
        res.end('server error...');
    }
}
//create server
var web = http.createServer(requestHandler);
web.listen(12345, '0.0.0.0');
console.log('http running on http://0.0.0.0:12345');