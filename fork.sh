#!/bin/bash
groupId=$(echo $2 | sed 's|\.|/|g')
#4eyes-address-check
rm -fR "4eyes-address-check-api"
rm -fR "4eyes-address-check-impl"
#4eyes-credit-score
rm -fR "4eyes-credit-score-api"
rm -fR "4eyes-credit-score-impl"
#4eyes-fraud-prevention
rm -fR "4eyes-fraud-prevention-api"
rm -fR "4eyes-fraud-prevention-impl"
#4eyes-notifier
rm -fR "4eyes-notifier-api"
rm -fR "4eyes-notifier-impl"
#customer-relationship-adapter
rm -fR "customer-relationship-adapter"
rm -fR "customer-relationship-adapter-impl"
#fsm-***-advice
mkdir "fsm-$1-advice"
sedAdviceMwe="s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedAdviceMwe="${sedAdviceMwe}s|4eyes|$1|g"
sed "${sedAdviceMwe}" "fsm-4eyes-advice/src/main/mwe2/GenerateWorkflow.mwe2" > "fsm-$1-advice/src/main/mwe2/GenerateWorkflow.mwe2"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-advice/build.gradle" > "fsm-$1-advice/build.gradle"
rm -fR "fsm-4eyes-advice"
#fsm-***-uml-model
mkdir "fsm-$1-uml-model"
mkdir -p "fsm-$1-uml-model/src/main/resources"
cp "fsm-4eyes-uml-model/build.gradle" "fsm-$1-uml-model"
rm -fR "fsm-4eyes-uml-model"
#fsm-***-statemachine
mkdir "fsm-$1-statemachine"
cp "fsm-4eyes-statemachine/.scalafmt.conf" "fsm-$1-statemachine"
cp "fsm-4eyes-statemachine/plugin.properties" "fsm-$1-statemachine"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-statemachine/build.gradle" > "fsm-$1-statemachine/build.gradle"
mkdir -p "fsm-$1-statemachine/src/main/mwe2"
sedStatemachineMwe="s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedStatemachineMwe="${sedStatemachineMwe}s|4eyes|$1|g"
sed "${sedStatemachineMwe}" "fsm-4eyes-statemachine/src/main/mwe2/GenerateWorkflow.mwe2" > "fsm-$1-statemachine/src/main/mwe2/GenerateWorkflow.mwe2"
rm -fR "fsm-4eyes-statemachine"
#fsm-***-actionguard-impl
mkdir "fsm-$1-actionguard-impl"
mkdir -p "fsm-$1-actionguard-impl/src/main/java/${groupId}"
cp "fsm-4eyes-actionguard-impl/build.gradle" "fsm-$1-actionguard-impl"
rm -fR "fsm-4eyes-actionguard-impl"
#fsm-***-event-adapter
#only necessary for Event / State Machine evolution
#mkdir "fsm-$1-event-adapter"
#mkdir -p "fsm-$1-event-adapter/src/main/scala/${groupId}"
#cp "fsm-4eyes-event-adapter/build.gradle" "fsm-$1-event-adapter"
#fsm-***-statemachine-facade
mkdir "fsm-$1-statemachine-facade"
mkdir -p "fsm-$1-statemachine-facade/src/main/java/${groupId}"
mkdir -p "fsm-$1-statemachine-facade/src/main/scala/${groupId}"
sedStateMachineFacadeMwe="s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedStateMachineFacadeMwe="${sedStateMachineFacadeMwe}s|4eyes|$1|g"
sed "${sedStateMachineFacadeMwe}" "fsm-4eyes-statemachine-facade/src/main/mwe2/GenerateWorkflow.mwe2" > "fsm-$1-statemachine-facade/src/main/mwe2/GenerateWorkflow.mwe2"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-statemachine-facade/build.gradle" > "fsm-$1-statemachine-facade/build.gradle"
rm -fR "fsm-4eyes-statemachine-facade"
#fsm-***-model
mkdir "fsm-$1-model"
mkdir -p "fsm-$1-model/src/main/mwe2"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-model/build.gradle" > "fsm-$1-model/build.gradle"
sedModelMwe="s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedModelMwe="${sedModelMwe}s|4eyes|$1|g"
sed "${sedModelMwe}" "fsm-4eyes-model/src/main/mwe2/GenerateWorkflow.mwe2" > "fsm-$1-model/src/main/mwe2/GenerateWorkflow.mwe2"
rm -fR "fsm-4eyes-model"
#fsm-***-protobuf
mkdir "fsm-$1-protobuf"
mkdir -p "fsm-$1-protobuf/src/main/mwe2"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-protobuf/build.gradle" > "fsm-$1-protobuf/build.gradle"
sedProtobufMwe="s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedProtobufMwe="${sedProtobufMwe}s|4eyes|$1|g"
sed "${sedProtobufMwe}" "fsm-4eyes-protobuf/src/main/mwe2/GenerateWorkflow.mwe2" > "fsm-$1-protobuf/src/main/mwe2/GenerateWorkflow.mwe2"
rm -fR "fsm-4eyes-protobuf"
#fsm-***-converter
mkdir "fsm-$1-converter"
mkdir -p "fsm-$1-converter/src/main/mwe2"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-converter/build.gradle" > "fsm-$1-converter/build.gradle"
sedConverterMwe="s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedConverterMwe="${sedConverterMwe}s|4eyes|$1|g"
sed "${sedConverterMwe}" "fsm-4eyes-converter/src/main/mwe2/GenerateWorkflow.mwe2" > "fsm-$1-converter/src/main/mwe2/GenerateWorkflow.mwe2"
rm -fR "fsm-4eyes-converter"
#fsm-****-command
mkdir "fsm-$1-command"
mkdir -p "fsm-$1-command/src/main/mwe2"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-command/build.gradle" > "fsm-$1-command/build.gradle"
sedCommandMwe="s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedCommandMwe="${sedCommandMwe}s|4eyes|$1|g"
sed "${sedCommandMwe}" "fsm-4eyes-command/src/main/mwe2/GenerateWorkflow.mwe2" > "fsm-$1-command/src/main/mwe2/GenerateWorkflow.mwe2"
rm -fR "fsm-4eyes-command"
#fsm-***-kafka
mkdir "fsm-$1-kafka"
mkdir -p "fsm-$1-kafka/src/main/mwe2"
cp "fsm-4eyes-kafka/.scalafmt.conf" "fsm-$1-kafka"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-kafka/build.gradle" > "fsm-$1-kafka/build.gradle"
sedKafkaMwe="s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedKafkaMwe="${sedKafkaMwe}s|4eyes|$1|g"
sed "${sedKafkaMwe}" "fsm-4eyes-kafka/src/main/mwe2/GenerateWorkflow.mwe2" > "fsm-$1-kafka/src/main/mwe2/GenerateWorkflow.mwe2"
rm -fR "fsm-4eyes-kafka"
#fsm-***-elasticsearch-statemachine-adapter
mkdir "fsm-$1-elasticsearch-statemachine-adapter"
cp "fsm-4eyes-elasticsearch-statemachine-adapter/.scalafmt.conf" "fsm-$1-elasticsearch-statemachine-adapter"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-elasticsearch-statemachine-adapter/build.gradle" > "fsm-$1-elasticsearch-statemachine-adapter/build.gradle"
mkdir -p "fsm-$1-elasticsearch-statemachine-adapter/src/main/mwe2"
sedESSMAdapMwe="s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedESSMAdapMwe="${sedESSMAdapMwe}s|4eyes|$1|g"
sed "${sedESSMAdapMwe}" "fsm-4eyes-elasticsearch-statemachine-adapter/src/main/mwe2/GenerateWorkflow.mwe2" > "fsm-$1-elasticsearch-statemachine-adapter/src/main/mwe2/GenerateWorkflow.mwe2"
rm -fR "fsm-4eyes-elasticsearch-statemachine-adapter"
#fsm-***-projections-statemachine-adapter
mkdir "fsm-$1-projections-statemachine-adapter"
cp "fsm-4eyes-projections-statemachine-adapter/.scalafmt.conf" "fsm-$1-projections-statemachine-adapter"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-projections-statemachine-adapter/build.gradle" > "fsm-$1-projections-statemachine-adapter/build.gradle"
mkdir -p "fsm-$1-projections-statemachine-adapter/src/main/mwe2"
sedProjSMAdapMwe="s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedProjSMAdapMwe="${sedProjSMAdapMwe}s|4eyes|$1|g"
sed "${sedProjSMAdapMwe}" "fsm-4eyes-projections-statemachine-adapter/src/main/mwe2/GenerateWorkflow.mwe2" > "fsm-$1-projections-statemachine-adapter/src/main/mwe2/GenerateWorkflow.mwe2"
rm -fR "fsm-4eyes-projections-statemachine-adapter"
#fsm-***-projections
mkdir "fsm-$1-projections"
mkdir -p "fsm-$1-projections/src/main/scala/${groupId}"
sedProjectionMwe="s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedProjectionMwe="${sedProjectionMwe}s|4eyes|$1|g"
sed "${sedProjectionMwe}" "fsm-4eyes-projections/src/main/mwe2/GenerateWorkflow.mwe2" > "fsm-$1-projections/src/main/mwe2/GenerateWorkflow.mwe2"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-projections/build.gradle" > "fsm-$1-projections/build.gradle"
rm -fR "fsm-4eyes-projections"
#fsm-***-application
mkdir "fsm-$1-application"
mkdir -p "fsm-$1-application/src/main/java/${groupId}"
mkdir -p "fsm-$1-application/src/main/resources"
mkdir -p "fsm-4eyes-application/src/main/jib/var/lib/fsm_$1_application"
cp "fsm-4eyes-application/src/main/resources/bootstrap.yml" "fsm-$1-application/src/main/resources/bootstrap.yml"
cp "fsm-4eyes-application/src/main/resources/logback.xml" "fsm-$1-application/src/main/resources/logback.xml"
cp -R "fsm-4eyes-application/helm" "fsm-$1-application/helm"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-application/build.gradle" > "fsm-$1-application/build.gradle"
camelCase=$(echo "${1}" | awk 'BEGIN{FS="";RS="-";ORS=""} {$0=toupper(substr($0,1,1)) substr($0,2)} 1')
hyphenCase=$(echo "${1}" | awk 'BEGIN{FS="";RS="-";ORS=""} {$0=substr($0,1,1) substr($0,2)} 1')
targetFileName=$(echo "FSMPekko4EyesApplication" | sed "s|4Eyes|${camelCase}|g")

