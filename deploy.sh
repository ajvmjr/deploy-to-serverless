PROJECT=$1  ##Project Id (received by parameter)

SERVICE_NAME=first-fastapi-project ##Service Name

CONTAINER_REGISTRY_URL=gcr.io/$PROJECT/$SERVICE_NAME ##Url where the docker image will be stored

gcloud builds submit --tag $CONTAINER_REGISTRY_URL --project=$PROJECT ##Pushes the image to Container Registry

gcloud run deploy $SERVICE_NAME --image $CONTAINER_REGISTRY_URL --region=southamerica-west1 ##Deploys the app to cloud run