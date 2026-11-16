# HomeBox for Railway: the official image, pinned by version and digest.
# Bump the tag and digest together, and add a CHANGELOG.md entry.
FROM ghcr.io/sysadminsmedia/homebox:0.27.1@sha256:9d0b64776c694f018c0ca06faf52105a33ca376024f46bb58e6ab0e2b728bb61

# Defaults for Railway. Any of them can be overridden with a service variable.
ENV HBOX_MODE=production \
    HBOX_LOG_FORMAT=json \
    HBOX_LOG_LEVEL=info \
    HBOX_OPTIONS_ALLOW_ANALYTICS=false \
    HBOX_OPTIONS_TRUST_PROXY=true \
    HBOX_WEB_MAX_UPLOAD_SIZE=10 \
    TZ=Etc/UTC

COPY railway-start.sh /railway-start.sh
RUN chmod 0755 /railway-start.sh

EXPOSE 7745
ENTRYPOINT ["/railway-start.sh"]
