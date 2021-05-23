platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == "Darwin" ]]; then
   platform='osx'
fi


if [[ "$platform" == "osx" ]]; then
    export JAVA_HOME="`/usr/libexec/java_home`"
fi

export JAVA_HOME='/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home'
