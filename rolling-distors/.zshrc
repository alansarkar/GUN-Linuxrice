#

#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#my to
colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/zsh-completion/zsh_completion ] && . /usr/share/zsh-completion/zsh_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal zsh
# globbing instead of external grep binary.


unset use_color safe_term match_lhs sh

# set the colour of the hostname 
#PS1="\e[0;31m[\u@\h \W]\$ \e[0m "
export HISTCONTROL=ignoreboth:erasedups

#here  is hostname and  other texts config file
#orginal
#PS1='[\u@\h \W]\$ '
#PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '

#my
#PS1='\[\033[00;36m\][\u\[\033[00;35m\]@\h \W]\[\033[00;32m\]\$\[\033[00m\] '
#PS1='\[\033[01;32m\]->> \W$ \[\033[00m\]'
#PS1='\[\033[01;36m\]-\[\033[01;35m\]>> \[\033[01;36m\]\W\[\033[00;32m\]\$\[\033[00m\] '
#PS1='\[\033[01;32m\][\u\[\033[01;31m\]@\h \W\[\033[01;36m\]]\[\033[01;31m\]\$\[\033[00m\] '
PS1='->> ~$ '

 #for root
#PS1='\e~[1;31m->> \W$ \e[m'

if [ -d "$HOME/.bin" ] ;
	then PATH="$HOME/.bin:$PATH"
fi

#list
alias ls='ls --color=auto'
alias uname='uname -a'
alias lsx='ls --color=auto -lh '
alias lsd='ls -a --color=auto -d */'
alias la='ls -a'
alias ll='ls -la'
alias l='ls' 					
alias l.="ls -A | egrep '^\.'"      
#alias ss='ss -natu0Spl   --vsock --xdp '
#fix obvious typo's
alias cd..='cd ..'
alias v='vim'
alias sta='sudo sh /home/$(whoami)/my\ scripts/sta'
alias stp='sudo sh /home/$(whoami)/"my scripts"/stp'
alias re='sudo sh /home/$(whoami)/my\ scripts/re'
alias pm='sh /home/$(whoami)/my\ scripts/pm.sh'
alias p2='sh /home/$(whoami)/my\ scripts/p2.sh'
alias p3='sh /home/$(whoami)/my\ scripts/p3.sh'
alias fp='sh /home/$(whoami)/my\ scripts/fp.sh'
alias ff='sh /home/$(whoami)/my\ scripts/ff.sh'
alias f2='sh /home/$(whoami)/my\ scripts/f2.sh'
alias ssx='ss -natu'
alias sysx='systemctl'
alias sysp='systemctl | grep service'
alias tk='sudo sh /home/$(whoami)/my\ scripts/tk.sh'
alias sf='sh /home/$(whoami)/my\ scripts/sf.sh'
#alias sf='ssh-agent /home/$(whoami)/my\ scripts/sf.sh'
alias sf2='sh /home/$(whoami)/my\ scripts/sf2.sh'
alias surf='surf -sgta'
alias rdt='sh /home/$(whoami)/my\ scripts/reddit.sh'
alias fb='sh /home/$(whoami)/my\ scripts/facebook.sh'
#alias irssiconf='nano w/palemoon/.irssi/config.RP4P8Z '
alias newsboat='firejail newsboat -r'
#alias newsboat='sh /home/$(whoami)/my\ scripts/newsboat.sh'
alias news='sh /home/$(whoami)/my\ scripts/newsboat.sh'
alias stor='sh /home/$(whoami)/my\ scripts/tor.sh'
alias torset='sudo sh /home/$(whoami)/my\ scripts/ftor.sh'
alias newsurls='nano w/palemoon/.newsboat/urls'
alias newsconf='nano w/palemoon/.newsboat/config'
alias mnt='sh /home/$(whoami)/my\ scripts/mnt'
alias mnt2='sh /home/$(whoami)/my\ scripts/mnt2'
alias mnd='cd /run/media/$(whoami)/ ; ls '
alias lt='sh /home/$(whoami)/my\ scripts/light.sh'
#alias lynx='firejail lynx -crawl    duckduckgo '
alias lynx='firejail /usr/bin/lynx -crawl -dump '
alias w3m='firejail w3m -no-cookie -graph -cols -num -4   www.duckduckgo.com'
alias elinks='firejail elinks  -anonymous duckduckgo.com  '
alias yv='ssh-agent /home/$(whoami)/my\ scripts/yt.sh'
#alias yv='rm -rf .config/youtube-viewer; rm -rf .cache/youtube-viewer;  sh /home/$(whoami)/my\ scripts/youtube-viewer'
#alias yv='rm -rf .cache/youtube-viewer ;  /usr/bin/vendor_perl/youtube-viewer'
alias youtube-viewer='rm -rf .config/youtube-viewer; rm -rf .cache/youtube-viewer; echo "run 'yv' command"'
alias pdw="pwd"
alias man='firejail man'
alias pacsearch='pacman -Ss'
alias udpate='sudo pacman -Syyu'
alias rtv='firejail rtv'
alias nsup='zsh /home/$(whoami)/my\ scripts/nslookup.sh'
alias nanob='firejail nanob -i www.duckduckgo.com '
## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias palemoon='firejail palemoon'
alias fgrep='fgrep --color=auto'
#alias facecam='sh /home/$(whoami)/my\ scripts/webcam.sh'
alias facecam='firejail mpv  -geometry 420x240+1450+800  --demuxer-lavf-format video4linux2 --demuxer-lavf-o-set input_format=mjpeg av://v4l2:/dev/video0 '
alias facerecord='ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 Facecam-record-$(date +%Y)-$(date +%m)-$(date +%d){$(date +%T)}.mp4'
#alias screenrecord='ffmpeg -y -f x11grab -s $(xdpyinfo | awk '/dimensions:/ { print $2; exit }')  -i :0.0 -f alsa -i default  ffmpeg-record-$(date +%Y)-$(date +%m)-$(date +%d){$(date +%T)}.mp4'