#Application.java
sedApplicationCommand="s|FSMPekko4EyesApplication|${targetFileName}|g;"
sedApplicationCommand="${sedApplicationCommand}s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedApplicationCommand="${sedApplicationCommand}/Configuration/d"
sed "${sedApplicationCommand}" "fsm-4eyes-application/src/main/java/org/salgar/fsm/pekko/foureyes/FSMPekko4EyesApplication.java" > "fsm-$1-application/src/main/java/${groupId}/${targetFileName}.java"

#Starter.java
sedStarterCommand="/StreamConfig\.apply/{N;N;N;N;N;N;d;};"
sedStarterCommand="${sedStarterCommand}/StreamConfig/d;"
sedStarterCommand="${sedStarterCommand}/CreditSMProjection\.init/{N;N;N;d;};"
sedStarterCommand="${sedStarterCommand}/CreditSMProjection/d;"
sedStarterCommand="${sedStarterCommand}s|org.salgar.fsm.pekko.foureyes.credit|$2|g;"
sedStarterCommand="${sedStarterCommand}s|org.salgar.fsm.pekko.foureyes|$2|g"
sed "${sedStarterCommand}" "fsm-4eyes-application/src/main/java/org/salgar/fsm/pekko/foureyes/Starter.java" > "fsm-$1-application/src/main/java/${groupId}/Starter.java"

