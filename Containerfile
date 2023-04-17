FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN energy_monitor_dashboard create-db
RUN energy_monitor_dashboard populate-db
RUN energy_monitor_dashboard add-user -u admin -p admin
EXPOSE 5000
CMD ["energy_monitor_dashboard", "run"]
