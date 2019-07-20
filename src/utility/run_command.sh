#!/bin/bash
function run_command(){
COMMAND=$1;
echo " "
echo "Running command: $COMMAND";
$COMMAND
echo " "
}
