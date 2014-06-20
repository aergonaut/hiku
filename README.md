## Hiku 

	A little Heroku app (for Coupa) we can all use to list out PRs by target branch. You can type in any branch and it will hit the GitHub API to pull down a list of open PRs targeting the branch you entered.

## Getting Started

#### PostgreSQL
	Installing PostgreSQL Server via homebrew is a viable option. But you can also install PostgreSQL Server with this nifty binary Mac OS X app [Postgres.app](http://postgresapp.com)

#### Installing 'pg gem' if using Postgresql.app
<pre><code>gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.3/bin/pg_config</code></pre>

