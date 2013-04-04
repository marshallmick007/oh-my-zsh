
#!/bin/bash

# PURPOSE: Change the EDITOR variable based on file extension
# see: http://brettterpstra.com/2013/03/30/a-multi-purpose-editor-variable/

case "$1" in
	*_EDITMSG|*MERGE_MSG|*_TAGMSG )
		/usr/local/bin/mvim "$1"
		;;
	*.md )
		/usr/local/bin/mvim "$1"
		;;
	*.txt )
		/usr/local/bin/mvim "$1"
		;;
	* )
		/usr/local/bin/mvim "$1"
		;;
esac
