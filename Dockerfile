FROM alpine:3.21

RUN apk add --no-cache \
    bash \
    sane-backends \
    imagemagick \
    bc \
    curl \
    apprise

# Local OCR mode — uncomment to enable (adds ~250 MB):
# RUN apk add --no-cache tesseract-ocr tesseract-ocr-data-nld ghostscript python3 py3-pip \
#     && pip install --no-cache-dir ocrmypdf

COPY scan scan-button-poll /usr/local/bin/
RUN chmod +x /usr/local/bin/scan /usr/local/bin/scan-button-poll

CMD ["scan-button-poll"]
