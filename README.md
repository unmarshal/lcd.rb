# LCD: Directory aliasing tool

Sets aliases for directory paths, making it easier to navigate to your project directories.

## Purpose

I built this simple script to allow me to efficiently navigate my project directories from anywhere on my filesystem. Instead of having to remember the location of each project, I set aliases on my project directories and use the `lcd` command to change into that directory.

## Tutorial

To list all aliases run `pcd`.
#### Example
	$ pcd
	o => /Users/marshall/open_source
	g => /Users/marshall/git
	ad  => /Users/marshall/git/ad-server

To change directories, run `lcd <alias>`

#### Example

	$ lcd o
	$ pwd
	/Users/marshall/open_source

To add an alias, `acd <alias>`. This will create an alias to the current working directory.

#### Example

	$ cd /tmp
	$ pwd
	/tmp
	$ acd t
	$ cd ~
	$ pwd
	/Users/marshall
	$ lcd t
	$ pwd
	/tmp

## Installation

  1. Run `install.sh`
  2. Reload your .bashrc `. ~/.bashrc`
  3. Smile, knowing that you are saving mental energy and accumulated time having to remember and type out long directory paths.
  
---
##### Questions or Suggestions send to Marshall Beddoe <unmarshal@gmail.com>
