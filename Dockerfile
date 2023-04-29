FROM ubuntu:latest

# Install packages
RUN apt-get update && \
    apt-get install -y telnet openssh-server sudo && \
    rm -rf /var/lib/apt/lists/*

# Copy entrypoint, ssh-telnet, cml_breakout, config.yaml
COPY ["entrypoint.sh", "ssh-telnet.sh", "config.yaml", "breakout-linux-amd64", "createusers.sh", "end.sh", "/"]
RUN chmod +x /entrypoint.sh /ssh-telnet.sh /breakout-linux-amd64 /createusers.sh /end.sh
RUN mkdir /run/sshd

# Add user accounts
RUN /createusers.sh
RUN useradd -m docker && \
    echo "docker:docker" | chpasswd && \
    adduser docker sudo

# Configure SSH server
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config && \
    echo 'ForceCommand /ssh-telnet.sh' >> /etc/ssh/sshd_config

# Expose ports
EXPOSE 22
EXPOSE 8080

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
