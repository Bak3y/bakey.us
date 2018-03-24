node {
stage ('Prepare environment') {
checkout scm
}

stage ('Deploy') {
sh 'scp -P 9022 -r ./index.html root@bakey.us:/usr/share/nginx/html/'
}
}