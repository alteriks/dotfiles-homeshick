# activeCollab integration for todo.txt

This is a simple plugin that provides [todo.txt](https://github.com/ginatrapani/todo.txt-cli) integration with the [activeCollab](http://activecollab.com) project/ticket structure.

## Setup

- Copy `ac` into your scripts directory
- Edit `tasks.cfg` and add:
	- `export AC_URL="https://your_active_collab_url"`
	- Make sure there is no trailing slash for your URL

## Usage

- `task add DESCRIPTION ac:{project_number}/{ticket_number}
	- Ticket number is optional.
	- For example: `task add Finish activeCollab integration with todo.txt +misc ac:15/23` where `15` is my miscellaneous project in AC and `23` is the ticket I've created to track the work.

- `task ac {task_number`
	- If {task_number} has an AC URL referenced, it will open in your web browser.

## Credit

This script is based largely on [`nav`](https://github.com/ginatrapani/todo.txt-cli/wiki/Todo.sh-Add-on-Directory#wiki-nav)