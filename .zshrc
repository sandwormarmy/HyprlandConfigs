# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------
# Allgemeine Zsh-Konfiguration
# -----------------------------

# Zinit-Installation (Pfad zur Zinit-Installation)
source $HOME/.zsh/zinit/zinit.git/zinit.zsh


# Verhindere, dass der Benutzer mit Zsh eine wiederholte Eingabe macht
setopt histignoredups      # Verhindert doppelte Einträge in der Historie
setopt histignorespace    # Ignoriere Eingaben, die mit einem Leerzeichen beginnen
setopt append_history     # Anhängen an die Historie, statt sie zu überschreiben
HISTFILE=~/.zsh_history    # Historien-Datei
HISTSIZE=10000            # Maximale Anzahl der gespeicherten Befehle
SAVEHIST=10000            # Maximale Anzahl der Historien, die gespeichert werden

# -------------------------
# Zsh-Alias und Funktionen
# -------------------------

# Nützliche Aliase
alias ..='cd ..'           # Einfacher Rückwärts-Ordner-Befehl
alias ...='cd ../..'       # Zwei Ebenen nach oben wechseln
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias vs='vscodium'
alias sublime='subl'
alias txt='subl'
alias code='vscodium'

# ------------------------
# Zsh-Plugins und Themes
# ------------------------

# Plugin-Manager (zinit)
export ZSH=$HOME/.zsh
export ZINIT_HOME=$ZSH/zinit
export PATH=$ZINIT_HOME/bin:$PATH

# Powerlevel10k für schönes Prompt-Design
zinit light romkatv/powerlevel10k

# Autocompletion und Vorschläge
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# ---------------------------
# Zsh-Prompt (Powerlevel10k)
# ---------------------------
# Powerlevel10k-Konfiguration: Wenn du Powerlevel10k verwendest
# (Achtung: Powerlevel10k muss installiert sein!)
# Das folgende wird beim ersten Start von Zsh konfiguriert.
# Du wirst durch den Setup-Prozess geführt, wenn es das erste Mal läuft.
# Um Powerlevel10k manuell zu konfigurieren, führe `p10k configure` aus.

# ------------------------
# Zsh Prompt Design (PS1)
# ------------------------

# Einfaches prompt Beispiel:
export PS1="%n@%m:%~ %(!.#.$) "  # Zeigt Benutzername, Hostname und Pfad an

# ---------------------------
# Zsh-Auto-Completion
# ---------------------------

# Aktivieren der Autovervollständigung
autoload -Uz compinit
compinit

# ---------------------------
# Zsh Plugins-Manager (zinit) Setup
# ---------------------------

# Zinit für schnellere Installationen und Management
if [[ ! -e $ZINIT_HOME ]]; then
    echo "Zinit wird jetzt installiert..."
    curl -fsSL https://git.io/zinit | sh
fi

# Beispiel für das Hinzufügen von Zinit-Plugins
# Plugin für den schnellen Zugriff auf Git-Befehle
zinit light zsh-users/zsh-completions

# -------------------------
# Farben für das Terminal
# -------------------------

# Setze Farben für die Terminal-Ausgabe
autoload -U colors && colors

# -------------------------
# Zsh History-Handling
# -------------------------
# History-Datei
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt hist_ignore_dups

# -------------------------
# Verbesserte Tab-Vervollständigung
# -------------------------
bindkey "^I" complete-word
bindkey "^[[1;5C" forward-word 
bindkey "^[[1;5D" backward-word


### Added by Zinit's installer
if [[ ! -f $HOME/.zsh/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zsh/zinit" && command chmod g-rwX "$HOME/.zsh/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zsh/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.zsh/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
