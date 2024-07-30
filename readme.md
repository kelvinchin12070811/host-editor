# Hosts Editor

**Hosts Editor** is a command-line utility designed to simplify the management of your system's hosts file. It allows
you to easily add, edit, delete, and toggle entries in the hosts file without manually editing the file.

## Features

- **List** all entries in the hosts file.
- **Create** new entries.
- **Toggle** the state of existing entries (enable or disable).
- **Edit** specific entries.
- **Delete** entries.
- Open the hosts file in **vim** for manual editing.

## Usage

The general syntax for using Hosts Editor is:

```bash
hosts <command> <args>
```

### Commands

- `--help`, `-h`
  Displays the help message.

- `list`
  Lists all entries in the hosts file.

- `create`
  Creates a new entry in the hosts file.

- `toggle <line_number>`
  Toggles the state of the entry at the specified line number, enabling or disabling it.

- `edit <line_number>`
  Modifies the entry at the specified line number.

- `delete <line_number>`
  Deletes the entry at the specified line number.

- `vim`
  Opens the hosts file in vim for manual editing.

## Examples

### List all entries

```bash
hosts list
```

### Create a new entry

```bash
hosts create
# Follow the prompts to add a new entry
```

### Toggle the state of an entry

```bash
hosts toggle 3
# This will enable or disable the entry at line 3
```

### Edit an entry

```bash
hosts edit 2
# This will modify the entry at line 2
```

### Delete an entry

```bash
hosts delete 4
# This will remove the entry at line 4
```

### Open hosts file in vim

```bash
hosts vim
```

## License

This project is licensed under the MIT License. See the [LICENSE](license) file for more details.
