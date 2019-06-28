 if test -e /usr/lib64/libnuma.so ; then
    numa_lib=/usr/lib64/libnuma.so
elif test -e /usr/lib64/libnuma.so.1 ; then
    numa_lib=/usr/lib64/libnuma.so.1
elif test -e /lib64/libnuma.so ; then
    numa_lib=/lib64/libnuma.so
elif test -e /lib64/libnuma.so.1 ; then
    numa_lib=/lib64/libnuma.so.1
elif test -e /usr/lib/x86_64-linux-gnu/libnuma.so ; then
    numa_lib=/usr/lib/x86_64-linux-gnu/libnuma.so
elif test -e /usr/lib/x86_64-linux-gnu/libnuma.so.1 ; then
    numa_lib=/usr/lib/x86_64-linux-gnu/libnuma.so.1
fi

if test "numa_lib" != "" ; then
    ln -sf $numa_lib /app/acc/lib/libnuma.so
    ln -sf $nusma_lib /app/acc/lib/libnuma.so.1
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/:/app/acc/lib/