# Dotfiles

## 📋 Overview

This repository contains my personal configuration files (dotfiles) for Arch Linux. These dotfiles are designed to create a seamless, efficient, and personalized workflow, carefully crafted over time to maximize productivity and aesthetic appeal.

### Featured Configurations

- **Hyprland**: A dynamic tiling Wayland compositor
- **Neovim**: Highly efficient text editor with modern capabilities
- **Alacritty**: Fast GPU-accelerated terminal emulator
- **tmux**: Terminal multiplexer for session management
- **zsh**: Feature-rich shell with extensive customization
- **Waybar**: Highly customizable status bar for Wayland
- **And more**: Various utilities and small configurations

## ⚙️ Installation

### Prerequisites

Ensure you have the following installed on your Arch Linux system:

- **[GNU Stow](https://www.gnu.org/software/stow)**: For managing symlinks
- **Git**: For cloning this repository

```bash
sudo pacman -S stow git
```

### Setting Up Dotfiles

1. **Clone the Repository**

   ```bash
   git clone https://github.com/albugowy15/dotfiles.git ~/dotfiles
   ```

2. **Navigate to the Dotfiles Directory**

   ```bash
   cd ~/dotfiles
   ```

3. **Create Symlinks Using Stow**

   To deploy all configurations:

   ```bash
   stow .
   ```

   Or deploy specific configurations:

   ```bash
   stow nvim
   stow zsh
   stow hyprland
   # etc.
   ```

4. **Apply Configurations**

   Some configurations may require restarting applications or logging out and back in to take effect.

## 🧩 Configuration Details

<details>
<summary><b>Hyprland</b></summary>

My Hyprland setup includes:

- Custom keybindings for efficient window management
- Optimized workspace layouts
- Integrated with waybar for system status
- Animations and visual effects for a modern desktop experience

File location: `~/.config/hypr/`

</details>

<details>
<summary><b>Neovim</b></summary>

Features of my Neovim configuration:

- Modern LSP setup for code intelligence
- Treesitter for enhanced syntax highlighting
- Telescope for fuzzy finding
- Custom keymaps for improved workflow
- Plugin management with lazy.nvim

File location: `~/.config/nvim/`

</details>

<details>
<summary><b>Alacritty</b></summary>

Terminal configuration featuring:

- Custom color scheme
- Font configuration with ligatures
- Performance optimizations
- Key bindings for common operations

File location: `~/.config/alacritty/`

</details>

<details>
<summary><b>tmux</b></summary>

Terminal multiplexer setup with:

- Custom status bar
- Enhanced key bindings
- Session management utilities
- Integration with system clipboard

File location: `~/.tmux.conf`

</details>

<details>
<summary><b>zsh</b></summary>

Shell configuration featuring:

- Custom prompt with git integration
- Aliases for common commands
- Plugin management
- Path and environment variable setup

File location: `~/.zshrc`

</details>

<details>
<summary><b>Waybar</b></summary>

Status bar configuration with:

- System resource monitors
- Workspace indicators
- Media controls
- Custom styling and modules

File location: `~/.config/waybar/`

</details>

## 🔧 Customization

These dotfiles are designed to be easily customizable to suit your preferences:

1. **Before Making Changes**

   - Create backups of your existing configurations
   - Review the structure of each configuration directory

2. **Making Changes**

   - Modify files directly in the `~/dotfiles` directory
   - Test changes incrementally to ensure stability

3. **After Making Changes**
   - Restart the relevant application or reload its configuration
   - For system-wide changes, consider logging out and back in

## 🔄 Updating

Keep your dotfiles up to date with these steps:

```bash
cd ~/dotfiles
git pull origin main
stow .  # Re-apply configurations
```

## 🗂️ Directory Structure

```
dotfiles/
├── hyprland/
│   └── .config/hypr/
│       ├── hyprland.conf
│       └── ...
├── nvim/
│   └── .config/nvim/
│       ├── init.lua
│       └── ...
├── alacritty/
│   └── .config/alacritty/
│       ├── alacritty.yml
│       └── ...
├── zsh/
│   ├── .zshrc
│   └── .config/zsh/
├── tmux/
│   └── .tmux.conf
├── waybar/
│   └── .config/waybar/
│       ├── config
│       └── ...
└── ...
```

## 🔗 Dependencies

<details>
<summary>Click to view dependencies for each configuration</summary>

### Hyprland

- wlroots
- xdg-desktop-portal-hyprland

### Neovim

- nodejs (for LSP)
- ripgrep (for Telescope)
- fd (for Telescope)

### Waybar

- Font Awesome (for icons)
- pavucontrol (for audio module)

### Additional Tools

- wofi (application launcher)
- hyprlock (screen locking)
- brightnessctl (brightness control)
- playerctl (media control)
</details>

## 📝 Notes

- These configurations are primarily tested on Arch Linux
- Some configurations may require additional dependencies
