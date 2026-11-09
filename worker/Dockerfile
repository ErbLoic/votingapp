FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY Worker.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/runtime:7.0
WORKDIR /app
COPY --from=build /app .
COPY docker-entrypoint.sh .
RUN chmod +x docker-entrypoint.sh && useradd -m appuser
USER appuser
ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["dotnet", "Worker.dll"]
