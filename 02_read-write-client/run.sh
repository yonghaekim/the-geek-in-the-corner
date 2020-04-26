for i in {1..150}
do
  ./rdma-client read 10.0.0.50 36110 > temp$i.txt
done


