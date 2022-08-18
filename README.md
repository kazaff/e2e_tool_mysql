## 配置

使用本工具前，需要先在 `config.js` 文件中填写目标数据库的信息：

```
module.exports = {
    host: 'localhost',
    port: 3307,
    user: 'root',
    password: 'root',
    databases: ['e2e_test']  // 所有需要备份的数据库，每个数据库会备份成一个sql文件
}
```

## 运行方式

### 初始化指定数据库快照

```
npm run setup -- <快照版本号>
```


### 备份指定数据快照

```
npm run backup -- <快照版本号> [-f]
```

可选参数 `-f` 表示强制创建，即会覆盖本地已存在的快照。