# THIS IS GOING TO INJECT THE SCHEMA OF MYSQL
resource "null_resource" "schema" {
  provisioner "local-exec" {
  command = <<EOF
       cd /tmp
       curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
       unzip -o mongodb.zip
       cd mongodb-main
       wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
       mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint} robot-dev-docdb-instance.c3j2gupablhn.us-east-1.docdb.amazonaws.com:27017 --sslCAFile rds-combined-ca-bundle.pem --username admin1 --password roboshop1 < users.js
       mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint} robot-dev-docdb-instance.c3j2gupablhn.us-east-1.docdb.amazonaws.com:27017 --sslCAFile rds-combined-ca-bundle.pem --username admin1 --password roboshop1 < catalogue.js

    EOF
  }
}
