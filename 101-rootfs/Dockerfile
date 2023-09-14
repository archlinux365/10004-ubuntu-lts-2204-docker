FROM debian:stable as build

WORKDIR /docker-build

ADD . .

RUN ./build.sh

FROM scratch

COPY --from=build /jammy-rootfs /

CMD ["sh"]
