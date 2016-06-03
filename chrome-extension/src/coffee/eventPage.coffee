assign = require('lodash/assign')

chrome.runtime.onInstalled.addListener (details) ->
	# set defaults but don't override existing options
	chrome.storage.sync.get 'options', (results) ->
		defaults =
			privacy: 'automatic'
			name: 'automatic'
			autosubmit: true

		assign(defaults, results.options)
		console.log defaults
		chrome.storage.sync.set(options: defaults)

