<div align="center">

```
  __  __         _ ____            _
 |  \/  |       | |  _ \          | |
 | \  / | ___ __| | |_) | __ _ ___| |__
 | |\/| |/ __/ _` |  _ < / _` / __| '_ \
 | |  | | (_| (_| | |_) | (_| \__ \ | | |
 |_|  |_|\___\__,_|____/ \__,_|___/_| |_|
```

### Premium Laravel Development Ecosystem

[![Version](https://img.shields.io/badge/version-1.2.0-ff69b4?style=for-the-badge&logo=semantic-release&logoColor=white)](https://github.com/sukamcd/mcdbash)
[![Shell](https://img.shields.io/badge/bash-4.0+-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Laravel](https://img.shields.io/badge/Laravel-11.x-FF2D20?style=for-the-badge&logo=laravel&logoColor=white)](https://laravel.com)
[![PHP](https://img.shields.io/badge/PHP-8.1+-777BB4?style=for-the-badge&logo=php&logoColor=white)](https://php.net)
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](LICENSE)

[![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)](https://github.com/sukamcd/mcdbash/graphs/commit-activity)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge)](http://makeapullrequest.com)
[![Platform](https://img.shields.io/badge/platform-linux-lightgrey?style=for-the-badge&logo=linux&logoColor=white)](https://www.linux.org/)

**Toolkit CLI yang powerful dan elegan untuk mempercepat development Laravel dengan antarmuka terminal yang memukau**

[Fitur](#-fitur-unggulan) • [Instalasi](#-instalasi) • [Dokumentasi](#-dokumentasi) • [Kontribusi](#-kontribusi)

</div>

---

## Tentang McdBash

**McdBash** adalah ekosistem CLI premium yang dirancang khusus untuk developer Laravel yang menginginkan produktivitas maksimal dengan pengalaman visual yang luar biasa. Dengan desain interface 256-bit color dan animasi yang halus, McdBash mengubah terminal Anda menjadi workspace yang indah dan efisien.

### Mengapa McdBash?

- **Cepat & Efisien** - Otomasi tugas-tugas repetitif dalam hitungan detik
- **Beautiful UI** - Interface terminal premium dengan palet warna modern
- **All-in-One** - Semua tools yang Anda butuhkan dalam satu CLI
- **Zero Config** - Langsung pakai tanpa konfigurasi rumit
- **Smart Workflow** - Workflow yang terintegrasi untuk development Laravel

---

## Fitur Unggulan

<table>
<tr>
<td width="50%">

### Laravel Installer

Setup project Laravel lengkap dalam satu perintah dengan:

- Database configuration otomatis
- GitHub integration
- Popular packages (Filament, Breeze, Jetstream, dll)
- Interactive wizard yang user-friendly

</td>
<td width="50%">

### Laravel Optimizer

Optimasi performa aplikasi dengan:

- Cache clearing & rebuilding
- Config & route optimization
- View compilation
- Event caching

</td>
</tr>
<tr>
<td width="50%">

### Development Mode

Jalankan development server dengan:

- Artisan Serve + Vite bersamaan
- Auto-restart on crash
- Graceful shutdown (Ctrl+C)
- Real-time status monitoring

</td>
<td width="50%">

### Log Monitor

Monitor aplikasi dengan:

- Real-time log streaming
- Syntax highlighting (ERROR/WARNING/INFO)
- Auto-scroll
- Clean & readable output

</td>
</tr>
<tr>
<td width="50%">

### Environment Switcher

Kelola environment dengan mudah:

- Switch Local ↔ Production
- Auto cache clearing
- Debug mode toggle
- Safe & reversible

</td>
<td width="50%">

### Premium Design

Pengalaman visual terbaik:

- 256-bit color palette
- Smooth loading animations
- Consistent branding
- ASCII art headers

</td>
</tr>
</table>

---

## Dokumentasi

### Command Reference

| Command        | Alias       | Description                                 |
| -------------- | ----------- | ------------------------------------------- |
| `mcd -laravel` | -           | Create new Laravel project with wizard      |
| `mcd -dev`     | -           | Start Artisan Serve + Vite dev server       |
| `mcd -optim`   | -           | Optimize Laravel application cache          |
| `mcd -env`     | -           | Switch between Local/Production environment |
| `mcd -log`     | -           | Monitor Laravel logs in real-time           |
| `mcd -v`       | `--version` | Show McdBash version                        |
| `mcd -h`       | `--help`    | Show help menu                              |

### Laravel Project Setup

```bash
mcd -laravel
```

**Interactive wizard akan memandu Anda melalui:**

1. **Project Configuration**
   - Nama project (required)
   - GitHub repository URL (optional)

2. **Database Setup**
   - Connection type (mysql/pgsql/sqlite)
   - Host, port, database name
   - Username & password (secure input)

3. **Package Selection**
   - Filament Admin Panel
   - Laravel Breeze (Authentication)
   - Laravel Jetstream (Teams & API)
   - Laravel Telescope (Debugging)
   - Laravel Debugbar (Development)
   - Spatie Permission (Roles & Permissions)
   - Laravel Sanctum (API Authentication)
   - Livewire (Full-stack framework)
   - Inertia.js (Modern monolith)

4. **Installation Summary**
   - Review konfigurasi sebelum eksekusi
   - Konfirmasi untuk melanjutkan

**Output:**

- Project Laravel siap pakai
- Database terkonfigurasi
- Packages terinstall
- Git initialized (jika dipilih)

### Development Workflow

```bash
# Masuk ke project Laravel
cd my-laravel-project

# Start development servers
mcd -dev
```

**Fitur Development Mode:**

- PHP Artisan Serve berjalan di `http://127.0.0.1:8000`
- Vite dev server untuk hot module replacement
- Auto-restart jika crash
- Tekan `Ctrl+C` untuk stop semua server

### Performance Optimization

```bash
# Di root project Laravel
mcd -optim
```

**Proses optimasi:**

1. Clear semua cache (config, route, view, cache)
2. Rebuild optimization cache
3. Cache compiled views
4. Cache event listeners

**Kapan harus run optimizer:**

- Setelah update `.env`
- Setelah modifikasi routes
- Setelah deploy ke production
- Ketika aplikasi terasa lambat

### Environment Management

```bash
mcd -env
```

**Options:**

1. **Local Mode**
   - `APP_ENV=local`
   - `APP_DEBUG=true`
   - Error reporting enabled

2. **Production Mode**
   - `APP_ENV=production`
   - `APP_DEBUG=false`
   - Error reporting disabled

**Auto cache clearing** setelah switch environment.

### Log Monitoring

```bash
mcd -log
```

**Features:**

- Real-time tail `storage/logs/laravel.log`
- Color-coded log levels:
  - **ERROR/CRITICAL** - Red
  - **WARNING** - Yellow
  - **INFO** - Cyan
- Auto-scroll untuk log terbaru
- Tekan `Ctrl+C` untuk keluar

---

## Design System

McdBash menggunakan **256-bit ANSI color palette** untuk pengalaman visual yang premium:

```bash
# Color Palette
PINK    = \033[38;5;198m  # Branding, headers, highlights
CYAN    = \033[38;5;51m   # Links, active states
ORANGE  = \033[38;5;208m  # Warnings, packages
YELLOW  = \033[38;5;226m  # Alerts, important info
RED     = \033[38;5;196m  # Errors, critical states
GREEN   = \033[38;5;46m   # Success, completed tasks
GRAY    = \033[38;5;244m  # Secondary text, borders
```

**Typography:**

- `BOLD` - Headers, labels, emphasis
- `ITALIC` - Subtitles, metadata

**Components:**

- ASCII art headers untuk branding
- Box layouts untuk summaries
- Spinner animations untuk loading states
- Status indicators (● ○) untuk states

---

## Struktur Project

```
/opt/mcd/
├── mcd.sh                 # Main CLI entry point & router
├── local.sh               # Local env config snippet
├── production.sh          # Production env config snippet
├── README.md              # Documentation
├── scripts/
│   ├── mcdlaravel.sh     # Laravel project installer
│   ├── mcddev.sh         # Development mode runner
│   ├── mcdoptim.sh        # Laravel optimizer
│   ├── mcdenv.sh          # Environment switcher
│   └── mcdlog.sh          # Log monitor
└── .git/                  # Git repository
```

---

## Kontribusi

Kami sangat menghargai kontribusi dari komunitas! Berikut cara berkontribusi:

### Development Setup

```bash
# Fork & clone repository
git clone https://github.com/YOUR_USERNAME/mcdbash.git
cd mcdbash

# Buat branch untuk fitur baru
git checkout -b feature/amazing-feature

# Lakukan perubahan dan test
./mcd.sh -h

# Commit dengan conventional commits
git commit -m "feat: add amazing feature"

# Push ke fork Anda
git push origin feature/amazing-feature

# Buat Pull Request
```

### Contribution Guidelines

- Follow existing code style
- Test semua perubahan
- Update documentation jika perlu
- Gunakan conventional commits
- Satu PR untuk satu fitur/fix

### Reporting Issues

Temukan bug atau punya ide fitur? [Buat issue](https://github.com/sukamcd/mcdbash/issues/new) dengan:

- Deskripsi jelas
- Steps to reproduce (untuk bugs)
- Expected vs actual behavior
- Environment info (OS, Bash version, dll)

---

## Changelog

### [1.2.0] - 2026-02-08

#### Added

- Premium UI redesign dengan 256-bit color palette
- ASCII art headers untuk semua modul
- Improved spinner animations
- Box layouts untuk summaries

#### Changed

- Konsistensi visual di semua scripts
- Better error messages
- Improved package selection interface

#### Fixed

- Minor bug fixes
- Performance improvements
- Better error handling

<details>
<summary>Previous Versions</summary>

### [1.1.0] - 2026-01-15

- Added environment switcher
- Improved log monitoring
- Bug fixes

### [1.0.0] - 2025-12-01

- Initial release
- Laravel installer
- Development mode
- Basic optimizer

</details>

---

## License

Distributed under the **MIT License**. See [LICENSE](LICENSE) for more information.

```
MIT License

Copyright (c) 2026 SukaMCD

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## 👥 Team

<table>
<tr>
<td align="center">
<a href="https://github.com/sukamcd">
<img src="https://github.com/sukamcd.png" width="100px;" alt="SukaMCD"/><br />
<sub><b>SukaMCD</b></sub>
</a><br />
<sub>Creator & Maintainer</sub>
</td>
</tr>
</table>

---

## Links

- [GitHub Repository](https://github.com/sukamcd/mcdbash)
- [Documentation](https://github.com/sukamcd/mcdbash/wiki)
- [Issue Tracker](https://github.com/sukamcd/mcdbash/issues)
- [Discussions](https://github.com/sukamcd/mcdbash/discussions)

---

<div align="center">

**[⬆ Back to Top](#)**

by [SukaMCD](https://github.com/sukamcd)

⭐ **Star this repo if you find it useful!** ⭐

</div>
