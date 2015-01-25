FROM concourse/busyboxplus:curl

# satisfy go crypto/x509
RUN cat /etc/ssl/certs/*.pem > /etc/ssl/certs/ca-certificates.crt

ADD cf /usr/bin/cf
ADD autopilot /usr/bin/autopilot
RUN cf install-plugin /usr/bin/autopilot

ADD built-check /opt/resource/check
ADD built-out /opt/resource/out
