cookies = require('js-cookie')
queryString = require('query-string')
delay = (time, func) -> setTimeout(func, time)

DOM =
	name: document.querySelector('#repository_name')
	private: document.querySelector('label[for=github_repository_private_true]')
	url: document.querySelector('#vcs_url')
	form: document.querySelector('#new_repository')

query = queryString.parse(location.search)

spinner = ->
	embed = document.createElement('embed')
	embed.type = 'text/html'
	embed.src = chrome.extension.getURL('spinner.html')
	embed.width = '100%'
	embed.height = '100%'
	embed.style.position = 'fixed'
	embed.style.top = 0
	embed.style.left = 0
	embed.style.opacity = '0.9'
	embed.style.zIndex = f2147483647
	document.body.appendChild(embed)


chrome.storage.sync.get 'options', (results) ->
	options = results.options

	# gist2github button was pressed on gist
	if query.gist2github?
		DOM.url.value = query.url
		DOM.name.value = query.name

		if (options.privacy is 'automatic' and query.private is 'true') or (options.privacy is 'private')
			DOM.private.click()

		if options.autosubmit then DOM.form.submit()






