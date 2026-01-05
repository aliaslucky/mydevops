/* Questo file è pensato per definire output di Terraform. 
Per ora non serve: non c’è nulla di necesasrio da esportare come output.
Gli output servono solo per:
• mostrare informazioni utili dopo l’apply
• assare valori ad altre pipeline
• far consumare dati ad altri moduli Terraform
• esporre endpoint, IP, ID di risorse, ecc.
Nel nostro caso:
• l’endpoint è sempre http://localhost:8080
• il nome del container è noto (devops_app)
• l’immagine è definita in variables

Quando si passerà ad Azure, si aggiungeranno output reali
*/