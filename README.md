# My Personal Dotfiles

This repository contains all my configuration files for Arch Linux, tailored to create a seamless and efficient workflow. The configurations cover Hyprland, Neovim, Alacritty, tmux, zsh, Waybar, and more. Explore, use, and modify them according to your needs.

## Installation

### Prerequisites

Make sure [GNU Stow](https://www.gnu.org/software/stow) is installed on your system. GNU Stow is a symlink farm manager that helps with managing multiple symlinks in a convenient way. It is useful for managing dotfiles, as it follows for easy deployment and updating of configuration files.

To install GNU Stow, use the following command:

```sh
sudo pacman -S stow
```

### Installation Steps

Clone the repository into your home directory. This ensures that the paths are correctly set up for the symlinks.

```sh
git clone https://github.com/albugowy15/dotfiles.git
```

Use GNU Stow to create symlinks for the configuration files. This command will create symlink in the home directory that point to the files in the repository.

```
stow .
```

## Screenshots

![Screenshot-2024-07-03_18:50:19](https://github.com/albugowy15/image-upload/assets/49820990/0c3db0bc-4285-4f8b-9edc-112a6864e5a4)
![Screenshot-2024-07-03_18:48:48](https://github.com/albugowy15/image-upload/assets/49820990/34d9a4a3-f8cf-4461-92a4-c19a70a38a00)
![Screenshot-2024-07-03_18:49:40](https://github.com/albugowy15/image-upload/assets/49820990/1dcd6efb-d83a-4776-b566-904fc3b6f385)
![Screenshot-2024-07-03_18:49:56](https://github.com/albugowy15/image-upload/assets/49820990/2ef506b5-9cf5-4d06-9b14-a9ce7b3edd60)
![Screenshot-2024-07-03_18:50:06](https://github.com/albugowy15/image-upload/assets/49820990/e0352eaf-e82b-47f6-86d2-926ffedcb199)
