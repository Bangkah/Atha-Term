# AthaTerm - Custom WezTerm Configuration

AthaTerm adalah konfigurasi custom untuk WezTerm dengan tema dark dan aksen hijau neon, dirancang untuk memberikan pengalaman terminal yang modern dan eye-catching.

## 📋 Fitur Utama

- **Tema Dark dengan Aksen Hijau Neon**: Desain elegan dengan teks hijau neon pada background gelap
- **Font Fira Code dengan Ligatures**: Mendukung ligatures untuk coding experience yang lebih baik
- **Keybindings Custom**: Shortcut yang intuitif dan mudah diingat
- **Tab & Pane Management**: Split terminal secara horizontal/vertical dengan mudah
- **Performance Optimized**: Menggunakan OpenGL untuk rendering yang smooth

## 🚀 Instalasi

### 1. Install WezTerm

**Ubuntu/Debian:**
```bash
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update
sudo apt install wezterm
```

**Fedora/RHEL:**
```bash
sudo dnf copr enable wezterm/wezterm-nightly
sudo dnf install wezterm
```

**Arch Linux:**
```bash
sudo pacman -S wezterm
```

**Atau download binary dari:** https://wezfurlong.org/wezterm/installation.html

### 2. Install Font Fira Code

**Ubuntu/Debian:**
```bash
sudo apt install fonts-firacode
```

**Fedora:**
```bash
sudo dnf install fira-code-fonts
```

**Arch Linux:**
```bash
sudo pacman -S ttf-fira-code
```

**Manual Download:**
```bash
# Download dari GitHub
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
unzip Fira_Code_v6.2.zip -d ~/.local/share/fonts/
fc-cache -fv
```

### 3. Install Konfigurasi AthaTerm

```bash
# Copy file konfigurasi ke home directory
cp athaterm.lua ~/.wezterm.lua

# Atau buat symbolic link (recommended)
ln -s $(pwd)/athaterm.lua ~/.wezterm.lua
```

### 4. Restart WezTerm

Tutup dan buka kembali WezTerm, atau tekan `Ctrl+Shift+R` untuk reload konfigurasi.

## ⌨️ Keyboard Shortcuts

### Tab Management
| Shortcut | Aksi |
|----------|------|
| `Ctrl+Shift+T` | Buka tab baru |
| `Ctrl+Shift+W` | Tutup tab saat ini |
| `Ctrl+Tab` | Pindah ke tab berikutnya |
| `Ctrl+Shift+Tab` | Pindah ke tab sebelumnya |

### Pane Management (Split Screen)
| Shortcut | Aksi |
|----------|------|
| `Ctrl+Shift+H` | Split horizontal (kiri-kanan) |
| `Ctrl+Shift+V` | Split vertical (atas-bawah) |
| `Ctrl+Shift+Q` | Tutup pane saat ini |

### Navigasi Pane
| Shortcut | Aksi |
|----------|------|
| `Ctrl+Shift+←` | Pindah ke pane kiri |
| `Ctrl+Shift+→` | Pindah ke pane kanan |
| `Ctrl+Shift+↑` | Pindah ke pane atas |
| `Ctrl+Shift+↓` | Pindah ke pane bawah |

### Resize Pane
| Shortcut | Aksi |
|----------|------|
| `Ctrl+Shift+Alt+←` | Perkecil lebar pane ke kiri |
| `Ctrl+Shift+Alt+→` | Perbesar lebar pane ke kanan |
| `Ctrl+Shift+Alt+↑` | Perkecil tinggi pane ke atas |
| `Ctrl+Shift+Alt+↓` | Perbesar tinggi pane ke bawah |

### Copy/Paste
| Shortcut | Aksi |
|----------|------|
| `Ctrl+Shift+C` | Copy teks yang diselect |
| `Ctrl+Shift+V` | Paste dari clipboard |
| `Right Click` | Paste (mouse) |

### Font Size
| Shortcut | Aksi |
|----------|------|
| `Ctrl++` | Perbesar font |
| `Ctrl+-` | Perkecil font |
| `Ctrl+0` | Reset ukuran font |

### Lain-lain
| Shortcut | Aksi |
|----------|------|
| `Ctrl+Shift+F` | Search/Find dalam terminal |
| `Ctrl+Shift+R` | Reload konfigurasi |
| `F11` | Toggle fullscreen |

## 🎨 Kustomisasi

### Mengubah Warna Tema

Edit file `~/.wezterm.lua` pada bagian `config.colors`:

