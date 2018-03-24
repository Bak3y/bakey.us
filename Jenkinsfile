node {
stage ('Prepare environment') {
checkout scm
}

stage ('Deploy') {
sh 'scp -o StrictHostKeyChecking=no -P 9022 -r ./index.html root@bakey.us:/usr/share/nginx/html/'
}
}