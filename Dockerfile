FROM microsoft/aspnetcore:2.0.0
COPY dist /webApp
COPY bin/wait-for-it  /webApp/wait-for-it.sh
WORKDIR /webApp
RUN  chmod +x ./wait-for-it.sh
EXPOSE 80/tcp
ENV WAITHOST=mysql WAITPORT=3306
ENTRYPOINT ./wait-for-it.sh $WAITHOST:$WAITPORT --timeout=0 \ && exec dotnet ExampleApp.dll