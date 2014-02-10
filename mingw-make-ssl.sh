########################################
#for libz.a

cp win32/Makefile.gcc .

make -f Makefile.gcc 


########################################
cd  openssl-1.0.0l

./configure mingw  --prefix=`pwd`/../libopenssl  shared -DL_ENDIAN -DOPENSSL_NO_HW 
./configure mingw   shared -DL_ENDIAN -DOPENSSL_NO_HW 


make -j4


make install
