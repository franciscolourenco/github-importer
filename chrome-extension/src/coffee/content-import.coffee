cookies = require('js-cookie')
queryString = require('query-string')
delay = (time, func) -> setTimeout(func, time)

DOM = {}
DOM.name = document.querySelector('input[name="github_repository[name]"]')
DOM.private = document.querySelector('label[for=github_repository_private_true]')
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
	embed.style.zIndex = 2147483647
	document.body.appendChild(embed)


chrome.storage.sync.get 'options', (results) ->
	options = results.options

	# gist2github button was pressed on gist
	if query.gist2github?
		spinner()
		cookies.set('gist2github', true)
		cookies.set('name', query.name)
		cookies.set('private', query.private)
		document.querySelector('#importer_url').value = query.gist
		document.querySelector('form[action="/new/source"]').submit()

	# second phase after url verification
	else if cookies.get('gist2github')
		return spinner() if not DOM.name?

		DOM.name.value = cookies.get('name')
		gistPrivacy = cookies.get('private')
		cookies.remove('gist2github')
		cookies.remove('private')
		cookies.remove('name')

		if (options.privacy is 'automatic' and gistPrivacy is 'true') or (options.privacy is 'private')
			DOM.private.click()

		if options.autosubmit  # delay cause page not ready yet
			delay 500, -> document.querySelector('.button.primary').click()





