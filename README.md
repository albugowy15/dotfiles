# My Personal Dotfiles

Welcome to my dotfiles repository! This collection contains all my carefully crafted configuration files for **Arch Linux**, designed to create a seamless, efficient, and personalized workflow. These configurations cover a wide range of tools and applications, including:

- Hyprland (Wayland compositor)
- Neovim (text editor)
- Alacritty (terminal emulator)
- tmux (terminal multiplexer)
- zsh (shell)
- Waybar (status bar)
- And more!

Feel free to explore, use, and modify these configurations according to your needs. Remember, the best dotfiles are the ones tailored to your own workflow!

## Prerequisites

Before you begin, ensure you have the following installed on your Arch Linux system:

1. [GNU Stow](https://www.gnu.org/software/stow): A symlink farm manager that helps with managing multiple symlinks in a convenient way.
2. Git: To clone this repository.

To install GNU Stow, use the following command:

```sh
sudo pacman -S stow
```

## Installation

Follow these steps to set up the dotfiles on your system:

1. Clone the repository into your home directory. This ensures that the paths are correctly set up for the symlinks:

```sh
git clone https://github.com/albugowy15/dotfiles.git ~/dotfiles
```

2. Navigate to the dotfiles directory:

```sh
cd ~/dotfiles
```

3. Use GNU Stow to create symlinks for the configuration files. This command will create symlinks in your home directory that point to the files in the repository:

```sh
stow .
```

## Configuration Overview

Here's a brief overview of the main configurations included in this repository:

- **Hyprland**: A dynamic tiling Wayland compositor
- **Neovim**: A highly configurable text editor
- **Alacritty**: A fast, cross-platform, OpenGL terminal emulator
- **tmux**: A terminal multiplexer for managing multiple terminal sessions
- **zsh**: An extended version of the Bourne Shell with many improvements
- **Waybar**: A highly customizable Wayland bar for Sway and Wlroots based compositors

Each tool's configuration can be found in its respective directory within this repository.

## Customization

Feel free to customize these configurations to suit your preferences. Here are some tips:

1. Before making changes, create a backup of the original configurations.
2. Modify the files in the `~/dotfiles` directory.
3. After making changes, you may need to restart the respective application or log out and log back in for some changes to take effect.

## Updating

To update your dotfiles with the latest changes from this repository:

1. Navigate to your dotfiles directory:

```sh
cd ~/dotfiles
```

2. Pull the latest changes:

```sh
git pull origin main
```

3. Re-run stow to update the symlinks:

```sh
stow .
```
