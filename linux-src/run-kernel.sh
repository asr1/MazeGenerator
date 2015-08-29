src_dir=/tmp/cpre308-E3-${USER}-linux-kernel-src
kernel_version=linux-3.18.8
cd ${src_dir}/${kernel_version}
./linux ubda=Debian-Jessie-AMD64-root_fs mem=2G
