// MYSQL 配置
const Config = require('./config.js');

const Importer = require('mysql-import');
const importer = new Importer({host: Config.host, port: Config.port, user: Config.user, password: Config.password});

const optionDefinitions = [
    {name:'name', type: String, multiple: true, defaultOption: true}
];
const commandLineArgs = require('command-line-args');
const options = commandLineArgs(optionDefinitions);
// console.log(options);
if(options.name == undefined || options.name.length <= 0) {
    console.log('缺少快照版本号');
    return;
}

const fs = require('fs');
let file_counter = 0;
(async()=>{
    for(let us of options.name.filter((v, i, self) => self.indexOf(v) === i)){
        console.log(`============= Preparing for ${us} =============`);

        // 获取目标目录中的文件列表
        let files = fs.readdirSync('./user_cases/' + us);
        // console.log(files);
        
        let sqls = [];
        if(files.length > 0){
            for(let file of files){
                sqls.push('./user_cases/' + us + '/' + file);
            }

            await importer.import(sqls.sort()).then(()=>{
                let files_imported = importer.getImported();
                console.log(`${files_imported.length - file_counter} SQL file(s) imported.`);
                file_counter = files_imported.length;
                console.log();
            });
        }

    }
})();