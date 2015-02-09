docker run --rm -it \
	--link $(docker inspect --format '{{ .Name }}' $(cat "$TR_ROOT"/.cid)):supervisord \
	$TR_IMAGE_NAME \
	bash -c "supervisorctl -s \${SUPERVISORD_PORT_9001_TCP/tcp/http} $@"


