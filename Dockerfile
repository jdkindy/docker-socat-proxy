FROM centos:7

# Install socat and allow privileged port bindings.
RUN yum install -y socat && yum clean all && setcap cap_net_bind_service=+ep /usr/bin/socat
ADD run-proxy.sh /usr/local/bin

# These environment vars MUST be set or the container will fail to run
ENV LSTN_PORT 80
ENV DST_PORT 80
ENV DST_HOST wfu.edu

# Start the socat tunnel
CMD /usr/local/bin/run-proxy.sh
