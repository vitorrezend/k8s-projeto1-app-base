#!bin/bash

echo "Criando as Imagens....."


docker build -t vitrezz/projeto-backend:1.0 backend/.
docker build -t vitrezz/projeto-database:1.0 database/.

echo "Realizando o push das imagens....."

docker push vitrezz/projeto-backend:1.0
docker push vitrezz/projeto-database:1.0

echo "Criando serviços no cluster kubernetes"

kubectl apply -f ./services.yml

echo "Realizando o deployements"
kubectl apply -f ./deployement.yml

