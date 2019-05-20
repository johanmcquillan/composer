def compose(name:str, compose_yaml:str, visibility=None):
    yaml_suffix = 'yaml'

    genrule(
        name = "%s#%s" % (name, yaml_suffix),
        srcs = [compose_yaml],
        outs = ['docker-compose.yaml'],
        cmd = [
            "sed -e 's/${DOCKER_IP}/'\"$(docker-machine ip)\"/g %s >> $OUT" % compose_yaml,
        ],
    )

    sh_binary(
        name = name,
        srcs = ['compose.sh'],
        deps = [":%s#%s" % (name, yaml_suffix)],
        visibility=visibility,
    )

compose(
    name = 'kafka-pkg',
    compose_yaml='templates/kafka-zk-singlebroker.yaml'
)