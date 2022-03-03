const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin')

const jsConfig = {
    mode: 'development',
    target: "web",
    entry: {
        index: ['./js/index.js'],
    },
    output: {
        path: path.resolve(__dirname, 'assets/js'),
        filename: '[name].js'
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: ['@babel/preset-env'],
                        plugins: ['@babel/transform-runtime', "@babel/plugin-proposal-class-properties"]
                    }
                }
            },
        ]
    },
    resolve: {
        alias: {
          'vue$': 'vue/dist/vue.esm.js'
        }
    },
    devServer: {
        writeToDisk: false,
        contentBase: path.resolve(__dirname, 'assets'),
        publicPath: '/assets/js/',
        host: '0.0.0.0',
        watchContentBase: true,
        compress: true,
        port: 9001,
        headers: { "Access-Control-Allow-Origin": "*" }
    }
}

const cssConfig = {
    entry: {
        index: ['./css/index.css'],
    },
    output: {
        path: path.resolve(__dirname, 'assets/css'),
    },
    module: {
        rules: [
            {
                test: /\.(png|svg|jpg|gif)$/,
                loader: 'file-loader',
                options: {
                    outputPath: 'images',
                },
            },
            {
                test: /\.css$/,
                use: [
                    process.env.NODE_ENV === "development"
                      ? {
                        loader: "style-loader",
                        options: { injectType: 'styleTag' }
                      }
                      : MiniCssExtractPlugin.loader,
                    {
                      loader: "css-loader",
                      options: { importLoaders: 1, }
                    },
                    {
                      loader: "postcss-loader"
                    }
                ]
            },
        ],
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: '[name].css',
        }),
    ],
}

module.exports = [jsConfig, cssConfig];