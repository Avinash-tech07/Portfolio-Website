<?php

function pglife_load_env($path)
{
    if (!is_readable($path)) {
        return;
    }

    $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    if ($lines === false) {
        return;
    }

    foreach ($lines as $line) {
        $line = trim($line);
        if ($line === '' || $line[0] === '#') {
            continue;
        }
        if (strpos($line, '=') === false) {
            continue;
        }

        list($name, $value) = explode('=', $line, 2);
        $name = trim($name);
        $value = trim($value);
        $value = trim($value, "\"'");

        if (getenv($name) === false) {
            putenv($name . '=' . $value);
            $_ENV[$name] = $value;
        }
    }
}

function pglife_env($keys, $default = '')
{
    foreach ((array) $keys as $key) {
        $value = getenv($key);
        if ($value !== false && $value !== '') {
            return $value;
        }
        if (isset($_ENV[$key]) && $_ENV[$key] !== '') {
            return $_ENV[$key];
        }
        if (isset($_SERVER[$key]) && $_SERVER[$key] !== '') {
            return $_SERVER[$key];
        }
    }

    return $default;
}

function pglife_db_config()
{
    pglife_load_env(dirname(__DIR__) . '/.env');

    $database_url = pglife_env(array('DATABASE_URL', 'MYSQL_URL', 'CLEARDB_DATABASE_URL'));
    if ($database_url !== '') {
        $parts = parse_url($database_url);
        if ($parts !== false && isset($parts['host'])) {
            $path = isset($parts['path']) ? ltrim($parts['path'], '/') : 'pglife';
            return array(
                'host' => $parts['host'],
                'user' => isset($parts['user']) ? urldecode($parts['user']) : 'root',
                'pass' => isset($parts['pass']) ? urldecode($parts['pass']) : '',
                'name' => $path !== '' ? $path : 'pglife',
                'port' => isset($parts['port']) ? (int) $parts['port'] : 3306,
            );
        }
    }

    return array(
        'host' => pglife_env(array('DB_HOST', 'MYSQLHOST', 'MYSQL_HOST'), '127.0.0.1'),
        'user' => pglife_env(array('DB_USER', 'MYSQLUSER', 'MYSQL_USER'), 'root'),
        'pass' => pglife_env(array('DB_PASSWORD', 'MYSQLPASSWORD', 'MYSQL_PASSWORD'), ''),
        'name' => pglife_env(array('DB_NAME', 'MYSQLDATABASE', 'MYSQL_DATABASE'), 'pglife'),
        'port' => (int) pglife_env(array('DB_PORT', 'MYSQLPORT', 'MYSQL_PORT'), '3306'),
    );
}
