# Esecuzione locale con Docker e Terraform

# 1. Costruire l’immagine Docker
# Crea l’immagine in locale:
docker build -t ghcr.io/mydevops:latest ./app
# Verifica che l’immagine esista:
docker images

# 2. (Opzionale) Test manuale dell’immagine
# Avvia l’immagine manualmente:
docker run -p 8080:8080 ghcr.io/mydevops:latest
# Verificare l'endpoint in http://localhost:8080

# 3. Terraform crea la rete, il container, lo collega alla rete e mappa le porte.
terraform init
terraform plan
terraform apply

# 4. Verifica finale http://localhost:8080

# 7. Pulizia (opzionale)
terraform destroy