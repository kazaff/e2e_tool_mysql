const Config = require('./config.js');
const fs = require('fs');

const optionDefinitions = [
    {name:'name', type: String, multiple: true, defaultOption: true},
    {name: 'force', alias: 'f', type: Boolean}
];
const commandLineArgs = require('command-line-args');
const options = commandLineArgs(optionDefinitions);
// console.log(options);

if(options.name == undefined || options.name.length != 1) {
    console.error('请指定要备份的快照版本（不支持单次指定多个版本号哦）');
    return;
}

let snapshot = options.name[0];

if(options.force === true){
    fs.rmdirSync('./user_cases/' + snapshot, {force:true, recursive: true});
}

if(fs.existsSync('./user_cases/' + snapshot)){
    console.error('快照版本已存在');
    return;
}


if(Config.databases.length <= 0){
    console.error('请在config.js文件中配置需要备份的数据库名称');
    return;
}

const insertLine = require('insert-line');
const mysqldump = require('mysqldump');
fs.mkdirSync('./user_cases/' + snapshot);
(async()=>{
    for(let db of Config.databases){
        await mysqldump({
            connection: {
                host: Config.host,
                port: Config.port,
                user: Config.user,
                password: Config.password,
                database: db
            },
            dump: {
                schema: {
                    table: {
                        dropIfExist: true
                    }
                },
                data: {
                    maxRowsPerInsertStatement: 100
                }
            },
            dumpToFile: './user_cases/' + snapshot + '/' + db + '.sql'
        });

        await insertLine('./user_cases/' + snapshot + '/' + db + '.sql')
                    .content(`
CREATE DATABASE /*!32312 IF NOT EXISTS*/\`${db}\` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE \`${db}\`;
                    `).at(8);
    }
    console.log('备份完毕');
})();