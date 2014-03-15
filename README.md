# APT::Periodic Cookbook

Chef cookbook for configuring **APT::Periodic** variables for daily cron job `/etc/cron.daily/apt` and `unattended-upgrades` package on Ubuntu.

- `/etc/apt/apt.conf.d/10periodic`
- `/etc/apt/apt.conf.d/50unattended-upgrades`

## Requirements

#### supports

- `ubuntu >= 12.04`

#### depends

- `apt`

## Installation

    cookbook 'apt'
    cookbook 'apt-periodic'

## Attributes

#### apt-periodic::default

See `attributes/default.rb`

<table>
  <tr>
    <th>Description</th>
    <th>Type</th>
    <th>Default</th>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['auto_apt_enable']</tt></td>
  </tr>
  <tr>
    <td>Enable the update/upgrade script (0=disable)</td>
    <td>String</td>
    <td><tt>"1"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['update_interval']</tt></td>
  </tr>
  <tr>
    <td>Do "apt-get update" automatically every n-days (0=disable)</td>
    <td>String</td>
    <td><tt>"1"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['download_upgradeable_interval']</tt></td>
  </tr>
  <tr>
    <td>Do "apt-get upgrade --download-only" every n-days (0=disable)</td>
    <td>String</td>
    <td><tt>"0"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['debdelta']</tt></td>
  </tr>
  <tr>
    <td>Use debdelta-upgrade to download updates if available (0=disable)</td>
    <td>String</td>
    <td><tt>"1"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['autoclean_interval']</tt></td>
  </tr>
  <tr>
    <td>Do "apt-get autoclean" every n-days (0=disable)</td>
    <td>String</td>
    <td><tt>"0"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['backup_level']</tt></td>
  </tr>
  <tr>
    <td>Backup level (0=disable), 1 is invalid.</td>
    <td>String</td>
    <td><tt>"3"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['backup_archive_interval']</tt></td>
  </tr>
  <tr>
    <td>Backup after n-days if archive contents changed (0=disable)</td>
    <td>String</td>
    <td><tt>"0"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['random_sleep']</tt></td>
  </tr>
  <tr>
    <td>Sleep for a random interval of time</td>
    <td>String</td>
    <td><tt>"1800"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['verbose']</tt></td>
  </tr>
  <tr>
    <td>Set VERBOSE mode from apt-config</td>
    <td>String</td>
    <td><tt>"0"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['min_age']</tt></td>
  </tr>
  <tr>
    <td>Set minimum age of a package file. If a file is younger it will not be deleted (0=disable). Usefull to prevent races and to keep backups of the packages for emergency.</td>
    <td>String</td>
    <td><tt>"0"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['max_age']</tt></td>
  </tr>
  <tr>
    <td>Set maximum allowed age of a cache package file. If a cache package file is older it is deleted (0=disable)</td>
    <td>String</td>
    <td><tt>"2"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['max_size']</tt></td>
  </tr>
  <tr>
    <td>Set maximum size of the cache in MB (0=disable). If the cache is bigger, cached package files are deleted until the size requirement is met (the biggest packages will be deleted first).</td>
    <td>String</td>
    <td><tt>"0"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['unattended_upgrade_interval']</tt></td>
  </tr>
  <tr>
    <td>Run the "unattended-upgrade" security upgrade script every n-days (0=disabled)</td>
    <td>String</td>
    <td><tt>"0"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['unattended_upgrades']['allowed_origins']</tt></td>
  </tr>
  <tr>
    <td>Automatically upgrade packages from these (origin:archive) pairs</td>
    <td>Array</td>
    <td></td>
  </tr>
   <tr>
    <td colspan="3"><tt>['apt_periodic']['unattended_upgrades']['package_blacklist']</tt></td>
  </tr>
  <tr>
    <td>List of packages to not update</td>
    <td>Array</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['unattended_upgrades']['auto_fix_interrupted_dpkg']</tt></td>
  </tr>
  <tr>
    <td>This option allows you to control if on a unclean dpkg exit unattended-upgrades will automatically run dpkg --force-confold --configure -a</td>
    <td>String</td>
    <td><tt>"true"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['unattended_upgrades']['minimal_steps']</tt></td>
  </tr>
  <tr>
    <td>Split the upgrade into the smallest possible chunks so that they can be interrupted with SIGUSR1. This makes the upgrade a bit slower but it has the benefit that shutdown while a upgrade is running is possible (with a small delay)</td>
    <td>String</td>
    <td><tt>"false"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['unattended_upgrades']['install_on_shutdown']</tt></td>
  </tr>
  <tr>
    <td>Install all unattended-upgrades when the machine is shuting down instead of doing it in the background while the machine is running. This will (obviously) make shutdown slower</td>
    <td>String</td>
    <td><tt>"false"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['unattended_upgrades']['mail']</tt></td>
  </tr>
  <tr>
    <td>Send email to this address for problems or packages upgrades. If empty or unset then no email is sent, make sure that you have a working mail setup on your system.</td>
    <td>String</td>
    <td><tt>""</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['unattended_upgrades']['mail_only_on_error']</tt></td>
  </tr>
  <tr>
    <td>Set this value to "true" to get emails only on errors.</td>
    <td>String</td>
    <td><tt>"false"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['unattended_upgrades']['remove_unused_dependencies']</tt></td>
  </tr>
  <tr>
    <td>Do automatic removal of new unused dependencies after the upgrade (equivalent to apt-get autoremove)</td>
    <td>String</td>
    <td><tt>"true"</tt></td>
  </tr>
  <tr>
    <td colspan="3"><tt>['apt_periodic']['unattended_upgrades']['automatic_reboot']</tt></td>
  </tr>
  <tr>
    <td>Automatically reboot *WITHOUT CONFIRMATION* if a the file /var/run/reboot-required is found after the upgrade</td>
    <td>String</td>
    <td><tt>"false"</tt></td>
  </tr>
</table>

## Usage

#### apt-periodic::default

Just include `apt-periodic` in your node's `run_list`:

```json
{
  "name": "app.crazy-automation.io",
  "apt_periodic": {
    "unattended_upgrade_interval": "1",
    "unattended_upgrades": {
      "mail": "admin@crazy-automation.io"
    }
  }
  "run_list": [
    "recipe[apt-periodic]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github
