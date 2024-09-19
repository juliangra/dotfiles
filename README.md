# 🧑‍💻 Dotfiles Setup

This repository contains my personal configuration files (dotfiles) for various applications, as well as scripts for setting up a development environment. The setup is managed using [GNU Stow](https://www.gnu.org/software/stow/) for symlink management and [Homebrew](https://brew.sh/) for package installation on macOS.

## Prerequisites

- **GNU Stow**: Used to manage symlinks for dotfiles.
- **Homebrew**: Used to install necessary packages and dependencies.

### Installing Prerequisites

1. **Install Homebrew**:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install GNU Stow**:
   ```bash
   brew install stow
   ```

## Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/juliangra/dotfiles.git
   cd dotfiles
   ```

2. **Run the Installation Script**:

- This repository includes an `install.sh` script to automate the setup process.
- Run the script:
  ```bash
  zsh ./install.sh
  ```

## Directory Structure

- `.config/`: Contains configuration files for various applications (e.g., `nvim`, `alacritty`, etc.).
- `fonts/`: Contains custom fonts to be installed.
- `Library/`: Configuration files and scripts for macOS.
- `.gitconfig`: Global Git configuration file.
- `.nuxtrc`: Nuxt.js specific configuration.
- `.stow-local-ignore`: Custom ignore file for Stow.
- `.zshrc`: zsh configuration file.
- `Brewfile`: Homebrew bundle file for managing packages.
- `install.sh`: Script to automate the installation process.

## Adding New Dotfiles

1. Add your configuration files to the appropriate directory within the repository.
2. Use Stow to manage the symlinks as described above.

## Uninstalling

To remove symlinks created by Stow, use:

```bash
stow -D .
```
