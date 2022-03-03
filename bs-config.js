
/*
 |--------------------------------------------------------------------------
 | Browser-sync config file
 |--------------------------------------------------------------------------
 |
 | For up-to-date information about the options:
 |   http://www.browsersync.io/docs/options/
 |
 | There are more options than you see here, these are just the ones that are
 | set internally. See the website for more info.
 |
 |
 */

require('dotenv').config();

var tailwindConfig = {};
var tailwindConfigOriginal = require('./tailwind.config.js');
tailwindConfig.theme = tailwindConfigOriginal.theme;
tailwindConfig.corePlugins = tailwindConfigOriginal.corePlugins;

module.exports = {
    "ui": {
        "port": 3001
    },
    "files": ["assets/css/*.css", "assets/js/*.js"],
    "watchEvents": [
        "change"
    ],
    "watch": true,
    "ignore": [],
    "single": false,
    "watchOptions": {
        "ignoreInitial": true
    },
    "server": false,
    "proxy": {
        target: process.env.TEST_URL,
        proxyReq: [
            function(proxyReq){
                proxyReq.setHeader("cf-access-token", process.env.CF_TOKEN);
            }
        ]
    },
    "port": 3000,
    "middleware": false,
    "serveStatic": [
        {
            route: '/themes/child_PRS171_01/assets/fonts',
            dir: 'assets/fonts'
        },
        {
            route: '/themes/child_PRS171_01/assets/css',
            dir: 'assets/css'
        },
        {
            route: '/themes/child_PRS171_01/assets/js',
            dir: 'assets/js'
        }
    ],
    "ghostMode": {
        "clicks": true,
        "scroll": true,
        "location": true,
        "forms": {
            "submit": true,
            "inputs": true,
            "toggles": true
        }
    },
    "logLevel": "info",
    "logPrefix": "Browsersync",
    "logConnections": false,
    "logFileChanges": true,
    "logSnippet": true, 
    "snippetOptions": {
        rule: {
            match: /<\/head>/i,
            fn: function (snippet, match) {
                return '<script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script><script> tailwind.config = ' + JSON.stringify(tailwindConfig) + ';</script>' + snippet + match;
            }
        }
    },
    "rewriteRules": [],
    "open": "local",
    "browser": "default",
    "cors": false,
    "xip": false,
    "hostnameSuffix": false,
    "reloadOnRestart": false,
    "notify": true,
    "scrollProportionally": true,
    "scrollThrottle": 0,
    "scrollRestoreTechnique": "window.name",
    "scrollElements": [],
    "scrollElementMapping": [],
    "reloadDelay": 0,
    "reloadDebounce": 500,
    "reloadThrottle": 0,
    "plugins": [],
    "injectChanges": true,
    "startPath": null,
    "minify": true,
    "host": null,
    "localOnly": false,
    "codeSync": true,
    "timestamps": true,
    "clientEvents": [
        "scroll",
        "scroll:element",
        "input:text",
        "input:toggles",
        "form:submit",
        "form:reset",
        "click"
    ],
    "socket": {
        "socketIoOptions": {
            "log": false
        },
        "socketIoClientConfig": {
            "reconnectionAttempts": 50
        },
        "path": "/browser-sync/socket.io",
        "clientPath": "/browser-sync",
        "namespace": "/browser-sync",
        "clients": {
            "heartbeatTimeout": 5000
        }
    },
    "tagNames": {
        "less": "link",
        "scss": "link",
        "css": "link",
        "jpg": "img",
        "jpeg": "img",
        "png": "img",
        "svg": "img",
        "gif": "img",
        "js": "script"
    },
    "injectNotification": false
};