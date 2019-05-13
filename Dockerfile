# Configure the run time environment
FROM mcr.microsoft.com/dotnet/core/runtime:3.0 AS base
WORKDIR /app

# Configure the build process
FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /src
COPY . .

# Trigger the restore/build of the project
RUN dotnet build "CoreWorker.csproj" -c Release -o /app

# With the build completed, publish the application
FROM build AS publish
RUN dotnet publish "CoreWorker.csproj" -c Release -o /app

# Now execute the worker using dotnet runtimes
FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "CoreWorker.dll"]
