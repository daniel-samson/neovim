#!/bin/bash
function run_command_as_root(){
COMMAND=$1;
if [[ $(id -u) -eq 0 ]];
then
    echo $COMMAND;
    $COMMAND
elif command -v sudo;
then
    echo "sudo $COMMAND";
    sudo $COMMAND;
elif command -v su;
then
    echo "su -c \"$COMMAND\"";
    su -c "$COMMAND";
else
    print "Error: unable to run command $COMMAND as root";
    exit 1;
fi
}
