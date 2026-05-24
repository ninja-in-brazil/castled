# Castled

**Simple backups for Omarchy. Opinionated defaults, zero ceremony.**

Omarchy gives you a beautiful, modern, fully configured Linux system in one shot — the omakase menu, chef's choice. Castled applies the same spirit to backups: a tiny, plain-text tool that saves the dotfiles you care about without turning disaster recovery into another configuration hobby.

No bespoke backup framework. No paradox of choice. Just `init`, `backup`, and `restore`.

## Why Castled?

- **Curated from the start** — `simple-backup init` writes a sensible Omarchy-oriented `config.yml` you can edit in seconds.
- **Plain text, terminal-first** — one YAML file lists what to save and where; everything else stays out of your way.
- **Restore when it matters** — list backups, pick one, preview with `--dry-run`, diff with `--diff`.
- **Substitutions welcome** — change paths, add folders, point `destination` at your USB drive. The defaults are a starting point, not a contract.

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

## Quick start

### Initialize

Create a `config.yml` in the current directory:

```bash
simple-backup init
```

Example `config.yml` (also what `init` generates):

```yaml
backup_name: omarchy
backup_paths:
  - ~/.bash_logout
  - ~/.bash_profile
  - ~/.bashrc
  - ~/.gemrc
  - ~/.XCompose
destination: /run/media/leonid/250GB/backups
```

Adjust `backup_paths` and `destination` to match your machine. Plug in an external drive, point `destination` at its mount path, and you're done.

### Backup

Copy configured paths to a timestamped folder under `destination`:

```bash
simple-backup backup
```

Backups are stored as `backup_name_YYYYMMDD_HHMMSS` (e.g. `omarchy_20260519_112300`).

### Schedule with cron

Run backups automatically from the directory that holds your `config.yml`:

```bash
crontab -e
```

Example — backup every day at 9:00 AM:

```cron
0 9 * * * cd /path/to/backup-config && /usr/bin/env simple-backup backup
```

Use full paths in cron jobs when possible; cron runs with a smaller environment than your interactive shell.

### Restore

List available backups and restore one interactively:

```bash
simple-backup restore
```

Restore copies files back to their original locations (overwriting existing files).

Preview without writing:

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
