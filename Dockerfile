FROM wordpress

RUN apt-get update

# MSMTPとvimをインストール
RUN apt-get install -y msmtp msmtp-mta vim

# MSMTPの設定ファイルを読ませる
COPY ./msmtprc /etc/msmtprc
# パーミッション設定
RUN chown www-data:www-data /etc/msmtprc
RUN chmod 600 /etc/msmtprc

# php.iniを読み込ませる
COPY ./php.ini /usr/local/etc/php
