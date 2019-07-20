#!/bin/bash
function run_command_as_root(){
COMMAND=$1;
if [[ $(id -u) -eq 0 ]];
then
    run_command $COMMAND;
elif command -v sudo;
then
    run_command "sudo $COMMAND";
elif command -v su;
then
    run_commmand "su -c $COMMAND";
else
    print "Error: unable to run command $COMMAND as root";
    exit 1;
fi
}
