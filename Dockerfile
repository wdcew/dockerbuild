FROM runpod/kasm-desktop:1.0.0



ADD start.sh /
<<<<<<< HEAD
#RUN chmod +x /start.sh
=======
RUN chmod +x /start.sh
>>>>>>> f7555a993634a2dbeaf097f4e8da12091cfa71f4

CMD [ "sleep infinity" ]
