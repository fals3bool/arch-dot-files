#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias y='yazi'
alias fastfetch='fastfetch -l "Windows"'
alias bottom='btm --theme gruvbox'
PS1='[\u@\h \W]\$ '

function mann() {
  man "$1" 2>/dev/null | bat -l man
}

# spring initializr
alias spring-initializr='java --enable-preview -jar ~/Code/java/tmp/spring-initializr-tui/target/spring-initializr-tui-0.1.1.jar'
alias spring-run='set -a && source .env && set +a && mvn spring-boot:run'

# VSCodium
alias codium='flatpak run com.vscodium.codium'

# Wine? More like Beer :p
alias beer='WINEPREFIX=~/Games/wine/ wine'

# Fast C Compiler
function fcc() {
    local file="$1"

    if [[ "$file" == "-h" || "$file" == "--help" ]]; then
      echo "Usage: fcc file[.c]"
      echo
      echo "Fast C Compiler"
      echo "  Compiles a single c file using gcc and runs it"
      echo
      echo "Examples:"
      echo "  $ fcc file"
      echo "  $ fcc file.c"
      return 0
    fi

    if [[ -z "$file" ]]; then
        echo "[ERROR] Usage: $ fcc file[.c]"
        return 1
    fi

    if [[ "$file" != *.c ]]; then
        file="${file}.c"
    fi

    if [[ ! -f "$file" ]]; then
        echo "[ERROR] File does not exist: '$file'"
        return 1
    fi

    local output="${file%.c}"

    gcc "$file" -o "$output" &&
    "./$output"
}

# Fast C++ Compiler
function f++() {
    local file="$1"

    if [[ "$file" == "-h" || "$file" == "--help" ]]; then
      echo "Usage: f++ file[.cpp]"
      echo
      echo "Fast C++ Compiler"
      echo "  Compiles a single c++ file using g++ and runs it"
      echo
      echo "Examples:"
      echo "  $ f++ file"
      echo "  $ f++ file.cpp"
      return 0
    fi

    if [[ -z "$file" ]]; then
        echo "[ERROR] Usage: $ f++ file[.cpp]"
        return 1
    fi

    if [[ "$file" != *.cpp ]]; then
        file="${file}.cpp"
    fi

    if [[ ! -f "$file" ]]; then
        echo "[ERROR] File does not exist: '$file'"
        return 1
    fi

    local output="${file%.cpp}"

    g++ "$file" -o "$output" &&
    "./$output"
}

# keep this at the end
eval "$(starship init bash)"
