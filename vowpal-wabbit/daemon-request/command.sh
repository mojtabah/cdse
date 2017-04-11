#!/bin/bash
echo "Requesting single response from the server"
echo " abc-example| a b c" | netcat -c localhost 26542

echo "Requesting single response from the server"
echo " xyz-example| x y z" | netcat -c localhost 26542

echo "Requesting multiple responses from the server"
echo '| a c
| b c
| y x
| z y x' | netcat -c localhost 26542

pkill -9 -f 'vw.*--port 26542'
