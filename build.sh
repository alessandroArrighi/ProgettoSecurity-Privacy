#!/bin/zsh

#docker run -it --rm --name my-maven-project -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven mvn clean verify sonar:sonar -Dsonar.projectKey=prova1 -Dsonar.projectName='prova1' -Dsonar.host.url=http://172.17.0.2:9000 -Dsonar.token=sqp_44b72bc195a6352d47726088a16d21915785200f
#docker run -it --rm --name my-maven-project -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven /bin/bash
#docker run --rm -u gradle -v "$PWD":/home/gradle/project -w /home/gradle/project gradle gradle build
#docker run --rm -u gradle -v "$PWD":/home/gradle/project -w /home/gradle/project gradle gradle sonar -Dsonar.projectKey=prova1 -Dsonar.projectName='prova1' -Dsonar.host.url=http://172.17.0.3:9000 -Dsonar.token=sqp_f0e037c28af67d9321cc9584b63781f8953f41f6