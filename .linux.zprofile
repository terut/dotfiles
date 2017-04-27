# yousei gibusu
net_tools_deprecated_message () {
  echo -n 'net-tools コマンドはもう非推奨ですよ？おじさんなんじゃないですか？ '
}
arp () {
  net_tools_deprecated_message
  echo 'Use `ip n`'
}
ifconfig () {
  net_tools_deprecated_message
  echo 'Use `ip a`, `ip link`, `ip -s`'
}
iptunnel () {
  net_tools_deprecated_message
  echo 'Use `ip tunnel`'
}
iwconfig () {
  echo -n 'iwconfig コマンドはもう非推奨ですよ？おじさんなんじゃないですか？ '
  echo 'Use `iw`'
}
nameif () {
  net_tools_deprecated_message
  echo 'Use `ip link`, `ifrename`'
}
netstat () {
  net_tools_deprecated_message
  echo 'Use `ss`, `ip route` (for netstat -r), `ip -s link` (for netstat -i), `ip maddr` (for netstat -g)'
}
route () {
  net_tools_deprecated_message
  echo 'Use `ip r`'
}

timer() {
	local N=$1; shift
	(sleep $N && notify-send "Time's Up" "${*:-Bing}" --icon=face-wink) &
	echo "timer set for $N"
}
## flutter
if [ -e $HOME/.android-sdk ]; then
  export ANDROID_HOME="$HOME/.android-sdk"
  export PATH="$ANDROID_HOME/platform-tools:$PATH"
  export PATH="$ANDROID_HOME/tools:$PATH"
fi
