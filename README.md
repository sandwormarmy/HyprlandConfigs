git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles add .config/hypr
dotfiles commit -m "Hyprland Config added"
dotfiles remote add origin <your-git-repo>
dotfiles push origin main



git clone --bare <your-git-repo> $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
