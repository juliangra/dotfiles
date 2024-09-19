#!/bin/sh

print_divider() {
  echo
  echo '------------'
  echo
}

# Ensure the current working directory is the dotfiles directory
if [ "$(pwd)" != "$HOME/dotfiles" ]; then
    echo "❌ Error: The install script must be run from the \$HOME/dotfiles directory."
    exit 1
fi

# Prompt for sudo at the start
if [ "$(id -u)" -ne 0 ]; then
    echo "🔒 This script requires sudo privileges. Please enter your password."
    sudo -v || { echo "❌ Failed to obtain sudo privileges. Exiting."; exit 1; }
fi

# Ensure Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "🍺 Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "⏭️  Homebrew is already installed."
fi

print_divider

# Ensure stow is installed
if ! command -v stow &> /dev/null; then
    echo "⚙️  'stow' is not installed. Installing 'stow'..."
    brew install stow &> /dev/null
else
    echo "⏭️  Skipping: 'stow' is already installed."
fi

print_divider

# Symlink the dotfiles using `stow` 
echo "⚙️  Creating symlinks using 'stow'..."
stow . --adopt
# Assyme .gitconfig is not updated
git update-index --skip-worktree .gitconfig
echo "✅ Dotfiles successfully symlinked."

print_divider

# Install Homebrew packages from `Brewfile`
echo "⚙️  Installing Homebrew packages from 'Brewfile'..."
brew bundle install --file=~/dotfiles/Brewfile
echo "✅ Packages from 'BrewFile' installed successfully."

print_divider

echo "⚙️  Updating the path for tmux in the alacritty configuration file based on architecture..."

# Determine the correct path for tmux based on architecture
if [ "$(uname -m)" = "arm64" ]; then
    TMUX_PATH="/opt/homebrew/bin/tmux"
else
    TMUX_PATH="/usr/local/bin/tmux"
fi

# Updating the `alacritty.toml` with the correct path for tmux
ALACRITTY_CONF="$HOME/.config/alacritty/alacritty.toml"
TEMP_CONF="$HOME/.config/alacritty/alacritty_temp.toml"

# Make a copy of the configuration file
cp "$ALACRITTY_CONF" "$TEMP_CONF"

# Replace the tmux path in the configuration file
sed -i.bak "s|/usr/local/bin/tmux|$TMUX_PATH|g" "$TEMP_CONF"
mv "$TEMP_CONF" "$ALACRITTY_CONF"

# Remove the backup file created by sed
rm -f "$TEMP_CONF.bak"

echo "✅ Path updated successfully."

print_divider

# Installing Oh My zsh
echo "⚙️  Installing Oh My Zsh..."
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install zsh-autosuggestions and powerlevel9k
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

echo "✅ Oh My Zsh installed successfully."

print_divider

# Installing font files
echo "⚙️  Installing NerdFonts"
cp fonts/*.ttf /Library/Fonts/
echo "✅ NerdFonts installed successfully "

print_divider

# Install tmux plugin manager
echo "⚙️  Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "✅ Tmux plugin manager installed successfully."

# Install lunarvim
echo "🟩⬜️ Installing LunarVim..."
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
echo "✅ LunarVim installed successfully."

# Source the `.zshrc` file
echo "⚙️  Sourcing the .zshrc file..."
source $HOME/.zshrc
echo "✅ Sourced the .zshrc file successfully."
