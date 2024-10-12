include ../../../make.inc

build_docker_image:
	docker build -t $(DOCKER_IMAGE_NAME) -f Dockerfile .

 run_docker_image:
	docker run --rm -it -p 8000:-e PORT=$(PORT) DOCKER_IMAGE_NAME
	#docker run --rm -it -p $(PORT):$(PORT) -e PORT=$(PORT) $(DOCKER_IMAGE_NAME)
  #docker run --rm -it -p $(PORT):$(PORT) -e PORT=$(PORT) $(DOCKER_IMAGE_NAME)
	docker run --rm -it -p $PORT:$PORT -e PORT=$PORT $DOCKER_IMAGE_NAME

 push_docker_image:
	 #docker tag "$DOCKER_IMAGE_NAME:$IMAGE_TAG" "$HOSTNAME/$PROJECT_ID/$REPOSITORY/$DOCKER_IMAGE_NAME:$IMAGE_TAG"
	#docker push "$HOSTNAME/$PROJECT_ID/$REPOSITORY/$DOCKER_IMAGE_NAME:$IMAGE_TAG"
   docker push $DOCKER_IMAGE_NAME

deploy gcloud run:
#gcloud run deploy my-backend --platform=managed --allow-unauthenticated --image=us-docker.pkg.dev/project/DOCKER_IMAGE_NAME
cloud run deploy first-app --image $DOCKER_IMAGE_NAME --region europe-west1
