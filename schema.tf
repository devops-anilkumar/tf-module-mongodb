# THIS IS GOING TO INJECT THE SCHEMA OF MYSQL
resource "null_resource" "schema" {
   depends_on = [aws_docdb_cluster.docdb]
  provisioner "local-exec" {
  command = <<EOF
       cd /tmp
       curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
       unzip -o mongodb.zip
       cd mongodb-main
       wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
       mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint}  --sslCAFile rds-combined-ca-bundle.pem --username DOCDB_USER --password DOCDB_PASSWORD < users.js
       mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint}  --sslCAFile rds-combined-ca-bundle.pem --username DOCDB_USER --password DOCDB_PASSWORD < catalogue.js
       
       EOF
  }
}