```lua
config.colors = {
  foreground = '#00ff00',  -- Warna teks utama (ganti dengan warna lain)
  background = '#0a0a0a',  -- Warna background (ganti dengan warna lain)
  cursor_bg = '#00ff00',   -- Warna cursor
  -- ... dan seterusnya
}
```

**Contoh warna alternatif:**
- Hijau neon: `#00ff00`
- Biru cyan: `#00ffff`
- Orange: `#ff8800`
- Pink neon: `#ff00ff`
- Red: `#ff0000`

### Mengubah Font

Edit bagian `config.font`:

```lua
config.font = wezterm.font_with_fallback {
  {
    family = 'JetBrains Mono',  -- Ganti dengan font pilihan
    weight = 'Regular',
    harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
  },
  'Fira Code',
  'monospace',
}

config.font_size = 12.0  -- Ubah ukuran font default
```

**Font monospace populer:**
- Fira Code (recommended, dengan ligatures)
- JetBrains Mono
- Cascadia Code
- Hack
- Source Code Pro
- Iosevka

### Mengubah Opacity/Transparansi

```lua
config.window_background_opacity = 0.95  -- 0.0 (transparan) - 1.0 (solid)
```

### Mengubah Default Shell

```lua
config.default_prog = { '/bin/zsh' }  -- Ganti bash dengan zsh
-- atau
config.default_prog = { '/usr/bin/fish' }  -- Ganti dengan fish
```

### Menambahkan Keybinding Custom

Tambahkan di dalam `config.keys`:

```lua
{
  key = 'K',  -- Tombol
  mods = 'CTRL|SHIFT',  -- Modifier keys
  action = wezterm.action.SpawnTab 'CurrentPaneDomain',  -- Aksi
},
```

## 📁 Struktur File

```
~/.wezterm.lua           # File konfigurasi utama AthaTerm
~/.config/wezterm/       # (Optional) Directory untuk konfigurasi tambahan
```

## 🐛 Troubleshooting

### Font Fira Code tidak muncul

```bash
# Verifikasi font terinstall
fc-list | grep "Fira Code"

# Jika tidak muncul, install manual:
sudo apt install fonts-firacode
fc-cache -fv
```

### Ligatures tidak aktif

Pastikan di konfigurasi ada:
```lua
harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
```

### Warna tidak sesuai

Beberapa program (vim, tmux) memiliki color scheme sendiri. Pastikan:
```bash
# Set TERM environment
export TERM=wezterm
```

### Keybinding tidak berfungsi

Cek konflik dengan system keybindings atau DE (Desktop Environment) shortcuts.

## 🔧 Advanced Configuration

### Menggunakan Multiple Config Files

Buat file terpisah untuk modularitas:

```lua
-- ~/.wezterm.lua
local wezterm = require 'wezterm'
local colors = require 'colors'  -- Load dari file colors.lua
local keys = require 'keys'      -- Load dari file keys.lua

local config = wezterm.config_builder()
config.colors = colors
config.keys = keys

return config
```

### Conditional Configuration

```lua
-- Deteksi OS
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'powershell.exe' }
elseif wezterm.target_triple:find('darwin') then
  config.default_prog = { '/bin/zsh' }
else
  config.default_prog = { '/bin/bash' }
end
```

### Environment Variables

Set environment variables di config:

```lua
config.set_environment_variables = {
  EDITOR = 'nvim',
  TERM = 'wezterm',
}
```

## 📚 Resources

- **WezTerm Official Docs**: https://wezfurlong.org/wezterm/
- **WezTerm Config Examples**: https://github.com/wez/wezterm/discussions
- **Fira Code Font**: https://github.com/tonsky/FiraCode
- **Color Schemes**: https://wezfurlong.org/wezterm/colorschemes/

## 📝 Tips & Tricks

1. **Quick Reload**: Gunakan `Ctrl+Shift+R` untuk reload config tanpa restart terminal
2. **Debugging Config**: Jalankan `wezterm show-keys --lua` untuk melihat semua keybindings
3. **Performance**: Jika lag, coba ubah `config.front_end = 'WebGpu'` ke `'OpenGL'` atau `'Software'`
4. **Theme Testing**: Lihat preview color schemes dengan `wezterm ls-fonts` dan `wezterm imgcat`

## 🤝 Contributing

Feel free to customize dan share improvement:
1. Fork konfigurasi ini
2. Buat modifikasi
3. Share dengan komunitas

## 📄 License

Konfigurasi ini free to use and modify. WezTerm sendiri licensed under MIT License.

---

**AthaTerm** - Terminal yang powerful dengan style yang unik!

Made with 💚 (neon green) for terminal enthusiasts
