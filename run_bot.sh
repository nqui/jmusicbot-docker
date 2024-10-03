#!/bin/bash

# Set the default version to latest
VER_DEFAULT=$(curl --silent "https://api.github.com/repos/$BOT_REPO_FORK/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')

# If the ENV is not explicitly set, use the sourced ENV from the Dockerfile
if [ $BOT_VERSION == "latest" ]; then
  BOT_VERSION=$VER_DEFAULT
fi

echo -e "Downloading JMusicBot $BOT_VERSION from $BOT_REPO_FORK"
if [ ! -f JMusicBot-$BOT_VERSION.jar ]; then	
  wget https://github.com/$BOT_REPO_FORK/releases/download/$BOT_VERSION/JMusicBot-$BOT_VERSION.jar
fi

echo -e "Starting JMusicBot $BOT_VERSION"
java -Dnogui=true -Dconfig=/config/config.txt -jar JMusicBot-$BOT_VERSION.jar 
