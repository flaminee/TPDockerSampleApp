FROM ubuntu

EXPOSE 8080
RUN apt-get -y update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y maven
RUN apt-get install -y libpng16-16
RUN apt-get install -y libdc1394-25
RUN apt-get install -y git

RUN git clone https://github.com/barais/TPDockerSampleApp

WORKDIR TPDockerSampleApp
RUN mvn install:install-file -Dfile=./lib/opencv-3410.jar  -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar
RUN mvn package
CMD ["java", "-Djava.library.path=lib/ubuntuupperthan18/", "-jar", "target/fatjar-0.0.1-SNAPSHOT.jar"]

	
