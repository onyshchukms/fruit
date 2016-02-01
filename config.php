<?php
// HTTP
define('HTTP_SERVER', 'http://fruit.loc:8888/');

// HTTPS
define('HTTPS_SERVER', 'http://fruit.loc:8888/');

// DIR
define('DIR_APPLICATION', '/Users/misha/Workspace/php_projects/fruit/catalog/');
define('DIR_SYSTEM', '/Users/misha/Workspace/php_projects/fruit/system/');
define('DIR_LANGUAGE', '/Users/misha/Workspace/php_projects/fruit/catalog/language/');
define('DIR_TEMPLATE', '/Users/misha/Workspace/php_projects/fruit/catalog/view/theme/');
define('DIR_CONFIG', '/Users/misha/Workspace/php_projects/fruit/system/config/');
define('DIR_IMAGE', '/Users/misha/Workspace/php_projects/fruit/image/');
define('DIR_CACHE', '/Users/misha/Workspace/php_projects/fruit/system/storage/cache/');
define('DIR_DOWNLOAD', '/Users/misha/Workspace/php_projects/fruit/system/storage/download/');
define('DIR_LOGS', '/Users/misha/Workspace/php_projects/fruit/system/storage/logs/');
define('DIR_MODIFICATION', '/Users/misha/Workspace/php_projects/fruit/system/storage/modification/');
define('DIR_UPLOAD', '/Users/misha/Workspace/php_projects/fruit/system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'root');
define('DB_DATABASE', 'fruit');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');


// POSITIONS
define('positions', serialize(array(
    'home_block_1' => array(
        'label' => 'Home - Block 1',
        'template' => 'home_block_1.tpl'
    ),
    'home_block_2' => array(
        'label' => 'Home - Block 2',
        'template' => 'home_block_2.tpl'
    ),
    'home_block_3' => array(
        'label' => 'Home - Block 3',
        'template' => 'home_block_3.tpl'
    ),
    'home_block_4' => array(
        'label' => 'Home - Block 4',
        'template' => 'home_block_4.tpl'
    ),
    'home_block_5' => array(
        'label' => 'Home - Block 5',
        'template' => 'home_block_5.tpl'
    ),
    'home_block_6' => array(
        'label' => 'Home - Block 6',
        'template' => 'home_block_6.tpl'
    ),
    'home_block_7' => array(
        'label' => 'Home - Block 7',
        'template' => 'home_block_7.tpl'
    ),
    'home_block_8' => array(
        'label' => 'Home - Block 8',
        'template' => 'home_block_8.tpl'
    ),
)));
