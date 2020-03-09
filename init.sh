git clone https://github.com/linux-rdma/rdma-core.git
sudo apt-get install build-essential cmake gcc libudev-dev libnl-3-dev libnl-route-3-dev ninja-build pkg-config valgrind python3-dev cython3 python3-docutils pandoc
sudo apt-get -y --force-yes install libibverbs1 ibverbs-utils librdmacm1 rdmacm-utils libdapl2 ibsim-utils ibutils libcxgb3-1 libibmad5 libibumad3 libmlx4-1 libmthca1 libnes1 infiniband-diags mstflint opensm perftest srptools

CUR_DIR=$PWD

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUR_DIR/rdma-core/build/lib
export LIBRARY_PATH=$LIBRARY_PATH:$CUR_DIR/rdma-core/build/include

# RDMA stack modules
sudo modprobe rdma_cm
sudo modprobe ib_uverbs
sudo modprobe rdma_ucm
sudo modprobe ib_ucm
sudo modprobe ib_umad
sudo modprobe ib_ipoib
# RDMA devices low-level drivers
sudo modprobe mlx4_ib
sudo modprobe mlx4_en
sudo modprobe iw_cxgb3
sudo modprobe iw_cxgb4
sudo modprobe iw_nes
sudo modprobe iw_c2

sudo mv 40-rdma.rules /etc/udev/rules.d/
sudo cat limits.conf >> /etc/security/limits.conf

