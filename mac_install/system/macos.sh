#! /bin/bash
set -eux

EXEPATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

# !!! More configs here https://github.com/ulwlu/dotfiles/blob/master/system/macos.sh !!!

## ----------------------------------------
##  System Preferences
## ----------------------------------------
General() {
  # ========== Click in the scroll bar to ==========
  #  Jump to the spot that's clicked
  defaults write -globalDomain AppleScrollerPagingBehavior -bool true

  # ========== Ask to keep changes when closing documents ==========
  defaults write .GlobalPreferences NSCloseAlwaysConfirmsChanges -bool true

  # ========== Close windows when quitting an app ==========
  # - Checked
  defaults write .GlobalPreferences NSQuitAlwaysKeepsWindows -bool false
  # - Unchecked
  # defaults write .GlobalPreferences NSQuitAlwaysKeepsWindows -bool true


  # ========== Recent items ==========
  # - None
  # - 5
  # - 10
  # - 15
  # @string: choose preferred item.
  osascript -e "
  tell application \"System Preferences\"
    activate
    set current pane to pane \"com.apple.preference.general\"
  end tell
  tell application \"System Events\"
    tell application process \"System Preferences\"
      repeat while not (window 1 exists)
      end repeat
      tell window 1
        tell pop up button 4
          delay 1
          click
          tell menu 1
            click menu item \"None\"
          end tell
        end tell
      end tell
    end tell
  end tell
  "
}

Dock() {
  # ========== Size ==========
  # @int: size
  defaults write com.apple.dock tilesize -int 56

  # ========== Minimize windows using ==========
  # - Scale effect
  defaults write com.apple.dock mineffect -string "scale"

  # ========== Minimize windows into application icon ==========
  defaults write com.apple.dock minimize-to-application -bool true
}

Keyboard() {
  # max 15
  defaults write -g InitialKeyRepeat -float 15.0
  defaults write NSGlobalDomain InitialKeyRepeat -float 15.0

  # max 2
  defaults write NSGlobalDomain KeyRepeat -float 2.0
  defaults write -g KeyRepeat -float 2.0

  # ignore long button press
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
}


ExtraSettings() {
  # ========== Remove all apps from Dock ==========
  defaults write com.apple.dock persistent-apps -array

  # ========== Add empty speaces to Dock ==========
  for n in {1..5}; do
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}';
  done

  # ========== Speed up Window Resize Animation ==========
  defaults write -g NSWindowResizeTime -float 0.001

  # ========== Search current directory when exec search in Finder ==========
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

  # ========== Disable Animation in Finder ==========
  defaults write com.apple.finder DisableAllAnimations -bool true

  # ========== Dock No Bounce ==========
  defaults write com.apple.dock no-bouncing -bool TRUE

  # ========== Disable AppStore Notifacations ==========
  defaults write com.apple.appstored LastUpdateNotification -date "2029-12-12 12:00:00 +0000"
}

#General
Dock
Keyboard
ExtraSettings

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Kill affected apps
for app in "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" > /dev/null 2>&1
done
#ApplePressAndHoldEnabled
