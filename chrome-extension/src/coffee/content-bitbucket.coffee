queryString = require('query-string')

chrome.storage.sync.get 'options', (results) ->
	url = document.querySelectorAll('.clone-url-input')[1]?.value
	return false if not url

	options = results.options
	query = queryString.stringify(
		name: document.querySelector('.entity-name')?.innerText
		url: url
		# private: document.querySelector('.gist-secret-label')?
		gist2github: 'true'
	)

	li = document.createElement('li')
	li.innerHTML = """
		<a id="repo-fork-link" class="aui-nav-item " href="https://github.com/new/import/?#{query}" data-ct="sidebar.actions.repository.fork" data-ct-data="" target="_self" title="( type x then f )">
		  <span class="aui-icon aui-icon-large icon-fork"></span>
		  <span class="aui-nav-item-label">Github It</span>
		</a>
	"""


	repoActions = document.querySelector('#repo-actions')
	repoActions.appendChild(li)
