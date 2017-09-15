FROM microsoft/aspnetcore:2.0.0
COPY dist /webApp
COPY sh /webApp/sh
RUN chmod +x /webApp/sh
WORKDIR /webApp
RUN chmod +x ./sh/wait-for-it.sh
EXPOSE 80/tcp
ENV WAITHOST=mysql WAITPORT=3306
ENTRYPOINT ./sh/wait-for-it.sh $WAITHOST:$WAITPORT -s-timeout=0 \ && exec dotnet ExampleApp.dll