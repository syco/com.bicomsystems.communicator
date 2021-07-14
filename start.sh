#/bin/sh

APP_NAME="Communicator"

export QT_PLUGIN_PATH="/app/opt/$APP_NAME/lib/plugins"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/app/opt/$APP_NAME/lib"
export QT_AUTO_SCREEN_SCALE_FACTOR=0

#check if input arguments contain 'glocom://'
flag1=`echo $@|awk '{print match($0,"glocom://")}'`;
flag2=`echo $@|awk '{print match($0,"tel://")}'`;
flag3=`echo $@|awk '{print match($0,"sip://")}'`;
flag4=`echo $@|awk '{print match($0,"callto://")}'`;

if [ $flag1 -gt 0 ];then
        #remove spaces from input arguiments
        number=`echo "$@" | sed 's/ //g'`
        /app/opt/$APP_NAME/bin/$APP_NAME $number
                exit 1
elif [ $flag2 -gt 0 ];then
        #remove spaces from input arguiments
        number=`echo "$@" | sed 's/ //g' | sed 's/tel/glocom/'`
        /app/opt/$APP_NAME/bin/$APP_NAME $number
                exit 1
elif [ $flag3 -gt 0 ];then
        #remove spaces from input arguiments
        number=`echo "$@" | sed 's/ //g' | sed 's/sip/glocom/'`
        /app/opt/$APP_NAME/bin/$APP_NAME $number
                exit 1
elif [ $flag4 -gt 0 ];then
        #remove spaces from input arguiments
        number=`echo "$@" | sed 's/ //g' | sed 's/callto/glocom/'`
        /app/opt/$APP_NAME/bin/$APP_NAME $number
                exit 1
else
        /app/opt/$APP_NAME/bin/$APP_NAME $1
                exit $?
fi

