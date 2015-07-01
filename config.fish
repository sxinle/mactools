# git clone git://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish
# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

set fish_theme zish


# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins theme git

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

set fish_greeting ""

#user alias#{{{

alias halt='sudo halt'
alias ..='cd .. ;and ls'
alias reboot='sudo reboot'
alias vi='vim -u NONE '
alias sqlog='/home/hsong/folder/util/sqlog'
alias svnstart='svnserve -d -r /home/svn'
alias vim='/usr/local/bin/vim'
alias vi='/usr/local/bin/vim'

alias gvim='gvim -f'
alias dropcache='su -c "echo 3 > /proc/sys/vm/drop_caches"'
alias ntpdate='sudo ntpdate asia.pool.ntp.org'
alias su='sudo su -'
alias rm='remove'
function remove
    mv -f $argv ~/.Trash;
end

alias disDash='defaults write com.apple.dashboard mcx-disabled -boolean true;killall Dock'
alias openDash='defaults write com.apple.dashboard mcx-disabled -boolean false;killall Dock'
alias disSpolight='sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist;cd /System/Library/CoreServices/;sudo mv Search.Bundle Search.Bundle.hide;killall SystemUIServer'
alias openSpolight='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist;cd /System/Library/CoreServices/;sudo mv Search.Bundle.hide Search.Bundle'

#}}}
  
#alias for ssh# {{{
alias sshserver1='ssh -p7862 root@121.199.43.176'
alias sshserver2='ssh -p8726 ddosa@112.124.42.62'
alias sshserver3='ssh -p7862 root@218.244.144.242'
alias sshserver4='ssh -p7862 root@121.40.190.31'
alias sshserver5='ssh -p7862 root@120.24.219.108'
alias sshserver6='ssh -p7862 root@120.24.240.31'
alias sshdownload='ssh -p34529 root@110.76.40.33'
alias ssh115='ssh -p6957 root@123.57.151.115'
alias ssh26='ssh -p6957 root@123.56.152.26'
alias sshdp='ssh -p7862 root@124.95.160.85'
#alias ln68nds='sudo mount //192.168.2.68/ndsdata-release /mnt/ndsdata-release/'
#alias ln58grid='sshfs -o workaround=rename root@192.168.4.193:/home/share/QMMqAwQOuy.uucin.com /mnt/gis_data/'
#alias ln58nds='sshfs -o workaround=rename root@192.168.2.58:/home/nds_navi_data /mnt/ndsdata-release/'
#alias ln58s10='sshfs -o workaround=rename root@192.168.2.58:/home/s10_navi_data /mnt/s10-release/'
# }}}

#alias list#{{{

alias ll='ls -lF'
alias l.='ls -A'
#alias l.='ls -d .* --color=auto'
alias l='ls -CF'
alias s='ls -F'
alias j='ls -F'
alias lsj='ls -F'
alias jls='ls -F'
alias sl='ls -F'
alias lm='ls -Alh --color=auto'

#}}}

#environment{{{
set -x ANDROID_SDK_ROOT /usr/local/android-sdk
set -x JAVA_HOME /usr/lib/jvm/jdk-8u5
set -x SCALA_HOME /usr/local/scala-2.11.6/bin/
set -x BREW_HOME /usr/local/homebrew
set -x CLASSPATH . $JAVA_HOME/lib/tools.jar
set -x ANDROID_HOME /usr/local/android-sdk-linux/tools
set -x PATH $PATH $JAVA_HOME/bin ~/folder/util/mactools /usr/local/android-sdk-linux/platform-tools/ $ANDROID_HOME $SCALA_HOME $BREW_HOME/bin /usr/local/scala-2.11.6/bin
#}}}

