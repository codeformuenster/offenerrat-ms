---
status: work-in-progress
uri: http://offenerrat-ms.herokuapp.com/
forum: http://forum.codeformuenster.org/t/offener-rat-munster/27
code-climate: [![Code Climate](https://codeclimate.com/github/codeformuenster/offenerrat-ms.png)](https://codeclimate.com/github/codeformuenster/offenerrat-ms)
---

# Offener Rat Münster

Der Offene Rat Münster soll das politische Geschehen in Münster transparenter machen und mehr Bürgern die Möglichkeit geben sich umfassend zu informieren. 

![screen shot 2015-03-06](https://cloud.githubusercontent.com/assets/225698/6537523/d1789ff0-c457-11e4-8cb4-b6484ce19def.png)

## Setup with Docker

Install Docker and Fig.

Build the app:

    sudo fig build

(DON'T) Setup the database:

    sudo RAILS_ENV=development fig up -d db
    sudo RAILS_ENV=development fig run --rm app rake db:setup

Better, import real data:

(Put _latest.dump_ in the "db" subdirectory.)

    sudo RAILS_ENV=development fig run db bash -c 'pg_restore -h $DB_PORT_5432_TCP_ADDR -d $DB_ENV_POSTGRESQL_DB -U $DB_ENV_POSTGRESQL_USER  /mnt/latest.dump'

Run the app:

    sudo RAILS_ENV=development fig up --no-recreate app

The app should now be available at [http://localhost:3333](http://localhost:3333).

## Contributing
[![Stories in Ready](https://badge.waffle.io/codeformuenster/offenerrat-ms.png?label=ready&title=Ready)](https://waffle.io/codeformuenster/offenerrat-ms)

Issues are managed in [Github Issues](https://github.com/codeformuenster/offenerrat-ms/issues?state=open). You can also view them on a [Kanban board](https://waffle.io/codeformuenster/offenerrat-ms).

Either fork and pull-request or ask @kirel or @milafrerichs for access and work on feature branches.

Feature branches should be names `Issue#-descriptive-name` - see https://github.com/codeformuenster/codeformuenster.github.io/branches for examples.

# Supporting
[![Bountysource](https://www.bountysource.com/badge/tracker?tracker_id=1614726)](https://www.bountysource.com/trackers/1614726-offenerrat-ms?utm_source=1614726&utm_medium=shield&utm_campaign=TRACKER_BADGE)

You can support the project by posting a bounty for a feature/issue.

# Deploying

Just send a PR and we will deploy when it is merged

--
