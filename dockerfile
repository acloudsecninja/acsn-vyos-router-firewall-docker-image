# Use the official VyOS image
FROM vyos/vyos-build:current


# Create a new user with a valid UID if it doesn't already exist
RUN if ! id "vyos_bld" &>/dev/null; then \
        useradd -u 1001 -m vyos_bld; \
    fi
    
# Install lighttpd for web management
RUN apt-get update && \
    apt-get install -y lighttpd && \
    ln -s /var/run/lighttpd.sock /tmp/lighttpd.sock

# Set the working directory
WORKDIR /config

# Start VyOS with a shell
CMD ["/bin/bash"]
