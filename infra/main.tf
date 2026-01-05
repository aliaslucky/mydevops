# Configura Terraform
terraform {
    # Elenca i provider necessari per questo progetto
    required_providers {
        # Configura il provider Docker, usato per gestire container e immagini locali
        docker = {
            # Indica la sorgente ufficiale del provider Docker
            source = "kreuzwerker/docker"
            # Specifica la versione del provider da utilizzare
            version = "~> 3.0"
        }
    }
}
# Provider terraform: "connettori" che permettono di gestire risorse esterne.
# Qui abilitiamo il provider Docker, così Terraform può creare rete, immagine e container locali.
# Inizializza il provider Docker per permettere a Terraform di interagire con Docker locale
provider "docker" {
    # Questo esempio usa  Docker locale. Un docker remoto richiede parametri aggiuntivi, es:
    # host = "tcp://IP_DEL_SERVER:2375"
}


# Le resource qui realizzano l'equivalente di ciò che si farebbe in docker-compose.yml: 
# configura immagine, container, rete, ecc.

# Definisce l'immagine Docker da utilizzare
resource "docker_image" "app_image" {
    name = var.image_name
    build {
        context    = "${path.module}/../app"
        dockerfile = "${path.module}/../app/Dockerfile"
  }
}

# Crea rete Docker dedicata per isolare l'applicazione
resource "docker_network" "app_net" {
    # Nome della rete Docker che verrà creata
    name = "app_network"
}

# Crea e avvia un container basato sull'immagine definita sopra
resource "docker_container" "app_container" {
    # Nome del container
    name = "mydevops_container"
    # Immagine da utilizzare per creare il container
    image = docker_image.app_image.name
    # Collega il container alla rete creata in precedenza
    networks_advanced {
        # Nome della rete 
        name = docker_network.app_net.name
    }
    # Espone la porta interna del container verso l'esterno
    ports {
        # Porta interna dell'applicazione (quella esposta dal Dockerfile)
        internal = 8080
        # Porta esterna accessibile dalla macchina host
        external = 8080
    }
}