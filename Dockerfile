# syntax=docker/dockerfile:1

FROM oraclelinux:8
# https://docs.oracle.com/cd/E97665_01/html/rpm_81_installation_12c/GUID-E462932A-723A-4B10-9F28-A68AE9068901.htm#Create-an-Oracle-User-Account
RUN groupadd oracle
RUN groupadd oinstall
RUN groupadd dba
RUN useradd -m -g oinstall -G dba oracle -d /home/oracle
RUN echo "oracle:oracle" | chpasswd
RUN mkdir -p /u01/app/oracle
RUN chown -R oracle:oinstall /u01/app
RUN chmod -R 775 /u01/app
RUN mkdir /home/oracle/rpm
WORKDIR /home/oracle/rpm
COPY rpm/* .
USER oracle:oinstall
EXPOSE 1521
CMD ["/bin/bash"]
