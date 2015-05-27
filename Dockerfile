# ffmpeg-nodejs
#
# FFMPEG-VERSION               2.6.3-1
# NODEJS-VERSION			   0.10.38
#
# From https://trac.ffmpeg.org/wiki/CompilationGuide/Centos
# From https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
#
#
FROM          centos:centos6
MAINTAINER    Raman Nanda <Raman148@gmail.com>


ENV           FFMPEG_VERSION  2.6.3
ENV           MPLAYER_VERSION 1.1.1
ENV           YASM_VERSION    1.3.0
ENV           OGG_VERSION     1.3.2
ENV           VORBIS_VERSION  1.3.4
ENV           LAME_VERSION    3.99.5
ENV           FAAC_VERSION    1.28
ENV           XVID_VERSION    1.3.3
ENV           FDKAAC_VERSION  0.1.3
ENV           SRC             /usr/local
ENV           LD_LIBRARY_PATH ${SRC}/lib
ENV           PKG_CONFIG_PATH ${SRC}/lib/pkgconfig
ENV			  NODEJS_VERSION  0.10.38

COPY          run.sh /tmp/run.sh

# See https://github.com/Raman148/ffmpeg-nodejs/blob/master/run.sh
RUN           bash /tmp/run.sh

# Let's make sure the app built correctly
RUN           ffmpeg -buildconf 

# Make sure Node.js is installed
RUN           node -v

WORKDIR /tmp/workdir

CMD           ["--help"]
ENTRYPOINT    ["ffmpeg"]
