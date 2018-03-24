node {
stage ('Prepare environment') {
checkout scm https://github.com/Bak3y/bakey.us.git
}

stage ('Deploy') {
sh 'scp -r ./index.html root@bakey.us:/usr/share/nginx/html/'
}
}