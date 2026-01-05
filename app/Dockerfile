# Usa l'immagine runtime ASP.NET 8 come base per eseguire l'app
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
# Imposta la cartella di lavoro all'interno del container
WORKDIR /app
# Espone la porta 8080 per permettere l'accesso HTTP
EXPOSE 8080
# Imposta la porta su cui ASP.NET Core deve ascoltare  
ENV ASPNETCORE_URLS=http://+:8080
# Usa l'immagine SDK .NET 8 per compilare e pubblicare l'app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
# Imposta la cartella di lavoro per la fase di build
WORKDIR /src
# Copia tutto il contenuto della cartella corrente nel container
COPY . .
# Compila e pubblica l'app in modalità Release (ottimizzata per la produzione) nella cartella /out
RUN dotnet publish -c Release -o /out

# Crea l'immagine finale partendo dall'immagine runtime
FROM base AS final
# Imposta la cartella di lavoro dell'immagine finale
WORKDIR /app
# Copia i file pubblicati dalla fase di build
COPY --from=build /out .
# Avvia l'applicazione .NET pubblicata
ENTRYPOINT ["dotnet", "app.dll"]