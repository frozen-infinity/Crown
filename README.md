# Crown
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)     ![Zen](https://img.shields.io/badge/Zen-%23F76F53.svg?style=for-the-badge&logo=zenbrowser&logoColor=white)        ![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)     ![CSS](https://img.shields.io/badge/css-%23663399.svg?style=for-the-badge&logo=css&logoColor=white)    ![Arch](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=arch-linux&logoColor=fff&style=for-the-badge)        


  ![Starship](https://img.shields.io/badge/starship-%23DD0B78?style=for-the-badge&logo=starship&logoColor=white)     ![Bash Script](https://img.shields.io/badge/bash_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)        ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)


Dotfiles for Arch Linux with an installation script!

# About

💻 WM: Niri

🐧 OS: Arch Linux

🐈‍⬛ Terminal: Kitty

😻 Shell prompt: Starship

⬆️ Status bar: Waybar

Also this setup uses EWW for it's widgets, and Neovim as a terminal text editor. 

# Previews

![First preview](https://github.com/frozen-infinity/Crown/blob/main/preview-1.png)
![Middle preview](https://github.com/frozen-infinity/Crown/blob/main/preview-2.png)
![Last preview](https://github.com/frozen-infinity/Crown/blob/main/preview-3.png)

Also I have made a video: 🔗  https://drive.google.com/file/d/1Eo4CzfPqjBqylrT70mnQppjukMWJ5Arx/view?usp=sharing

# Installation

  There is a `cr0wn.sh` script in this repository. You can use it via executing the following:
  `curl -sS https://github.com/frozen-infinity/Crown/blob/main/cr0wn.sh | sh`

  It will install required dependencies, configure NetworkManager to use iwd backend (required for the wifi widget to work), and copy the configuration files to the `.config` directory.

# Usage

In this setup there are the following shortcuts:


| Action                          | Bind                     |
| -------------                   | -------------            |
| Open browser (Zen)              | Win + Z                  |
| Open app launcher (wofi)        | Win + A                  |
| Open terminal (kitty)           | Win + T                  |
| Open pretty widget              | Win + S                  |
| Close window                    | Win + V                  |
| Toggle overview                 | Win + O                  |
| Resize window                   | Win + +/-                |
| Resize window using proportions | Win + R                  |
| Toggle floating                 | Win + V                  |
| Switch focus between windows    | Win + Left/Right         |
| Move focus between columns      | Win + Left/Right         |
| Open file browser (nautilus)    | Win + F                  |
| Move column                     | Win + Shift + Left/Right |
| Expel window                    | Win + ]/[                |
| Resize window height            | Win + Shift + +/-        |

> [!TIP]
> Click on sound, wifi and power Waybar modules to get a nice EWW widget. Tap on the song name in Waybar whan audio is playing to pause it.
