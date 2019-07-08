docker build -t cronicle-base -f Dockerfile .

docker run --rm -it \
    -v $PWD/sample_conf/config.json:/opt/cronicle/conf/config.json \
    -v $PWD/sample_conf/emails:/opt/cronicle/conf/emails \
    -p 3012:3012 cronicle-base /bin/bash
