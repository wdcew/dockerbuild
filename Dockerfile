FROM runpod/kasm-desktop:1.0.0



ADD start.sh /
#RUN chmod +x /start.sh

CMD [ "sleep infinity" ]
