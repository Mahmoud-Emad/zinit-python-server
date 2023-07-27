# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Install socat to enable IPv6 binding
RUN apt-get update && apt-get install -y python3 python3-pip openssl openssh-server wget vim && apt-get clean

# Install zinit 
RUN wget -O /sbin/zinit https://github.com/threefoldtech/zinit/releases/download/v0.2.10/zinit && \
    chmod +x /sbin/zinit

# Copy scripts
COPY ./scripts/ /scripts/
COPY ./zinit/ /etc/zinit/
RUN chmod +x /scripts/*.sh

# Zinit entrypoint
CMD ["/sbin/zinit", "init"]

# Expose the ports for both IPv4 and IPv6
EXPOSE 8000


