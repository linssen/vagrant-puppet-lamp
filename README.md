Vagrant / Puppet and LAMP
==============================================================================
As it says on the tin: a basic setup for a LAMP stack.

Installation
------------------------------------------------------------------------------
```bash
$ cp Vagrantfile.sample Vagrantfile
```

Change `example.co.uk` to the sitename you're working from. It's important to forward that sitename in your hosts (on OS X at `/etc/hosts`) to localhost.

Then bring the box up with.

```bash
$ vagrant up
$ vagrant provision
```

The site is served from `/var/www/example.co.uk/public_html` so you're free to add script above. Vagrant will share the folder `www` at root level to `/var/www/example.co.uk`.

So your app lives in a folder called `www` next to the `Vagrantfile` and your public html lives in `www/public_html`.

The site is then available at `http://example.co.uk:8080`.

Puppet Modules
------------------------------------------------------------------------------
- [Apache](https://forge.puppetlabs.com/puppetlabs/apache)
- [MySQL](https://forge.puppetlabs.com/puppetlabs/mysql)
- [example42/php](https://forge.puppetlabs.com/example42/php)
- [apt](https://forge.puppetlabs.com/puppetlabs/apt)
