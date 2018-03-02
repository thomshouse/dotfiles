# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

function pushkey() {
	if [ -z "$1" ]; then
		echo "Please include a server host domain or IP address to push your public key to.\n";
		echo "Examples:\n  pushkey example.com\n  pushkey username@example.com\n";
	else
		ssh -o PreferredAuthentications=publickey -i ~/.ssh/id_rsa "$1" true >/dev/null 2>&1
		if [ $? == 0 ]; then
			echo "Public key is already added to this server."
		else
			cat ~/.ssh/id_rsa.pub | ssh "$1" 'cat >> .ssh/authorized_keys && chmod 600 .ssh/authorized_keys' 2>/dev/null
			if [ $? == 0 ]; then
				echo "Public key has been added to this server.";
			else
				echo "ERROR: Public key could not be added to server.";
				return 1;
			fi
		fi
	fi
}
