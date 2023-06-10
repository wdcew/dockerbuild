FROM saracenrhue/deepfacelab

ADD start.sh /
RUN chmod +x /start.sh

CMD [ "/start.sh" ]
