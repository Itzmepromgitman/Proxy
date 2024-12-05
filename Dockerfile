# Use a lightweight base image
FROM alpine:latest

# Install Dante SOCKS proxy server
RUN apk --no-cache add dante-server

# Copy the Dante configuration file
COPY danted.conf /etc/danted.conf

# Expose the SOCKS5 proxy port
EXPOSE 1080

# Run Dante in daemon mode with proper arguments
CMD ["sockd", "-f", "/etc/danted.conf", "-N", "1", "-D"]
