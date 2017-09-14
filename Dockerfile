FROM microsoft/aspnetcore:2.0.0
WORKDIR /webApp
COPY dist /webApp
RUN mkdir Runner
COPY dist/wait-for-it ./Runner
EXPOSE 80/tcp
ENV WAITHOST=mysql WAITPORT=3306
ENTRYPOINT /Runner $WAITHOST:$WAITPORT --timeout=0 \ && exec dotnet ExampleApp.dll