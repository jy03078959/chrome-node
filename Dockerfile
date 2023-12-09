FROM jayfong/centos-nodejs16:latest
LABEL snap.com="nuoyi.wang@kayouyou.cn"
RUN echo -e "[google-chrome]\nname=google-chrome - 64-bit\nbaseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64\nenabled=1\ngpgcheck=1\ngpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub" >> /etc/yum.repos.d/google-chrome.repo \
  && yum -y install google-chrome-stable --nogpgcheck \
  && yum -y groupinstall Fonts
RUN mkdir /usr/share/fonts/chinese \
  && wget -O /usr/share/fonts/chinese/PingFang.ttc https://godspen.oss-cn-shanghai.aliyuncs.com/aaaa.ttc \
  && fc-cache -fv \
  && echo 'fc-list:::::::::' \
  && fc-list :lang=zh
