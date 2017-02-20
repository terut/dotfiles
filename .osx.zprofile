#export PATH=$PATH:/usr/local/mysql/bin
export PATH=/usr/local/sbin:/usr/local/bin:$PATH

## react-native-cli
if [ -e $HOME/Library/Android/sdk ]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH="$PATH:$ANDROID_HOME/tools"
  export PATH="$PATH:$ANDROID_HOME/platform-tools"
fi
