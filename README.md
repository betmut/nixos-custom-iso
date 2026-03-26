## My NixOS Configurations


## File Structures

```
.
├── configuration.nix
├── desktop-environment
│   ├── de-configuration.nix
│   ├── display-manager.nix
│   └── hyprland.nix
├── dotfiles
│   ├── hyprland
│   │   └── hyprland.conf
│   ├── hyprpaper
│   │   ├── hyprpaper.conf
│   │   └── moss.jpg
│   ├── kitty
│   │   ├── gruvbox-kitty.conf
│   │   └── kitty.conf
│   ├── neofetch
│   │   └── config.conf
│   ├── shell
│   │   ├── custom_prompt.sh
│   │   ├── notifiers
│   │   │   ├── low-battery-notification.sh
│   │   │   └── spotify-notifiers.sh
│   │   └── update_config.sh
│   ├── swaync
│   │   ├── config.json
│   │   └── style.css
│   ├── vim
│   ├── waybar
│   │   └── gruvbox
│   │       ├── config
│   │       ├── scripts
│   │       │   ├── caway.sh
│   │       │   ├── expand
│   │       │   └── wttr
│   │       └── style.css
│   ├── wlogout
│   │   ├── assets
│   │   │   ├── lock-hover.png
│   │   │   ├── lock.png
│   │   │   ├── logout-hover.png
│   │   │   ├── logout.png
│   │   │   ├── power-hover.png
│   │   │   ├── power.png
│   │   │   ├── restart-hover.png
│   │   │   ├── restart.png
│   │   │   ├── sleep-hover.png
│   │   │   ├── sleep.png
│   │   │   ├── windows-hover.png
│   │   │   └── windows.png
│   │   ├── layout
│   │   └── style.css
│   └── yazi
│       ├── flavors
│       │   └── gruvbox-dark.yazi
│       │       ├── flavor.toml
│       │       ├── Gruvbox-Dark.tmTheme
│       │       └── screenshot.png
│       └── theme.toml
├── filesystems.nix
├── flake.lock
├── flake.nix
├── hardware-configuration.nix
├── hostname
│   ├── linux
│   └── mac
├── LICENSE
├── modules
│   ├── common.nix
│   ├── darwin.nix
│   ├── linux.nix
│   └── services.nix
├── README.md
├── secrets
│   ├── secrets.nix
│   └── transmission-rpc-whitelist.age
├── stylix.nix
└── users
    ├── guest
    │   ├── config
    │   │   ├── hypridle.nix
    │   │   ├── hyprpaper.nix
    │   │   ├── vim.nix
    │   │   └── zsh.nix
    │   └── home.nix
    ├── macUser
    │   └── home.nix
    ├── mathewelhans
    │   ├── config
    │   │   ├── hypridle.nix
    │   │   ├── hyprpaper.nix
    │   │   ├── vim.nix
    │   │   ├── vscode.nix
    │   │   └── zsh.nix
    │   └── home.nix
    └── nixos
        └── home.nix

```

## Get Started