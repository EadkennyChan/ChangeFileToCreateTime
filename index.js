var fs = require("fs");
var moment = require("moment");

let strBaseFilePath = '你的文件所在的文件夹路径'
const supportExtensionArray = ['jpg', 'mov', '.png', 'mp4'];    // 支持的文件格式

// 读取文件夹下的文件
const paths = fs.readdirSync(strBaseFilePath);
paths.forEach( function (item) {
    const strOriginFilePath = strBaseFilePath + item;
    const fileComponents = item.split('.');
    const strExtension = fileComponents[fileComponents.length - 1];

    const bIsFind = supportExtensionArray.some(extItem => {
        return extItem.toLowerCase() === strExtension.toLocaleLowerCase();
    });
    if (!bIsFind) {
        return;
    }
    // 读取文件的修改日期时间
    const stat = fs.statSync(strOriginFilePath);
    const ctime = moment(stat.birthtimeMs);
    
    const strMDate = ctime.format('YYYYMMDD.HHmmss');
    
    let strNewFilePath = strBaseFilePath + strMDate + '.' + strExtension;
    let count = 1;
    while (fs.existsSync(strNewFilePath)) {
        strNewFilePath = strBaseFilePath + strMDate + '-' + count + '.' + strExtension;
        count++;
    }
    console.log(strOriginFilePath, ' ----to---- ', strNewFilePath);
    fs.renameSync(strOriginFilePath, strNewFilePath);
});

console.log(paths);