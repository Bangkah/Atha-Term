#!/bin/bash

# AthaTerm Installation Script
# Auto-installer untuk WezTerm dengan konfigurasi AthaTerm

set -e  # Exit on error

# Colors untuk output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Banner
echo -e "${GREEN}"
echo "╔═══════════════════════════════════════╗"
echo "║                                       ║"
echo "║        AthaTerm Installer v1.0        ║"
echo "║   Custom WezTerm Configuration        ║"
echo "║                                       ║"
echo "╚═══════════════════════════════════════╝"
echo -e "${NC}"

# Fungsi untuk print info
info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

# Fungsi untuk print success
success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

# Fungsi untuk print warning
warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Fungsi untuk print error
error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Detect distro
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
    else
        error "Tidak bisa detect distro Linux"
        exit 1
    fi
    info "Distro terdeteksi: $DISTRO"
}

# Install WezTerm
install_wezterm() {
    info "Menginstall WezTerm..."

    case $DISTRO in
        ubuntu|debian|linuxmint|pop)
            info "Installing untuk Ubuntu/Debian..."
            curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
            echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
            sudo apt update
            sudo apt install wezterm -y
            ;;
        fedora|rhel|centos)
            info "Installing untuk Fedora/RHEL..."
            sudo dnf copr enable wezterm/wezterm-nightly -y
            sudo dnf install wezterm -y
            ;;
        arch|manjaro)
            info "Installing untuk Arch Linux..."
            sudo pacman -S wezterm --noconfirm
            ;;
        opensuse*)
            info "Installing untuk openSUSE..."
            sudo zypper install wezterm -y
            ;;
        *)
            warning "Distro tidak didukung oleh auto-installer"
            info "Silakan install WezTerm secara manual dari: https://wezfurlong.org/wezterm/installation.html"
            exit 1
            ;;
    esac

    success "WezTerm berhasil diinstall!"
}

# Install Fira Code font
install_firacode() {
    info "Menginstall Fira Code font..."

    case $DISTRO in
        ubuntu|debian|linuxmint|pop)
            sudo apt install fonts-firacode -y
            ;;
        fedora|rhel|centos)
            sudo dnf install fira-code-fonts -y
            ;;
        arch|manjaro)
            sudo pacman -S ttf-fira-code --noconfirm
            ;;
        opensuse*)
            sudo zypper install fira-code-fonts -y
            ;;
        *)
            warning "Install Fira Code secara manual"
            info "Download dari: https://github.com/tonsky/FiraCode/releases"
            ;;
    esac

    # Refresh font cache
    fc-cache -fv > /dev/null 2>&1
    success "Fira Code font berhasil diinstall!"
}

# Install AthaTerm config
install_config() {
    info "Menginstall konfigurasi AthaTerm..."

    # Backup existing config
    if [ -f ~/.wezterm.lua ]; then
        warning "File ~/.wezterm.lua sudah ada"
        info "Membuat backup di ~/.wezterm.lua.backup"
        mv ~/.wezterm.lua ~/.wezterm.lua.backup
    fi

    # Copy config
    if [ -f "athaterm.lua" ]; then
        cp athaterm.lua ~/.wezterm.lua
        success "Konfigurasi AthaTerm berhasil diinstall di ~/.wezterm.lua"
    else
        error "File athaterm.lua tidak ditemukan!"
        exit 1
    fi
}

# Verify installation
verify_installation() {
    info "Memverifikasi instalasi..."

    # Check WezTerm
    if command -v wezterm &> /dev/null; then
        WEZTERM_VERSION=$(wezterm --version)
        success "WezTerm terinstall: $WEZTERM_VERSION"
    else
        error "WezTerm tidak terdeteksi!"
        exit 1
    fi

    # Check Fira Code
    if fc-list | grep -qi "Fira Code"; then
        success "Fira Code font terinstall"
    else
        warning "Fira Code font tidak terdeteksi"
    fi

    # Check config
    if [ -f ~/.wezterm.lua ]; then
        success "Konfigurasi AthaTerm terinstall di ~/.wezterm.lua"
    else
        error "Konfigurasi tidak ditemukan!"
        exit 1
    fi
}

# Main installation flow
main() {
    echo ""
    info "Memulai instalasi AthaTerm..."
    echo ""

    # Step 1: Detect distro
    detect_distro
    echo ""

    # Step 2: Check if WezTerm already installed
    if command -v wezterm &> /dev/null; then
        warning "WezTerm sudah terinstall"
        read -p "Install ulang? (y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            install_wezterm
        fi
    else
        install_wezterm
    fi
    echo ""

    # Step 3: Install Fira Code
    if fc-list | grep -qi "Fira Code"; then
        success "Fira Code sudah terinstall"
    else
        install_firacode
    fi
    echo ""

    # Step 4: Install config
    install_config
    echo ""

    # Step 5: Verify
    verify_installation
    echo ""

    # Done!
    echo -e "${GREEN}"
    echo "╔═══════════════════════════════════════╗"
    echo "║                                       ║"
    echo "║   ✓ Instalasi Berhasil!               ║"
    echo "║                                       ║"
    echo "╚═══════════════════════════════════════╝"
    echo -e "${NC}"

    echo ""
    info "Cara menggunakan:"
    echo "  1. Jalankan: wezterm"
    echo "  2. Atau cari 'WezTerm' di application launcher"
    echo ""
    info "Keyboard shortcuts:"
    echo "  - Ctrl+Shift+T  : Tab baru"
    echo "  - Ctrl+Shift+H  : Split horizontal"
    echo "  - Ctrl+Shift+V  : Split vertical"
    echo "  - Ctrl+Shift+R  : Reload config"
    echo ""
    info "Dokumentasi lengkap: cat README.md"
    echo ""

    # Ask to launch
    read -p "Jalankan WezTerm sekarang? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        info "Meluncurkan WezTerm..."
        wezterm &
        disown
        success "WezTerm berjalan!"
    fi
}

# Run main function
main
