# Use a lightweight base image
FROM alpine:latest

# Install Dante SOCKS proxy server
RUN apk --no-cache add dante-server

# Copy the Dante configuration file
COPY danted.conf /etc/danted.conf

# Expose the SOCKS5 proxy port (default 1080)
EXPOSE 1080

# Run Dante in the foreground
CMD ["sockd", "-N"]