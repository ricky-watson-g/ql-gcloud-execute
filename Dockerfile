FROM alpine
RUN apk add --update python curl which bash
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin
COPY action.sh /tmp
RUN gcloud components install beta --quiet
RUN chmod +x /tmp/action.sh
ENTRYPOINT ["/tmp/action.sh"]
