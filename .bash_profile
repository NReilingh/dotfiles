export PATH="/usr/local/sbin:$PATH"
alias ll='ls -la'
if [ -d "/Applications/VMware Fusion.app/Contents/Library" ]; then
	export PATH=$PATH:"/Applications/VMware Fusion.app/Contents/Library"
fi
