node {
stage ('Prepare environment') {
checkout scm
}

stage ('Deploy') {
sh 'scp -r ./index.html root@bakey.us:/usr/share/nginx/html/'
}
}