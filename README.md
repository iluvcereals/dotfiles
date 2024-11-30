# Stow Configuration Setup

This repository contains my dotfiles and configuration managed using GNU Stow. The instructions below guide you on how to clone this repository and apply the configurations to your system. Note that these steps are tested on Arch-based distributions.

## 📋 Prerequisites

1. **Install Git**: Ensure Git is installed on your system. You have two options:

   - Using `pacman`:

     ```bash
     sudo pacman -S git
     ```

   - Using `yay` (if you prefer an AUR helper):

     ```bash
     yay -S git
     ```

2. **Install GNU Stow**: Ensure GNU Stow is installed on your system. You have two options:

   - Using `pacman`:

     ```bash
     sudo pacman -S stow
     ```

   - Using `yay` (if you prefer an AUR helper):

     ```bash
     yay -S stow
     ```

3. **Backup Your Existing Configuration** (Optional):
   Before proceeding, consider backing up your existing configuration files to avoid overwriting important files.

## 🚀 Setup Instructions

Before proceeding, ensure that this repository (referred to as `dotfiles` in this guide) is located in your home directory (e.g., `~/dotfiles`). This is required for the symlinks to work correctly.

1. **Clone This Repository**:

   ```bash
   git clone git@github.com:iluvcereals/dotfiles.git
   cd dotfiles
   ```

2. **Stow All Configurations**:
   Use the following command to apply all configurations at once:

   ```bash
   stow .
   ```

   This command creates symlinks for all the configurations in this repository to your home directory.

   > **Note**: Ensure the repository structure mirrors your home directory's hierarchy. For example:
   >
   > - If the configuration file is `~/.bashrc`, it should be named `.bashrc` and placed at the root of this repository.
   > - If the configuration file is in `~/.config/`, it should be placed in a `.config/` directory within this repository.

3. **Verify Symlinks**:
   Check that the files are symlinked correctly:

   ```bash
   ls -l ~
   ```

   Look for symbolic links pointing to this repository's files.

## 🛠️ Troubleshooting

- **File Overwrite Conflicts**:
  If a file already exists and conflicts with a symlink, move the existing file to a backup location:

  ```bash
  mv ~/.bashrc ~/.bashrc.bak
  ```

  Then re-run `stow .`.

- **Partial Stow**:
  If you want to stow only specific configurations (e.g., `vim`), navigate to the repository root and run:

  ```bash
  stow vim
  ```

## 🧹 Unstowing Configurations

If you need to remove the symlinks created by Stow:

```bash
stow -D .
```

This will undo all the symlinks for the repository's configurations.

## 📄 Additional Notes

- These configurations have been tested on Arch-based distributions. Compatibility with other systems may require adjustments.
