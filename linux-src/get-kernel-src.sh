#!/bin/bash
script_dir=$(pwd)
src_dir=/tmp/cpre308-E3-${USER}-linux-kernel-src
kernel_version=linux-3.18.8

echo "Cleaning up"
rm -rf $src_dir
rm linux
mkdir $src_dir
ln -s ${src_dir}/${kernel_version} linux
cd $src_dir
echo "Downloading kernel source"
wget https://www.kernel.org/pub/linux/kernel/v3.x/${kernel_version}.tar.xz -nv
echo "Uncompressing kernel source"
unxz ${kernel_version}.tar.xz -q
echo "Extracting tar of kernel source"
tar -xvf ${kernel_version}.tar > /dev/null
cd $kernel_version
echo "Compiling the kernel"
cp ${script_dir}/make-.config ${src_dir}/${kernel_version}/.config
make -s -j10 ARCH=um
echo "Downloading file system image"
wget http://fs.devloop.org.uk/filesystems/Debian-Jessie/Debian-Jessie-AMD64-root_fs.bz2 -nv
echo "Uncompressing file system image"
bzip2 -d Debian-Jessie-AMD64-root_fs.bz2 -q
