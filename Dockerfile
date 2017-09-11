FROM microsoft/aspnetcore:2.0.0
COPY dist /webApp
WORKDIR /webApp
EXPOSE 80/tcp
CMD["dotnet","webApp.dll"]