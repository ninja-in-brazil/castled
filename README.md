# Castled

Castled is a small Ruby gem for simple file backups and restores from the terminal. It is designed with Omarchy in mind, making it easy to back up and restore system and desktop configuration files using plain text configuration.

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

### Schedule with cron

To run backups automatically, add a cron job that changes into the directory with your `config.yml` and runs the backup command.

Open your crontab:

```bash
crontab -e
```

Example: run a backup every day at 9:00 AM:

```cron
0 9 * * * cd /path/to/backup-config && /usr/bin/env simple-backup backup
```

Use full paths in cron jobs when possible, since cron runs with a smaller environment than your interactive terminal.

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
