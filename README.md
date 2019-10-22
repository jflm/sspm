# Stupidly Simple Password Manager (SSPM)

A ludicrously simplistic password manager for MacOS

**Use it, should you wish to do so, at your own risk. There are _many_ better alternatives for password management than this; this is simply
a handy utility that works for what I need it to do.**

## Background

This tool is intended to be a _mildly_ better option to storing your password in a file.
It uses MacOS Keychain to store your password and then retrieve it and copy it to the clipboard for use where needed.

## How it works

This tool uses bash scripts in conjunction with the menu bar 'Script menu' to provide an easy interface for saving and retrieving passwords.
Once installed, two scripts will be made available in the menu - one which prompts for the password and then stores it in the Keychain, and
one that will then retrieve the password and copy it to the clipboard.

## How to install

* Clone repo
* Run `./install.sh <my-funky-password-name>` where `<my-funky-password-name>` is a memorable name for the password for which you want to generate the scripts
* The installer will generate the scripts and install them into `~/Library/Scripts`, which is the default directory for user-defined scripts.
* Two scripts are installed - one named `my-funky-password-name` and one named `my-funky-password-name-set`, where the former is for copying the password to your
clipboard and the latter is for setting it and storing in Keychain
* You can run the `install.sh` script multiple times to set up different managed passwords. Two scripts will be generated for each one
* You can also manually inspect and change the password via the 'Keychain access' app

### To activate the menu bar 'Script menu'

1. Open Script Editor (cmd+space and type 'script editor')
2. Select Script Editor (top left) > Preferences
3. Check the 'Show Script menu in menu bar' checkbox

Happy days.

## Running tests

There is (now) a very rudimentary test runner to help avoid regressions for issues that have been fixed. To run all the tests, just run `./test.sh`.

You can also run an individual test file with `tests/<test_name>.sh`.

For simplicity's sake, because we are using Bash for everything and it's mental, tests should all be run when your cwd is the top level 'sspm' directory.

## Limitations

The key limitation with this tool is in the 'set password' functionality. The tool makes use of the MacOS `security` utility, which takes the
password as an argument on the command line to its `add-generic-password` subcommand. The only way to facilitate this is by passing the value
as a bash variable, which will result in the shell expanding the value and storing it in the process table. See https://www.netmeister.org/blog/passing-passwords.html
for more information.

But it's still probably better than storing it in plain text in a file...

