<?php
/**
 * 项目配置文件
 */

/**
 * 数据库主机
 */
define('XIU_DB_HOST', '127.0.0.1');

/**
 * 数据库用户名
 */
define('XIU_DB_USER', 'root');

/**
 * 数据库密码
 */
define('XIU_DB_PASS', '123456');

/**
 * 数据库名称
 */
define('XIU_DB_NAME', 'baixiu-dev3');

//这个函数永远拿的是当前文件的物理路径，不管这个
//文件被载入到哪里，都是这个值

// D:\www\baixiu-dev\config.php
//其实我定义了也没有用
//defined('ROOT_DIR',dirname(__FILE__));
