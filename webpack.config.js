const path = require('path');

module.exports = {
	module: {
		rules: [
			{
				test: /\.imba$/,
				loader: 'imba/loader'
			}
		]
	},
	devServer: {
		contentBase: path.resolve(__dirname, 'public'),
		watchContentBase: true,
		historyApiFallback: {index: '/index.html'}
	},
	resolve: {
		extensions: [".imba", ".js", ".json", ".css"]
	},
	entry: "./src/App.imba",
	output: { path: __dirname + '/dist', filename: "client.js" }
}