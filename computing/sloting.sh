Por padrão clona a config do slot de produção. Pra clonar de outro slot: --configuration-source <nome-do-slot>

az webapp deployment slot swap
--resource-group rg
--name inventory_api_gatinhos
--slot staging
--target-slot production

az webapp deployment slot swap \
    --resource-group rg \
    --name inventory-api \
    --slot staging \
    --action preview