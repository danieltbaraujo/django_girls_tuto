HOST=danielaraujo.busercamp.com.br

function devhelp() {
  echo "dkbuild    constroi a imagem docker"
  echo "dkrun      roda o projeto dockerizado"
  echo "deploy     dá deploy no projeto"
}

function dkbuild() {
  docker build -t danielaraujo .
}

function dkrun () {
  docker run -it -p 8000:8000 \
         -e DATABASE_FILE=/dkdata/db.sqlite3 \
         -e DJANGO_STATIC_ROOT=/dkdata/static \
         -e DJANGO_MEDIA_ROOT=/dkdata/media \
         -e DJANGO_MEDIA_URL=/dkdata/media/ \
         -v $(pwd)/dkdata:/dkdata \
         danielaraujo start.sh
}
function deploy() {
  rsync -av --exclude dkdata --exclude db.sqlite3 \
        ./* ubuntu@$HOST:./danielaraujo/
  ssh ubuntu@$HOST "cd danielaraujo && ./dkrunprod.sh"
}
devhelp
