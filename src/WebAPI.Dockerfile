FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443
EXPOSE 9090

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["myWebApi/myWebApi.csproj", "./myWebApi/"]

RUN dotnet restore "./myWebApi/myWebApi.csproj"
COPY ["myWebApi/.", "./myWebApi/"]

RUN dotnet build "./myWebApi/myWebApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "./myWebApi/myWebApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app

COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "myWebApi.dll"]