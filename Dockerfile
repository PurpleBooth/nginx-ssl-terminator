FROM nginx
EXPOSE 80
EXPOSE 443

COPY nginx.conf /etc/nginx/nginx.conf
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD /run.sh