alias pullanime='ssh-agent ./scripttest/pullanime.sh '
alias pullmusic='ssh-agent ./my\ scripts/pullmusic.sh'
alias yt='ssh-agent ./my\ scripts/playlists.sh'
alias gogosearch='ssh-agent my\ scripts/gogo.sh'
alias nicosearch='ssh-agent scripttest/nico.sh'
alias moviessearch='ssh-agent scripttest/movies.sh'

alias ip2='firejail --quiet curl ifconfig.co'
alias cuif='firejail --quiet curl ifconfig.co'
alias yt-add='nano .config/.yt-playlist'
alias mplayer='firejail mplayer -x 700 -y 390'
alias mpv='firejail mpv '
alias mpv2='firejail mpv --loop-file=200'
alias myt='firejail  mpv --ytdl-format=best'
alias workd='sh /home/$(whoami)/my\ scripts/workdir.sh'
alias speedcheck='firejail curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - '
#alias updatedb='sudo sh /home/$(whoami)/my\ scripts/updatedb.sh'
alias chess='firejail xboard -fcp gnuchess'
alias curl='firejail --quiet curl' 
alias udiskill='sudo killall udisksd'
alias calcurse='firejail calcurse'
alias lsofx='sudo sh /home/$(whoami)/my\ scripts/lsof'
#alias news='firejail newsboat -r'
alias irssi='sh /home/$(whoami)/my\ scripts/irc.sh'
alias mp='firejail mplayer  -loop 100 -autosync 100 '
alias vm='sh /home/$(whoami)/my\ scripts/vbox.sh'
alias vb='sh /home/$(whoami)/my\ scripts/vbox'
alias mac='echo wifi; macchanger -s wlp2s0; echo ethernet; macchanger -s  enp3s0f1; echo local ; macchanger -s lo'
alias vol='amixer | head -5 |tail -1 |cut -d" " -f6'
alias openconf='openbox --reconfigure'
alias video='sh /home/$(whoami)/my\ scripts/videowatch'
#readable output
alias et='exit'
alias df='df -h'
alias wget='firejail wget -c'
alias wgetx='firejail wget -qO- '
alias wgeth='ssh-agent /home/$(whoami)/my\ scripts/wgeth.sh'
alias curl='firejail curl '
alias ls='ls -a --color=auto'
alias mutt='firejail mutt'
#pacman unlock
#alias unlock="sudo rm /var/lib/pacman/db.lck"

#free
alias free="free -mt"

#use all cores
alias uac="sh ~/.bin/main/000*"

#continue download
alias aria2c="firejail aria2c -x 3 -c "
alias aria2cx="firejail --private=/media/$(whoami)/VG/download/  aria2c -x 3 -c "
#alias man='firejail --noprofile man'
#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
#alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# yay as aur helper - updates everything
alias pksyua="yay -Syu --noconfirm"

#ps
alias ps="ps af"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias tor:='proxychains4'
#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#improve png
#alias fixpng="find . -type f -name "*.png" -exec convert {} -strip {} \;"

#add new fonts
alias fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - Beware
alias skel='cp -rf /etc/skel/* ~'
#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'
#quickly kill conkies
alias kc='killall conky'

#hardware info --short
alias hw="hwinfo --short"

#skip integrity check
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood                                                       
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo mount -t vboxsf -o rw,uid=1000,gid=1000 Public /home/$USER/Public"


#youtube-dl
alias youtube-dl='firejail youtube-dl'
alias ytd='firejail youtube-dl'
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "

alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -100"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#create a file called .zshrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.
HORIZONTAL=600
VERTICAL=380
#wmctrl -r ":ACTIVE:" -e 0,-1,-1,${HORIZONTAL},${VERTICAL}

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal
	
#neofetch



#bspc node -t pseudo_tiled
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11R6/bin:/usr/local/bin:/home/v$


export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/bin:/usr/local/bin:/bin:/usr/sbin:/bin:/usr/local/bin

case $TERM in
    linux) LANG=C ;;
    *) LANG=ja_JP.UTF-8 ;;
esac

