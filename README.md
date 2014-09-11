Vagrant / Puppet and LAMP
==============================================================================
As it says on the tin: a basic setup for a LAMP stack.

Installation
------------------------------------------------------------------------------
```bash
$ # Suggest you include it as a submodule, but you could just download the repo
$ # into the same location.
$ git submodule add https://github.com/linssen/vagrant-puppet-lamp.git puppet
$ git submodule init && git submodule update
$ # Copy the sample vagrant file and edit the settings to your own requirements.
$ cp puppet/Vagrantfile.sample Vagrantfile
```

Edit the  Then bring the box up with. You must have a directory called `www` where your app lives, because it's a shared folder requirement for Vagrant. Change that in the Vagrantfile if you so wish.

```bash
$ vagrant up
$ vagrant provision
```

Usage
------------------------------------------------------------------------------

The site is served from `/var/www/example.co.uk/public_html` so you're free to add script above. Vagrant will share the folder `www` at root level to `/var/www/example.co.uk`.

So your app lives in a folder called `www` next to the `Vagrantfile` and your public html lives in `www/public_html`.

The site is then available at `http://example.co.uk:8080`.

You can connect to the guest MySQL DB from the host using Sequel Pro (other DB admin GUIs are available) over SSH. The details are

Setting | Value
------- | -------
Name | `Vagrant`
MySQL Host | `127.0.0.1`
Username | `root`
Password | `root`
Port | `3306`
SSH Host | `192.168.33.10`
SSH User | `vagrant`
SSH Password | `~/.vagrant.d/insecure_private_key`
SSH Port | `22`

Versions
------------------------------------------------------------------------------
- Ubuntu: 12.10
- PHP: 5.4.32 (via [ppa:ondrej/php5-oldstable](https://launchpad.net/~ondrej/+archive/ubuntu/php5-oldstable))
- MySQL: latest from apt
- Apache2: latest from apt

Puppet Modules
------------------------------------------------------------------------------
- [Apache](https://forge.puppetlabs.com/puppetlabs/apache)
- [MySQL](https://forge.puppetlabs.com/puppetlabs/mysql)
- [example42/php](https://forge.puppetlabs.com/example42/php)
- [apt](https://forge.puppetlabs.com/puppetlabs/apt)