#Application.yml
sedApplicationYmlCommand="s|FourEyes|${camelCase}|g;"
sedApplicationYmlCommand="${sedApplicationYmlCommand}s|org\.salgar\.fsm\.pekko\.foureyes|$2.${hyphenCase}|g;"
sedApplicationYmlCommand="${sedApplicationYmlCommand}s|foureyes|$1|g;"
sedApplicationYmlCommand="${sedApplicationYmlCommand}/multi\-credit\-score-sm\:/{N;N;N;N;N;N;d;};"
sedApplicationYmlCommand="${sedApplicationYmlCommand}/credit\-score-sm\:/{N;N;N;N;N;N;d;};"
sedApplicationYmlCommand="${sedApplicationYmlCommand}/adress\-check\-sm\:/{N;N;N;N;N;N;d;};"
sedApplicationYmlCommand="${sedApplicationYmlCommand}/fraud\-prevention\-sm\:/{N;N;N;N;N;N;d;}"
sed "${sedApplicationYmlCommand}" "fsm-4eyes-application/src/main/resources/application.yml" > "fsm-$1-application/src/main/resources/application.yml"

#Helm
sed "s|4eyes|$1|g" "fsm-4eyes-application/helm/values.yaml" > "fsm-$1-application/helm/values.yaml"
sed "s|foureyes|$1|g" "fsm-4eyes-application/helm/Chart.yaml" > "fsm-$1-application/helm/Chart.yaml"
rm -fR "fsm-4eyes-application"

