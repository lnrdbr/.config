which -s brew
if [[ $? != 0 ]] ; then
# Install Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo >> /Users/leonard/.zprofile
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/leonard/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
	brew update
fi

brew bundle check || brew bundle install
d=$(brew --prefix zathura)/lib/zathura ; mkdir -p $d ; for n in cb djvu pdf-mupdf pdf-poppler ps ; do p=$(brew --prefix zathura-$n)/lib$n.dylib ; [[ -f $p ]] && ln -s $p $d ; done
ln -s ~/.config/zsh/.zshrc ~/.zshrc
bob use nightly


defaults write com.apple.controlcenter AutoHideMenuBarOption -int 2
defaults write -g AppleAccentColor -int 5
defaults write -g AppleIconAppearanceTheme -string ClearDark
defaults write -g AppleInterfaceStyle -string Dark


defaults write com.apple.dock tilesize -int 30
defaults write com.apple.dock largesize -int 50
defaults write com.apple.dock magnification -int 1
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock autohide -bool true

killall SystemUIServer                                       
killall Dock
killall Finder
