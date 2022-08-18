module.exports = {
    host: 'localhost',
    port: 3307,
    user: 'root',
    password: 'root',
    databases: ['e2e_test']  // 所有需要备份的数据库，每个数据库会备份成一个sql文件
}