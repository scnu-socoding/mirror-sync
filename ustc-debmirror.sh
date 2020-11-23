#!/bin/bash
debmirror /mnt/socoding/files/ubuntu \
    --host=rsync.mirrors.ustc.edu.cn \
    --root=repo/ubuntu \
    --arch=amd64 \
    --dist=focal,focal-updates,focal-security,focal-backports,focal-proposed,groovy,groovy-updates,groovy-security,groovy-backports,groovy-proposed \
    --verbose \
    --section=main,multiverse,universe,restricted \
    --method=rsync \
    --nosource \
    --ignore-release-gpg \
    --ignore-small-errors
