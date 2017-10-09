while true; do
    read -p "would you like me to start node-nowplaying-startup-test server on startup?" yn
    case $yn in
        [Yy]* ) echo "setting up launcDeamond...";
				cat com.liorhakim.node-nowplaying-startup-test-template.plist | awk -v P="$(pwd)" -v U="$USER" '{gsub(/pwd/,P,$0);{gsub(/user/,U,$0); print}' > com.liorhakim.node-nowplaying-startup-test.plist
				sudo cp com.liorhakim.node-nowplaying-startup-test.plist /Library/LaunchDaemons/com.liorhakim.node-nowplaying-startup-test.plist
				sudo chown root:wheel /Library/LaunchDaemons/com.liorhakim.node-nowplaying-startup-test.plist
				sudo launchctl load  /Library/LaunchDaemons/com.liorhakim.node-nowplaying-startup-test.plist
				dir=$(pwd);echo "setenv PATH $PATH:$dir:$dir/node_modules/nowplaying"|sudo tee -a /etc/launchd.conf
				echo "launch deamond loaded"
				break;;
        [Nn]* ) echo "bailing on autostart"
				break;;
        * ) echo "Please answer yes or no.";;
    esac
done