#fsm-***-asciidoc
mkdir "fsm-$1-asciidoc"
mkdir -p "fsm-$1-asciidoc/src/main/mwe2"
sedASciiDocMwe="s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedASciiDocMwe="${sedKafkaMwe}s|4eyes|$1|g"
sed "${sedASciiDocMwe}" "fsm-4eyes-asciidoc/src/main/mwe2/GenerateWorkflow.mwe2" > "fsm-$1-asciidoc/src/main/mwe2/GenerateWorkflow.mwe2"
sed "s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;" "fsm-4eyes-asciidoc/build.gradle" > "fsm-$1-asciidoc/build.gradle"

#root elements
#settings.gradle
sedCommand="s|fsm-4eyes-uml-model|fsm-$1-uml-model|g;"
sedCommand="${sedCommand}s|fsm-4eyes-advice|fsm-$1-advice|g;"
sedCommand="${sedCommand}s|fsm-4eyes-statemachine|fsm-$1-statemachine|g;"
sedCommand="${sedCommand}s|fsm-4eyes-actionguard-impl|fsm-$1-actionguard-impl|g;"
sedCommand="${sedCommand}s|fsm-4eyes-event-adapter|fsm-$1-event-adapter|g;"
sedCommand="${sedCommand}s|fsm-4eyes-statemachine-facade|fsm-$1-statemachine-facade|g;"
sedCommand="${sedCommand}s|fsm-4eyes-model|fsm-$1-model|g;"
sedCommand="${sedCommand}s|fsm-4eyes-protobuf|fsm-$1-protobuf|g;"
sedCommand="${sedCommand}s|fsm-4eyes-converter|fsm-$1-converter|g;"
sedCommand="${sedCommand}s|fsm-4eyes-command|fsm-$1-command|g;"
sedCommand="${sedCommand}s|fsm-4eyes-kafka|fsm-$1-kafka|g;"
sedCommand="${sedCommand}s|fsm-4eyes-elasticsearch-statemachine-adapter|fsm-$1-elasticsearch-statemachine-adapter|g;"
sedCommand="${sedCommand}s|fsm-4eyes-projections-statemachine-adapter|fsm-$1-projections-statemachine-adapter|g;"
sedCommand="${sedCommand}s|fsm-4eyes-projections|fsm-$1-projections|g;"
sedCommand="${sedCommand}s|fsm-4eyes-application|fsm-$1-application|g;"
sedCommand="${sedCommand}s|4eyes-statemachine|$1|g"

sed "${sedCommand}" settings.gradle > settings_fork.gradle

#gradle.properties
sedCommand="s|FourEyes|${camelCase}|g;"
sedCommand="${sedCommand}s|org.salgar.fsm.pekko.foureyes|$2|g;"
sedCommand="${sedCommand}s|4eyes|$1|g"
sed "${sedCommand}" gradle.properties > gradle_fork.properties