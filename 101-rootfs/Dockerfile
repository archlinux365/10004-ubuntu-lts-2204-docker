FROM debian:stable as build

WORKDIR /docker-build

ADD . .

RUN ./build.sh

FROM scratch

COPY --from=build /rootfs /

ADD sources.list /etc/apt/sources.list

RUN apt update -y

CMD ["sh"]
