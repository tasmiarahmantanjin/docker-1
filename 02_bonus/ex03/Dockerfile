#Basic website contanarization

FROM httpd:2.4

LABEL trahman="trahman@student.hive.fi"

COPY ./public-html/ /usr/local/apache2/htdocs/


# How to build it?
# git clone https://github.com/tasmiarahmantanjin/my_portfolio_website.git
# docker build -t ex03 .

# How to run it?
# docker run --rm -d -p 8080:80  ex03

# How to test it?
# Visit http://192.168.99.100:8080 and you will see It works!

# Link: https://hub.docker.com/_/httpd