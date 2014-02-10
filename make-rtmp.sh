########################################

LOCAL=`pwd`
echo "LOCAL=$LOCAL"


function  make_libz()
{
#for libz.a



echo ""
echo "########################################"
echo ""
echo "make libz ....."



cd  $LOCAL

mkdir libz
cd  zlib-1.2.8
cp  win32/Makefile.gcc .

make -f Makefile.gcc  clean
make -f Makefile.gcc 
#make -f Makefile.gcc  install


cp  zlib.h  zconf.h  zlib1.dll libz.a  libz.dll.a  ../libz/

echo ""

echo "make libz  end"
echo "==============================================="
echo ""
}

 

function  make_openssl()
{
echo ""
echo "########################################"
echo ""
echo "make openssl-1 ....."

cd  $LOCAL
cd  openssl-1.0.0l

./configure mingw  --prefix=`pwd`/../libopenssl  shared  

#for mingw sys use
#./configure mingw   shared 


make -j4 clean
make -j4 
make install

echo ""
echo "make openssl-1 . end"
echo "==============================================="
echo ""
}
 
 

function  make_rtmp()
{
echo ""
echo "########################################"
echo ""
echo "make rtmpdump-2 ....."



cd $LOCAL
mkdir librtmp

#fix for link libssl
cp Makefile-rtmp	rtmpdump-2.4/
cp Makefile-librtmp     rtmpdump-2.4/librtmp/Makefile
cd rtmpdump-2.4

make SYS=mingw clean
make SYS=mingw

cp librtmp/*.a  ../librtmp/
cp librtmp/*.h  ../librtmp/
cp librtmp/*.dll  ../librtmp/

make SYS=mingw install


echo ""
echo "make rtmpdump-2 . end"
echo "==============================================="
echo ""

}



function  make_xx()
{
echo ""
echo "########################################"
echo ""
echo "make xx ....."



cd $LOCAL

#mkdir libxx
#cd   xx
#make 
#make install

 
echo ""
echo "make xx . end"
echo "==============================================="
echo ""

}


make_libz

sleep 2

make_openssl

sleep 2

make_rtmp
