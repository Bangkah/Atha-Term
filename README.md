# 🖥️ AthaTerm - Konfigurasi WezTerm Custom

> Terminal emulator modern dengan tema dark dan aksen hijau neon yang elegan

![Version](https://img.shields.io/badge/version-1.0.0-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![Platform](https://img.shields.io/badge/platform-Linux-orange)

---

## 📖 Apa itu AthaTerm?

**AthaTerm** adalah **konfigurasi custom** untuk [WezTerm](https://wezfurlong.org/wezterm/) - sebuah terminal emulator modern yang ditulis dalam Rust. AthaTerm memberikan pengalaman terminal yang lebih baik dengan:

- ✨ **Tampilan Modern**: Tema dark dengan aksen hijau neon yang eye-catching
- ⚡ **Performance Tinggi**: Memanfaatkan GPU acceleration untuk rendering yang smooth
- 🎯 **Produktivitas**: Keybindings yang intuitif untuk manajemen tab dan split screen
- 💻 **Coding-Friendly**: Font Fira Code dengan ligatures untuk pengalaman coding yang lebih baik
- 🔧 **Fully Customizable**: Semua aspek bisa dikustomisasi sesuai kebutuhan

**CATATAN PENTING**: Ini adalah **file konfigurasi**, bukan aplikasi standalone. Anda tetap perlu menginstall WezTerm terlebih dahulu.

---

## 🎯 Kegunaan & Fitur

### Apa yang Bisa Dilakukan dengan AthaTerm?

1. **Menjalankan Command Linux**: Seperti terminal biasa (bash, ls, cd, vim, dll)
2. **Split Screen**: Bagi terminal menjadi beberapa pane untuk multitasking
3. **Multiple Tabs**: Buka banyak terminal session dalam satu window
4. **Coding Environment**: Cocok untuk development dengan font dan warna yang optimal
5. **Remote Server**: SSH ke server dengan tampilan yang nyaman
6. **Customization**: Ubah warna, font, keybindings sesuai selera

### Fitur Utama

| Fitur | Deskripsi |
|-------|-----------|
| 🎨 **Tema Neon Green** | Background hitam dengan teks hijau neon yang iconic |
| 🔤 **Fira Code Font** | Font monospace dengan ligatures untuk coding |
| ⌨️ **Custom Keybindings** | Shortcut intuitif untuk tab & pane management |
| 📱 **Split Screen** | Horizontal & vertical split dengan mudah |
| 🚀 **GPU Accelerated** | Rendering cepat menggunakan OpenGL |
| 🔍 **Search Function** | Cari text dalam terminal history |
| 📋 **Smart Copy/Paste** | Clipboard integration yang smooth |
| 🎬 **Smooth Animation** | Transisi yang halus dan modern |

---

## 🚀 Instalasi Lengkap (Step-by-Step)

### Prasyarat
- Linux distribution (Ubuntu, Fedora, Arch, dll)
- Internet connection untuk download dependencies

### Step 1: Install WezTerm

Pilih sesuai distro Linux Anda:

#### Ubuntu/Debian/Linux Mint
```bash
# Tambahkan repository WezTerm
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg

echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

# Update dan install
sudo apt update
sudo apt install wezterm -y
```

#### Fedora/RHEL/CentOS
```bash
sudo dnf copr enable wezterm/wezterm-nightly -y
sudo dnf install wezterm -y
```

#### Arch Linux/Manjaro
```bash
sudo pacman -S wezterm
```

#### openSUSE
```bash
sudo zypper install wezterm
```

#### Download Manual (Semua Distro)
```bash
# Download latest release
wget https://github.com/wez/wezterm/releases/download/20230712-072601-f4abf8fd/wezterm-20230712-072601-f4abf8fd.Ubuntu22.04.deb

# Install (Ubuntu/Debian)
sudo dpkg -i wezterm-*.deb
sudo apt-get install -f -y
```

**Verifikasi instalasi:**
```bash
wezterm --version
```

### Step 2: Install Font Fira Code

#### Ubuntu/Debian/Linux Mint
```bash
sudo apt install fonts-firacode -y
```

#### Fedora/RHEL
```bash
sudo dnf install fira-code-fonts -y
```

#### Arch Linux
```bash
sudo pacman -S ttf-fira-code
```

#### Manual Install (Semua Distro)
```bash
# Download font dari GitHub
cd /tmp
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip

# Extract ke fonts directory
unzip Fira_Code_v6.2.zip -d ~/.local/share/fonts/FiraCode

# Refresh font cache
fc-cache -fv

# Verifikasi
fc-list | grep "Fira Code"
```

### Step 3: Clone Repository AthaTerm

```bash
# Clone repository ini
git clone https://github.com/yourusername/athaterm.git
cd athaterm

# Atau jika download sebagai ZIP
unzip athaterm.zip
cd athaterm
```

### Step 4: Install Konfigurasi AthaTerm

```bash
# Backup konfigurasi lama jika ada
[ -f ~/.wezterm.lua ] && mv ~/.wezterm.lua ~/.wezterm.lua.backup

# Copy konfigurasi AthaTerm
cp athaterm.lua ~/.wezterm.lua

# ATAU buat symbolic link (recommended - mudah update)
ln -sf $(pwd)/athaterm.lua ~/.wezterm.lua
```

**Verifikasi file tercopy:**
```bash
ls -lah ~/.wezterm.lua
```

### Step 5: Jalankan AthaTerm

```bash
# Jalankan WezTerm
wezterm

# Atau dari application menu
# Cari "WezTerm" di app launcher Anda
```

### Step 6: Test Fitur

Setelah WezTerm terbuka, test keybindings:

```bash
# Test split horizontal: Ctrl+Shift+H
# Test split vertical: Ctrl+Shift+V
# Test tab baru: Ctrl+Shift+T
# Test reload config: Ctrl+Shift+R
```

---

## 💻 Cara Penggunaan

### Basic Usage (Seperti Terminal Biasa)

AthaTerm berfungsi **persis seperti terminal Linux normal**:

```bash
# Navigation
cd /home/user/projects
ls -la
pwd

# File operations
mkdir new_folder
touch file.txt
nano file.txt
rm file.txt

# Package management
sudo apt update
sudo apt install package-name

# Development
git clone https://github.com/user/repo.git
npm install
python script.py

# System monitoring
htop
df -h
free -m

# Remote server
ssh user@server.com
```

### Advanced Usage - Split Screen

**Scenario 1: Monitoring + Development**
```bash
# 1. Buka WezTerm
# 2. Split horizontal (Ctrl+Shift+H)
# 3. Pane kiri: jalankan htop untuk monitoring
htop

# 4. Pindah ke pane kanan (Ctrl+Shift+→)
# 5. Jalankan development server
npm run dev
```

**Scenario 2: Multiple SSH Sessions**
```bash
# 1. Split vertical (Ctrl+Shift+V)
# 2. Pane atas: SSH ke server 1
ssh user@server1.com

# 3. Pindah ke pane bawah (Ctrl+Shift+↓)
# 4. SSH ke server 2
ssh user@server2.com
```

**Scenario 3: Code + Test + Logs**
```bash
# 1. Split horizontal (Ctrl+Shift+H)
# 2. Split pane kanan vertical (Ctrl+Shift+V)
#
# Layout:
# +-----------+-----------+
# |           |   Test    |
# |   Code    +-----------+
# |           |   Logs    |
# +-----------+-----------+

# Pane 1 (kiri): Edit code
nvim src/main.js

# Pane 2 (kanan atas): Run tests
npm test -- --watch

# Pane 3 (kanan bawah): Monitor logs
tail -f /var/log/app.log
```

---

## ⌨️ Keyboard Shortcuts Lengkap

### 📑 Tab Management
| Shortcut | Fungsi | Contoh Penggunaan |
|----------|--------|-------------------|
| `Ctrl+Shift+T` | Buka tab baru | Buka project baru tanpa tutup yang lama |
| `Ctrl+Shift+W` | Tutup tab aktif | Tutup session yang sudah selesai |
| `Ctrl+Tab` | Tab berikutnya | Ganti project dengan cepat |
| `Ctrl+Shift+Tab` | Tab sebelumnya | Kembali ke project sebelumnya |
| `Ctrl+Shift+1-9` | Pindah ke tab ke-N | Langsung ke tab spesifik |

### 📐 Pane Management (Split Screen)
| Shortcut | Fungsi | Visual |
|----------|--------|--------|
| `Ctrl+Shift+H` | Split horizontal | `[ Left | Right ]` |
| `Ctrl+Shift+V` | Split vertical | `[ Top / Bottom ]` |
| `Ctrl+Shift+Q` | Tutup pane aktif | Tutup satu pane saja |

### 🧭 Navigasi Pane
| Shortcut | Fungsi |
|----------|--------|
| `Ctrl+Shift+←` | Pindah ke pane kiri |
| `Ctrl+Shift+→` | Pindah ke pane kanan |
| `Ctrl+Shift+↑` | Pindah ke pane atas |
| `Ctrl+Shift+↓` | Pindah ke pane bawah |

### 📏 Resize Pane
| Shortcut | Fungsi |
|----------|--------|
| `Ctrl+Shift+Alt+←` | Resize ke kiri (perkecil) |
| `Ctrl+Shift+Alt+→` | Resize ke kanan (perbesar) |
| `Ctrl+Shift+Alt+↑` | Resize ke atas (perkecil tinggi) |
| `Ctrl+Shift+Alt+↓` | Resize ke bawah (perbesar tinggi) |

### 📋 Copy/Paste & Selection
| Shortcut | Fungsi |
|----------|--------|
| `Ctrl+Shift+C` | Copy teks yang diselect |
| `Ctrl+Shift+V` | Paste dari clipboard |
| `Right Click` | Paste (alternatif) |
| `Mouse Drag` | Select text |
| `Double Click` | Select word |
| `Triple Click` | Select line |

### 🔍 Search & Navigation
| Shortcut | Fungsi |
|----------|--------|
| `Ctrl+Shift+F` | Search dalam terminal |
| `Ctrl+Shift+X` | Copy mode (scroll & select) |

### 🎨 Appearance
| Shortcut | Fungsi |
|----------|--------|
| `Ctrl++` | Perbesar font |
| `Ctrl+-` | Perkecil font |
| `Ctrl+0` | Reset ukuran font |
| `F11` | Toggle fullscreen |

### ⚙️ System
| Shortcut | Fungsi |
|----------|--------|
| `Ctrl+Shift+R` | Reload konfigurasi |
| `Ctrl+Shift+L` | Show debug overlay |

---

## 🎨 Kustomisasi

### Mengubah Tema Warna

Edit file `~/.wezterm.lua` pada bagian `config.colors`:

#### Tema Matrix (Hijau Neon) - Default
```lua
config.colors = {
  foreground = '#00ff00',
  background = '#0a0a0a',
  cursor_bg = '#00ff00',
}
```

#### Tema Cyberpunk (Cyan Neon)
```lua
config.colors = {
  foreground = '#00ffff',  -- Cyan neon
  background = '#0a0a0a',
  cursor_bg = '#00ffff',
}
```

#### Tema Dracula
```lua
config.colors = {
  foreground = '#f8f8f2',
  background = '#282a36',
  cursor_bg = '#ff79c6',
}
```

#### Tema Hacker (Green on Black)
```lua
config.colors = {
  foreground = '#33ff33',
  background = '#000000',
  cursor_bg = '#66ff66',
}
```

### Mengubah Font

```lua
-- Ganti Fira Code dengan font lain
config.font = wezterm.font_with_fallback {
  {
    family = 'JetBrains Mono',  -- Font pilihan
    weight = 'Regular',
    harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
  },
  'Fira Code',
  'monospace',
}

-- Ubah ukuran font
config.font_size = 13.0  -- Default: 11.0
```

**Font Recommendations:**
- **Fira Code** ⭐ (Default, ligatures support)
- **JetBrains Mono** (Modern, clean)
- **Cascadia Code** (Microsoft, bagus untuk Windows users)
- **Hack** (Minimalist, readable)
- **Source Code Pro** (Adobe, professional)
- **Iosevka** (Slim, space-efficient)

### Mengubah Transparansi

```lua
config.window_background_opacity = 0.95  -- 95% solid (5% transparent)
-- Range: 0.0 (fully transparent) - 1.0 (fully solid)

-- Contoh lain:
-- 0.80 = 80% solid, cukup transparent
-- 0.90 = 90% solid, sedikit transparent
-- 1.00 = 100% solid, tidak transparent
```

### Mengubah Shell Default

```lua
-- Bash (default)
config.default_prog = { '/bin/bash' }

-- Zsh (Oh My Zsh friendly)
config.default_prog = { '/bin/zsh' }

-- Fish (friendly shell)
config.default_prog = { '/usr/bin/fish' }

-- Python interactive
config.default_prog = { '/usr/bin/python3' }

-- With custom arguments
config.default_prog = { '/bin/bash', '-l' }  -- Login shell
```

### Menambahkan Keybinding Custom

```lua
-- Tambahkan di dalam config.keys
{
  key = 'K',
  mods = 'CTRL|SHIFT',
  action = wezterm.action.SpawnCommandInNewTab {
    args = { 'htop' },
  },
},
```

### Contoh Konfigurasi Lengkap untuk Editing

```lua
-- Lokasi file: ~/.wezterm.lua

-- 1. Ubah warna
config.colors.foreground = '#00ffff'  -- Cyan neon

-- 2. Ubah font size
config.font_size = 12.0

-- 3. Ubah transparansi
config.window_background_opacity = 0.90

-- 4. Ubah shell
config.default_prog = { '/bin/zsh' }

-- Reload config: Ctrl+Shift+R
```

---

## 🐛 Troubleshooting

### Problem 1: Font Fira Code tidak muncul

**Solusi:**
```bash
# Check font terinstall
fc-list | grep "Fira Code"

# Jika tidak muncul, install ulang
sudo apt install fonts-firacode -y
fc-cache -fv

# Restart WezTerm
killall wezterm
wezterm
```

### Problem 2: Ligatures tidak aktif

**Solusi:**
```lua
-- Pastikan di config ada:
harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }

-- Reload: Ctrl+Shift+R
```

### Problem 3: Warna tidak sesuai (vim/tmux)

**Solusi:**
```bash
# Set TERM environment variable
echo 'export TERM=wezterm' >> ~/.bashrc
source ~/.bashrc

# Untuk tmux, edit ~/.tmux.conf
set -g default-terminal "wezterm"
```

### Problem 4: Keybinding tidak berfungsi

**Solusi:**
```bash
# Check konflik dengan system shortcuts
# GNOME: Settings > Keyboard > View and Customize Shortcuts
# KDE: System Settings > Shortcuts

# Test keybindings WezTerm:
wezterm show-keys --lua
```

### Problem 5: Terminal lag/slow

**Solusi:**
```lua
-- Edit ~/.wezterm.lua
config.front_end = 'Software'  -- Ganti dari OpenGL

-- Atau coba WebGpu
config.front_end = 'WebGpu'

-- Kurangi animation
config.animation_fps = 30
config.max_fps = 30
```

### Problem 6: Config tidak load

**Solusi:**
```bash
# Check syntax error
wezterm --config-file ~/.wezterm.lua

# Check file location
ls -la ~/.wezterm.lua

# Check permission
chmod 644 ~/.wezterm.lua

# Reload config
killall wezterm && wezterm
```

### Problem 7: Copy/Paste tidak work

**Solusi:**
```bash
# Install xclip untuk clipboard support
sudo apt install xclip -y

# Atau xsel
sudo apt install xsel -y
```

---

## 📁 Struktur Project

```
athaterm/
├── athaterm.lua          # File konfigurasi utama
├── README.md             # Dokumentasi lengkap (file ini)
├── .gitignore            # Git ignore file
└── screenshots/          # (Optional) Screenshot tampilan
    ├── main.png
    ├── split-screen.png
    └── tabs.png
```

**Lokasi file setelah instalasi:**
```
~/.wezterm.lua            # Konfigurasi active
~/.config/wezterm/        # (Optional) Alternative location
```

---

## 🔧 Advanced Configuration

### Multiple Config Files (Modular)

Buat struktur modular:

```bash
mkdir -p ~/.config/wezterm
```

**File: ~/.config/wezterm/colors.lua**
```lua
return {
  foreground = '#00ff00',
  background = '#0a0a0a',
  cursor_bg = '#00ff00',
  -- ... colors lainnya
}
```

**File: ~/.config/wezterm/keys.lua**
```lua
local wezterm = require 'wezterm'
return {
  { key = 'T', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  -- ... keys lainnya
}
```

**File: ~/.wezterm.lua (main)**
```lua
local wezterm = require 'wezterm'
local colors = require 'colors'
local keys = require 'keys'

local config = wezterm.config_builder()
config.colors = colors
config.keys = keys

return config
```

### Environment Variables

```lua
config.set_environment_variables = {
  EDITOR = 'nvim',
  TERM = 'wezterm',
  COLORTERM = 'truecolor',
}
```

### Conditional Configuration (Multi-OS)

```lua
-- Auto-detect OS dan set shell
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'powershell.exe' }
elseif wezterm.target_triple:find('darwin') then
  config.default_prog = { '/bin/zsh' }  -- macOS
else
  config.default_prog = { '/bin/bash' }  -- Linux
end
```

### SSH Multiplexing

```lua
-- Quick SSH connections
config.launch_menu = {
  {
    label = 'Production Server',
    args = { 'ssh', 'user@prod.server.com' },
  },
  {
    label = 'Development Server',
    args = { 'ssh', 'user@dev.server.com' },
  },
}
```

### Custom Tab Titles

```lua
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local title = pane.title

  if pane.title:find('ssh') then
    title = '🔒 ' .. title
  elseif pane.title:find('vim') or pane.title:find('nvim') then
    title = '📝 ' .. title
  end

  return title
end)
```

---

## 📚 Resources & Links

### Official Documentation
- **WezTerm Docs**: https://wezfurlong.org/wezterm/
- **WezTerm GitHub**: https://github.com/wez/wezterm
- **WezTerm Config Recipes**: https://github.com/wez/wezterm/discussions

### Font Resources
- **Fira Code**: https://github.com/tonsky/FiraCode
- **Nerd Fonts**: https://www.nerdfonts.com/
- **Programming Fonts**: https://www.programmingfonts.org/

### Color Schemes
- **Terminal Sexy**: https://terminal.sexy/
- **Coolors**: https://coolors.co/
- **WezTerm Color Schemes**: https://wezfurlong.org/wezterm/colorschemes/

### Community
- **Reddit r/wezterm**: https://reddit.com/r/wezterm
- **Discord**: https://discord.gg/wezterm

---

## 📝 Tips & Tricks

### 1. Quick Reload Config
```bash
# Setelah edit config, reload tanpa restart
Ctrl+Shift+R
```

### 2. Debug Configuration
```bash
# Show all keybindings
wezterm show-keys --lua

# Test config file
wezterm --config-file ~/.wezterm.lua ls-fonts

# Show WezTerm info
wezterm --version
wezterm --help
```

### 3. Performance Tuning
```lua
-- Untuk laptop dengan GPU lemah
config.front_end = 'Software'
config.animation_fps = 30

-- Untuk desktop dengan GPU kuat
config.front_end = 'WebGpu'
config.animation_fps = 60
config.max_fps = 144
```

### 4. Productivity Hacks
```bash
# Buat alias di ~/.bashrc
alias athaterm='wezterm'
alias tt='wezterm start --always-new-process'

# Quick SSH dengan tmux
alias ssht='ssh -t user@server "tmux attach || tmux new"'
```

### 5. Integration dengan Tools
```bash
# Integrate dengan ranger (file manager)
export TERMCMD='wezterm'

# Integrate dengan git
git config --global core.editor "wezterm start -- nvim"
```

---

## ❓ FAQ (Frequently Asked Questions)

### Q: Apakah AthaTerm bisa jalan di Windows/macOS?
**A:** Konfigurasi ini dibuat untuk Linux, tapi WezTerm mendukung cross-platform. Edit bagian `default_prog` sesuai OS Anda.

### Q: Apakah harus install Fira Code?
**A:** Tidak wajib, tapi recommended. Anda bisa ganti font di config dengan font monospace lain yang sudah terinstall.

### Q: Bagaimana cara uninstall?
**A:**
```bash
# Hapus config
rm ~/.wezterm.lua

# Uninstall WezTerm (Ubuntu/Debian)
sudo apt remove wezterm
```

### Q: Apakah bisa dipakai untuk production server?
**A:** Ya! Ini hanya konfigurasi, WezTerm sangat stabil untuk production. Cocok untuk DevOps dan sysadmin.

### Q: Apa bedanya dengan Alacritty/Kitty?
**A:** WezTerm lebih feature-rich (built-in multiplexing, ligatures, image protocol). Alacritty lebih minimalis, Kitty di tengah-tengah.

### Q: Apakah menghabiskan banyak RAM?
**A:** WezTerm cukup lightweight (~50-100MB RAM untuk 1 window). Lebih ringan dari Electron-based terminals.

### Q: Bisa pakai Oh My Zsh/Powerlevel10k?
**A:** Sangat bisa! Ganti `default_prog` ke zsh dan install Oh My Zsh seperti biasa.

---

## 🤝 Contributing

Ingin berkontribusi? Silakan:

1. Fork repository ini
2. Buat branch baru: `git checkout -b fitur-baru`
3. Commit perubahan: `git commit -am 'Tambah fitur X'`
4. Push ke branch: `git push origin fitur-baru`
5. Buat Pull Request

**Ideas untuk contribution:**
- Tambahan color schemes
- Keybindings alternatif
- Integration dengan tools lain
- Screenshot/video tutorial
- Translate documentation

---

## 📄 License

Proyek ini menggunakan **MIT License** - bebas digunakan, dimodifikasi, dan didistribusikan.

WezTerm sendiri juga menggunakan MIT License. Lihat: https://github.com/wez/wezterm/blob/main/LICENSE.md

---

## 🙏 Credits & Acknowledgments

- **Wez Furlong** - Creator of WezTerm
- **Nikita Prokopov** - Creator of Fira Code font
- **Linux Community** - Untuk ecosystem open source yang luar biasa
- **You** - Pengguna AthaTerm!

---

## 📞 Support & Contact

Jika ada pertanyaan atau masalah:

1. **Buka Issue**: https://github.com/yourusername/athaterm/issues
2. **Discussion**: https://github.com/yourusername/athaterm/discussions
3. **Email**: your.email@example.com

---

## 🗺️ Roadmap

**Version 1.1** (Planned):
- [ ] Tambahan theme presets (Dracula, Nord, Solarized)
- [ ] Auto-installation script
- [ ] Video tutorial
- [ ] Integration dengan tmux

**Version 2.0** (Future):
- [ ] GUI configurator
- [ ] Plugin system
- [ ] Cloud sync konfigurasi

---

<div align="center">

**⭐ AthaTerm - Your Terminal, Your Style ⭐**

*Dibuat dengan 💚 untuk Linux community*

**[⬆ Back to Top](#-athaterm---konfigurasi-wezterm-custom)**

---

[![GitHub Stars](https://img.shields.io/github/stars/Bangkah/athaterm?style=social)](https://github.com/Bangkah/athaterm)
[![GitHub Forks](https://img.shields.io/github/forks/Bangkah/athaterm?style=social)](https://github.com/Bangkah/athaterm)
[![GitHub Issues](https://img.shields.io/github/issues/Bangkah/athaterm)](https://github.com/Bangkah/athaterm/issues)

</div>
