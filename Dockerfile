# Use a lightweight base image
FROM alpine:latest

# Install Dante SOCKS proxy server
RUN apk --no-cache add dante-server

# Create a non-root user
RUN adduser -D socksproxy

# Copy the Dante configuration file
COPY danted.conf /etc/danted.conf

# Change ownership of the configuration file
RUN chown socksproxy:socksproxy /etc/danted.conf

# Switch to the non-root user
USER socksproxy

# Expose the SOCKS5 proxy port
EXPOSE 1080

# Run Dante in daemon mode
CMD ["sockd", "-f", "/etc/danted.conf", "-N", "1", "-D"]
