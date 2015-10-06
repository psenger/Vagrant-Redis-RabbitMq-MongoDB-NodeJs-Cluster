/**
 * Created by philipsenger on 3/10/15.
 */
module.exports = function (shipit) {
    shipit.initConfig({
        dev: {
            servers: [ 'shipit@192.168.33.11' ]
        }
        //,
        //default: {
        //    key: './server.key'
        //}
    });

    shipit.task('pwd', function () {
        return shipit.remote('pwd');
    });
};

//module.exports = function (shipit) {
//    require('shipit-deploy')(shipit);
//
//    shipit.initConfig({
//        default: {
//            workspace: '/tmp/github-monitor',
//            deployTo: '/tmp/deploy_to',
//            repositoryUrl: 'https://github.com/user/repo.git',
//            ignores: ['.git', 'node_modules'],
//            keepReleases: 2,
//            deleteOnRollback: false,
//            key: '/path/to/key',
//            shallowClone: true
//        },
//        dev: {
//            servers: [ 'shipit@192.168.33.11' ]
//        }
//    });
//};