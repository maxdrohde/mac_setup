


setopt hist_ignore_all_dups

################################################################################################################
################################################################################################################
################################################################################################################
################################################################################################################

function edit() {
     code ~/.zshrc
}

alias zsource='source ~/.zshrc'

alias c='code .'
alias o='open .'
alias cl='clear'

alias ga='git add -A'
alias gc='git commit -a -m'
alias gp='git push'

# Git Status
function gs() {
    echo "##############################################################"
    echo "STATUS"
    echo "##############################################################"
    git status
    echo "##############################################################"
    echo "DIFF"
    git diff | bat
    echo "##############################################################"
}


# Git Add, Commit, Push
function gacp() {
    if [ $# -eq 0 ]; then
            git add -A
            git commit -a -m "new"
            git push
    elif [ $# -eq 1 ]; then
            git add -A
            git commit -a -m "$1"
            git push
    else
        echo "Error: Too many arguments provided." >&2
        return 1
    fi
}

# Quit out of instances of screen
function quit_all_screen(){
    screen -ls | awk '/[0-9]+\./ {print $1}' | xargs -I{} screen -S {} -X quit
}

# Find code files that contain a certain string
function grep-code() {
    grep -rli --include="*.qmd" --include="*.rmd" --include="*.Rmd" --include="*.R" --include="*.r" "$1"
}

# Find "text" files that contain a certain string
function grep-text() {
    grep -rli --include="*.docx" --include="*.md" --include="*.rmd" --include="*.Rmd" --include="*.txt" --include="*.qmd" --include="*.tex" "$1"
}

# Find PDF files that contain a certain string
function grep-pdf() {
    grep -rli --include="*.pdf" "$1"
}

# Find files and directories that contain a certain string
function findname() {
    find . -iname "*"$1"*"
}

# History GREP
function hg() {
    history 0 | grep --color=auto -i "$1"
}

# Run an R Script
function rr() {
    Rscript "$1"
}

function qr() {
    quarto render "$1"
}

function qp() {
    quarto preview "$1"
}

function qpub() {
    quarto publish "$1"
}

function create_quarto_html() {
        echo "Creating Quarto Document"
        Rscript /Users/max/zsh-r-scripts/quarto_html.R
}

# LOCATIONS
# ----------------------------------------------------------------------------------------
function home() {
    cd ~
}

function desk() {
    cd /Users/max/Desktop
}

function down() {
    cd /Users/max/Downloads
}

# Websites
# ----------------------------------------------------------------------------------------
alias scholar='open https://scholar.google.com/'
alias wolfram='open https://www.wolframalpha.com/'
alias github='open https://github.com/'
alias github_projects='open https://github.com/projects'
# ----------------------------------------------------------------------------------------

# MISC

function compress_video() {
   echo "Running: ffmpeg -i "$1" -vcodec libx264 -crf 18 -preset slow -movflags faststart compressed_"$1""
   ffmpeg -i "$1" -vcodec libx264 -crf 18 -preset slow -movflags faststart compressed_"$1"
}

function compress_video_extreme() {
   echo "Running: ffmpeg -i "$1" -vcodec libx264 -crf 35 -preset slow -movflags faststart compressed_"$1""
   ffmpeg -i "$1" -vcodec libx264 -crf 35 -preset slow -movflags faststart compressed_"$1"
}

# Audio file to video, given an image
# ffmpeg -loop 1 -framerate 1 -i image.png -i audio.m4a -map 0 -map 1:a -c:v libx264 -preset ultrafast -tune stillimage -vf fps=10,format=yuv420p -c:a copy -shortest output.mp4
# https://superuser.com/questions/1584488/fastest-way-to-combine-an-image-and-audio-file-to-make-a-video-using-ffmpeg
