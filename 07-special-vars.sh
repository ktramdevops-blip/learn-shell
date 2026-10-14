#!/bin/bash
echo "All the args pass to the script: $@ "
echo "Number of args passed to the script : $#"
echo "first variable passed : $1"
echo "script name: $0"
echo "Realpath: $(realpath $0)"
export USER=$(whoami)
echo "who is running the current script :$USER"
echo "Current script is running as: $(whoami)"
echo "Directory of the current script :$PWD"
echo "Home Directory of the currrent user:$HOME"
echo "PID of the current user : $$"
sleep 10 &
echo "PID of the command running in background : $!"
wait $! # scripts waits until $! command complete
echo "Line number : $LINENO"
echo "previous command exit status :$?"
echo "Total time execute for this script: $SECONDS"