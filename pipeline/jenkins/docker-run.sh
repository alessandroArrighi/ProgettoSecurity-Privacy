docker run -p 8080:8080 -p 50000:50000 --detach --restart always -v /var/run/docker.sock:/var/run/docker.sock test-jenkins