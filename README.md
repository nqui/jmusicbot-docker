# JMusicBot Docker
[![Release](https://img.shields.io/github/release/jagrosh/MusicBot?color=g&style=for-the-badge)](https://github.com/jagrosh/MusicBot/releases/latest)
![Supports amd64 Architecture](https://img.shields.io/badge/amd64-yes-blueviolet.svg?style=for-the-badge)
![Supports arm64 Architecture](https://img.shields.io/badge/arm64-yes-blueviolet.svg?style=for-the-badge)

A simple Docker container for [JMusicBot](https://github.com/jagrosh/MusicBot). The container will start up, then download JMusicBot from the repository (or a fork) and run it.

## Usage
- Place your **config.txt**, **Playlists** folder, and **serversettings.json** file (if you have one) in `/your/path/to/config`. This directory will be shared with the container.
  > Refer to the documentaion on how to [configure the bot](https://jmusicbot.com/setup/#3-configure-the-bot)
- You can specify a JMusicBot version using the environment variable `BOT_VERSION`. By default the latest version will be downloaded so you don't have to include the value if you want to use latest.
  > The version numbers you can use correspond to the [releases](https://github.com/jagrosh/MusicBot/releases)
- You can specify a JMusicBot fork using the environment variable `BOT_REPO_FORK`. By default `jagrosh/MusicBot` is used.
  > The format of this should be `user/repo`. 

### Docker examples
- Using docker cli
```bash
docker run -dit \  
  --name=jmusicbot \
  -v /your/path/to/config:/config \
  --restart=unless-stopped \
  ghcr.io/yojoshb/jmusicbot-docker
```

- Using docker compose
```bash
---
services:
  jmusicbot:
    image: ghcr.io/nqui/jmusicbot-docker
    container_name: jmusicbot
    environment:
      - BOT_VERSION=0.3.9 # You can omit this environment variable if you just want to run the latest version
      - BOT_REPO_FORK=someuser/MusicBot # You can omit this environment variable if you just want to run jagrosh/MusicBot
    volumes:
      - /your/path/to/config:/config
    restart: unless-stopped
```

---

#### Debugging
- If you need to access the container you can hop into it and get a shell using:
```bash
docker exec -it jmusicbot /bin/bash
```

- Or read the logs:
```bash
docker logs jmusicbot
```
