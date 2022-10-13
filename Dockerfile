FROM phusion/passenger-ruby27

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

RUN rm -f /etc/service/nginx/down

# Default directory
ENV INSTALL_PATH /home/app/webapp
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY --chown=app:app blog $INSTALL_PATH

RUN rm /etc/nginx/sites-enabled/default

ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

RUN bundle install

