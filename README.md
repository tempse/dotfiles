# Dotfiles

Collection of personalized dotfiles.

## Requirements

This dotfiles repository is being developed using Ubuntu 16.04.
    
## Installation

> Warning: Before blindly using these dotfiles, review the code and adapt things to your own needs (e.g., in a personal fork of this repository). Use at your own risk!

1. Clone this repository into the folder `dotfiles/` in your home directory:
    ```
    git clone https://github.com/tempse/dotfiles.git ~/dotfiles
    ```
1. Execute `makesymlinks.sh`:
    ```
    cd ~/dotfiles
    ./makesymlinks.sh
    ```
    This script creates backup copies of all existing dotfiles in your home directory. Then it generates symlinks from your home directory to the files that are located in `~/dotfiles/`.
    > The list of dotfiles which are considered by `makesymlinks.sh` can be modified via the `files` variable in the very same script.

After installtion, the files in `~/dotfiles/` can be arbitrarily modified and all changes are automatically sourced whenever needed. The `makesymlinks.sh` script has to be re-run only if the list of dotfiles changes.


## Handling of sensitive information

While it generally seems like a noble idea to share your custom dotfiles with the community, there are some parts of your configuration you might not want to publish (e.g., connection details, personal file and folder paths,...). Here, this issue is solved by using another dotfiles repository in parallel (a private one!), which works completely analogously to the public dotfiles repository, but handles different dotfiles in the home directory. In order to make the private information available to this public repository, the private dotfiles are then just sourced by public ones.

> Example: In `bashrc`, the files `$HOME/.bashrc_private` and `$HOME/.bash_private_aliases` are sourced, if they exist. These files contain information that is not intended for public viewing.

