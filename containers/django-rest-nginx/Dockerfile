FROM alpine
ENV SOTOLITO_NGINX_VERSION=1.14.2-r4 \
    SUMMARY="SotolitoLabs django nginx Image" \
    DESCRIPTION="nginx image for the SotolitoOS django applications environment"

LABEL summary="$SUMMARY" \
      description="$DESCRIPTION" \
      io.k8s.description="$DESCRIPTION" \
      io.k8s.display-name="SotolitoOS nginx 1.14.2-r4" \
      io.openshift.expose-services="80:sotolito-nginx" \
      io.openshift.tags="web,sotolitoos,nginx" \
      name="sotolito/nginx" \
      version="1.14.2-r4" \
      usage="docker run -d -e -p 80:80 sotolitoos/nginx" \
      maintainer="Iván Chavero <ichavero@chavero.com.mx>"

RUN apk --no-cache update                                  && \
  apk upgrade                                              && \
  apk add nginx tzdata                                     && \
  cp /usr/share/zoneinfo/America/Chihuahua /etc/localtime  && \
  echo "America/Chihuahua" >/etc/timezone                  && \
  apk del tzdata                                           && \
  rm -rf /var/cache/apk                                    && \
  mkdir /run/nginx

COPY uwsgi_params /etc/nginx/uwsgi_params
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

cmd ["/usr/sbin/nginx", "-g", "daemon off;"]
