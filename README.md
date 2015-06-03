FFMPEG/Nodejs for Docker on Centos6
============================

Forked from jrottenberg/ffmpeg

This repo has a Dockerfile to create a Docker image wth FFMPEG and Nodejs. It compiles FFMPEG from sources following instructions from the [Centos Compilation Guide](https://trac.ffmpeg.org/wiki/CompilationGuide/Centos) and installs Node.js from [Joyent/Node Installation Guide](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#enterprise-linux-and-fedora)

You can install the latest build of this image by running `docker pull raman148/ffmpeg-node`.

Test
----

```
$ docker run raman148/ffmpeg-node ffmpeg
ffmpeg version 2.6.3 Copyright (c) 2000-2015 the FFmpeg developers
  built with gcc 4.4.7 (GCC) 20120313 (Red Hat 4.4.7-11)
  configuration: --prefix=/usr/local --extra-cflags=-I/usr/local/include --extra-ldflags=-L/usr/local/lib --bindir=/usr/local/bin --extra-libs=-ldl --enable-version3 --enable-libfaac --enable-libmp3lame --enable-libx264 --enable-libxvid --enable-gpl --enable-postproc --enable-nonfree --enable-avresample --enable-libfdk_aac --disable-debug --enable-small --enable-openssl --enable-libx265 --enable-libopus --enable-libvorbis --enable-libvpx
  libavutil      54. 20.100 / 54. 20.100
  libavcodec     56. 26.100 / 56. 26.100
  libavformat    56. 25.101 / 56. 25.101
  libavdevice    56.  4.100 / 56.  4.100
  libavfilter     5. 11.102 /  5. 11.102
  libavresample   2.  1.  0 /  2.  1.  0
  libswscale      3.  1.101 /  3.  1.101
  libswresample   1.  1.100 /  1.  1.100
  libpostproc    53.  3.100 / 53.  3.100
Hyper fast Audio and Video encoder
[...]
```

Capture output from the container to the host running the command

```
 docker run raman148/ffmpeg-node ffmpeg \
            -i http://url/to/media.mp4 \
            -stats \
            $ffmpeg_options    -   > out.mp4
```

### Example

```
 docker run raman148/ffmpeg-node ffmpeg -stats  \
        -i http://archive.org/download/thethreeagesbusterkeaton/Buster.Keaton.The.Three.Ages.ogv \
        -loop 0  \
        -final_delay 500 -c:v gif -f gif -ss 00:49:42 -t 5 - > trow_ball.gif
```

See what's inside the beast
---------------------------

```
$ docker run -ti raman148/ffmpeg-node bash
bash-4.1#
```
