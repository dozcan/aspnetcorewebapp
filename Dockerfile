FROM microsoft/aspnetcore:2.0.0
COPY dist /webApp
COPY sh /webApp/sh
WORKDIR /webApp
RUN chmod x /sh
EXPOSE 80/tcp
ENV WAITHOST=mysql WAITPORT=3306
ENTRYPOINT /sh $WAITHOST:$WAITPORT --timeout=0 \ && exec dotnet ExampleApp.dll