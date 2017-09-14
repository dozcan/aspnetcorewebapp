FROM microsoft/aspnetcore:2.0.0
WORKDIR /webApp
COPY dist /webApp
COPY bin /wait-for-it.sh
RUN  chmod a+rwx ./wait-for-it.sh
EXPOSE 80/tcp
ENV WAITHOST=mysql WAITPORT=3306
ENTRYPOINT ./wait-for-it.sh $WAITHOST:$WAITPORT --timeout=0 \ && exec dotnet ExampleApp.dll