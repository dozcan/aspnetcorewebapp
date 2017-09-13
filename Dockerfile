FROM microsoft/aspnetcore:2.0.0
COPY dist /webApp
COPY ./node_modules/wait_for_it.sh/bin/wait_for_it /webApp/wait_for_it.sh
RUN chmod +x /webApp/wait-for-it.sh
WORKDIR /webApp
EXPOSE 80/tcp
ENV WAITHOST=mysql WAITPORT=3306
ENTRYPOINT ./wait-for-it.sh $WAITHOST:$WAITPORT --timeout=0 \ && exec dotnet ExampleApp.dll