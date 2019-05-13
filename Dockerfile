FROM mcr.microsoft.com/dotnet/core/runtime:3.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /src
COPY ["CoreWorker.csproj", "./"]
COPY . .
WORKDIR /src
RUN dotnet build "CoreWorker.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "CoreWorker.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "CoreWorker.dll"]
