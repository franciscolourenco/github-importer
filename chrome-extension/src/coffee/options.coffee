Vue = require('vue')

new Vue
	el: 'body'
	data:
		options: {}
	methods:
		save: (options) -> chrome.storage.sync.set({options})
		load: -> chrome.storage.sync.get {@options}, (results) => @options = results.options
	created: -> @load()
	watch:
		'options':
			handler: (options) -> @save(options)
			deep: true
