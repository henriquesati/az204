az <grupo> <substantivo> <verbo> --flags
az acr create --name --resourgr-group --sku Basic


az acr build --registry meuacr --image pedrogatinhosimag:gatinhos

az acr build --registry meuacr --image pedrogatinhos:gat
 https://github.com/user/repo.git#main:src/api

<------------------------------------------------------------------------------------->

az acr task create 
--registry meuacr
--name pedrogatinhos:vv
--context https://github.com/user/repo.git
--file Dockerfile
--branch main

az acr task create
--commit-trigger-enabled: true
--pull-request-trigger-enabled: true
(
    --context https://mystorage.blob.core.windows.net/builds/context.zip
    --context https://...zip?<sas>
)
    
! --file é sempre relativo ao context root

<------------------------------------------------------------------------------------->

az acr import 
--name gatinhos_acr
--source url_gatinhos
--image app:v1
--username <user> --password <>

<------------------------------------------------------------------------------------->

az acr replicaiton create
--registry gatinhos_acr
--location brasil_gatinhos

az acr replication update \
--registry gatinhos_acr
--name brasilsouthbatinhos
--region-endpoint-enabled false


az acr replication list --query "[?tags.env=='prod']"

<------------------------------------------------------------------------------------->

az acr repositoy delete 
--name gatinhos_dir
--repository bye_gatinhos

az acr manifest list-metadata \
    --registry meuacr \
    --name api


az aks update --attach-acr meuacr