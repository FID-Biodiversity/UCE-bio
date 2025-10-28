FROM docker.texttechnologylab.org/uce/uce-fuseki-sparql:0.0.1
#FROM stain/jena-fuseki

ADD ./kube-sparql/ .

ENV JVM_ARGS=-Xmx8g

EXPOSE 5430

ENV TDB2_ENDPOINT=biofid-search

#RUN chown fuseki /fuseki/databases
#RUN chmod 777 /fuseki/databases

RUN echo /fuseki/databases/${TDB2_ENDPOINT} /${TDB2_ENDPOINT}
ENTRYPOINT ["sh", "start_db.sh"]
#CMD ./entrypoint.sh --update --tdb2 --port 5430 --loc /fuseki/databases/${TDB2_ENDPOINT} /${TDB2_ENDPOINT}
#docker build -t kube-uce-fuseki-sparql -f kubernetes-sparql/Dockerfile .
#sudo docker run -p 8030:5430  -v ../biofid-search:/fuseki/databases/biofid-search kube-uce-fuseki-sparql


#sudo docker build -t kube-uce-fuseki-sparql -f kubernetes-sparql/Dockerfile .
#sudo docker login https://harbor.ub.uni-frankfurt.de
#sudo docker tag kube-uce-fuseki-sparql harbor.ub.uni-frankfurt.de/fid/biofid-portal:uce-sparqlv1
#sudo docker push  harbor.ub.uni-frankfurt.de/fid/biofid-portal:uce-sparqlv1

# In Kubernetes: mounte sambashare unter /mnt & VolumeClaim unter /fuseki/databases
#               cp -r /mnt/UCE/ontologies/test_data/ /fuseki/databases/

#               Danach command ./entrypoint.sh --update --tdb2 --port 5430 --loc /fuseki/databases/test_data/biofid-search /biofid-search
