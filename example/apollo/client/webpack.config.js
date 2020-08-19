const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const { merge } = require('webpack-merge');

const root = path.resolve(__dirname);
const dir = {
  source: 'src',
  dist: 'dist',
};

module.exports = (env) => {
  const is_production = env && env.prod;

  const config = {
    devtool: 'inline-source-map',
    entry: {
      app: [path.join(root, dir.source)],
    },
    output: {
      path: path.join(root, dir.dist),
      filename: 'bundle.js',
    },
    resolve: {
      extensions: ['.ts', '.tsx', '.js'],
    },
    module: {
      rules: [
        { test: /\.tsx?$/, loader: 'ts-loader', exclude: /node_modules/ },
        {
          test: /\.scss$/,
          use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader'],
        },
        {
          test: /\.(png|svg|jpg|gif)$/,
          use: [
            {
              loader: 'file-loader',
              options: {
                name: '[hash].[ext]',
              },
            },
          ],
        },
      ],
    },
    plugins: [
      new HtmlWebpackPlugin({ template: path.join(dir.source, 'index.html'), filename: 'index.html' }),
      new MiniCssExtractPlugin({ filename: '[name].css', chunkFilename: '[id].css' }),
    ],
  };

  if (!is_production) {
    return merge(config, {
      mode: 'development',
      devServer: {
        host: '0.0.0.0',
        port: 3000,
        compress: true,
        hot: true,
        overlay: true,
        stats: 'errors-only',
      },
    });
  }

  return merge(config, {
    mode: 'production',
    devtool: false,
  });
};
