FROM tomcat:8-jre8

ENV WAR_URL http://oe58q5lw3.bkt.clouddn.com/s/struts2/struts2/s2-046.war

WORKDIR /tmp

RUN set -ex \
    && rm -rf /usr/local/tomcat/webapps/* \
    && chmod a+x /usr/local/tomcat/bin/*.sh \
    && wget -qO /usr/local/tomcat/webapps/ROOT.war $WAR_URL
    # && sed -ri 's#               pattern=\"%h %l %u %t \&quot;%r\&quot; %s %b\" \/>#               pattern=\"combined\" resolveHosts=\"false\"\/>#g' /usr/local/tomcat/conf/server.xml
    # && sed -ri 's#        <Valve className=\"org.apache.catalina.valves.AccessLogValve\" directory=\"logs\"#        <Valve className=\"org.apache.catalina.valves.AccessLogValve\" directory=\"logs\" prefix=\"access.\" suffix=\".log\"#g' /usr/local/tomcat/conf/server.xml

COPY ./test/server.xml /usr/local/tomcat/conf/server.xml

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
