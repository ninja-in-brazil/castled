# Castled

A simple Ruby gem for backing up and restoring files via the `simple-backup` CLI.

## Installation

```bash
gem build castled.gemspec
gem install castled-*.gem
```

Or from the project directory:

```bash
bundle install
bundle exec rake install
```

## Usage

### Initialize

Create a `config.yml` in the current directory:

```bash
simple-backup init
```

Example `config.yml`:

```yaml
backup_name: my_backup
backup_paths:
  - path/to/file_or_folder
destination: path/to/backups
```

### Backup

Copy configured paths to a timestamped folder under `destination`:

```bash
simple-backup backup
```

Backups are stored as `backup_name_YYYYMMDD_HHMMSS` (e.g. `my_backup_20260519_112300`).

### Restore

List available backups and restore one interactively:

```bash
simple-backup restore
```

Restore copies files back to their original locations (overwriting existing files).

Preview a restore without writing files:

```bash
simple-backup restore --dry-run
simple-backup restore 1 --dry-run --diff
```

Dry run reports:
- files that would be copied to new paths
- files that would overwrite existing paths
- optional unified diffs for overwritten text files (`--diff`, requires `--dry-run`)

## Development

```bash
bundle install
bundle exec ruby -Ilib:test test/test_*.rb
```
