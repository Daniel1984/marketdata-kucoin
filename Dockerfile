# --- Stage 1: Build ---
FROM aciddaniel/zig:latest AS builder

# Copy build files
COPY build.zig build.zig.zon ./
COPY src ./src

# Build the application
# --seed 0 bypasses the shuffle panic
# -Dtarget=x86_64-linux-musl is REQUIRED for the 'scratch' image
RUN zig build \
  -Doptimize=ReleaseFast \
  -Dtarget=x86_64-linux-musl \
  --seed 0 \
  -Dcpu=x86_64_v3 \
  --summary all

# --- Stage 2: Run ---
FROM scratch

# Copy CA certificates for TLS connections
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

# Copy the binary
COPY --from=builder /build/zig-out/bin/marketdata_kucoin /marketdata_kucoin
ENTRYPOINT ["/marketdata_kucoin"]
