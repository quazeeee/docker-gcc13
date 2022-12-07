FROM gcc:latest
RUN mkdir gcc && cd gcc && git clone git://gcc.gnu.org/git/gcc.git
RUN cd gcc/gcc && git checkout basepoints/gcc-13
RUN apt-get update && apt install -y libmpc-dev libgmp3-dev libmpfr-dev texinfo flex bison build-essential
WORKDIR "/gcc/gcc"
RUN mkdir objdir && cd objdir && ../configure --disable-multilib --disable-bootstrap
WORKDIR "/gcc/gcc/objdir"
RUN make -j4
RUN mkdir /gcc13 && make DESTDIR=/gcc13 install
