FROM microsoft/aspnetcore:2.0.0
COPY dist /webApp
COPY bin  /webApp/wait_for_it.sh
RUN  chmod 777 /webApp/wait_for_it.sh
WORKDIR /webApp
EXPOSE 80/tcp
ENV WAITHOST=mysql WAITPORT=3306
ENTRYPOINT /webApp/wait_for_it.sh $WAITHOST:$WAITPORT --timeout=0 \ && exec dotnet ExampleApp.dll