
#!/bin/bash

# PURPOSE: Change the EDITOR variable based on file extension
# see: http://brettterpstra.com/2013/03/30/a-multi-purpose-editor-variable/

case "$1" in
	*_EDITMSG|*MERGE_MSG|*_TAGMSG )
		/usr/bin/vim "$1"
		;;
	*.md )
		/usr/bin/vim "$1"
		;;
	*.txt )
		/usr/bin/vim "$1"
		;;
	* )
		/usr/bin/vim "$1"
		;;
esac
