# Proxy management functions and configuration

proxy_authenticate() {
    echo "Attempting NTLM auth to $NADQ_PROXY as $USER"
    curl --fail-early -f -v -I -L --proxy-ntlm -U $USER -x $NADQ_PROXY www.google.com
    if [ $? -ne 0 ]; then
        echo ""
        echo "ERROR: unable to authenticate to proxy"
    else
        echo ""
        echo "Successfully authenticated with proxy"
    fi
    echo ""
}

proxy_status() {
    if [[ -n "$HTTP_PROXY" ]]; then
        echo "Proxy enabled: $HTTP_PROXY"
    else
        echo "Proxy disabled"
    fi
}

proxy_enable() {
    if [[ $1 == "au" ]]; then
        NADQ_PROXY="http://vzen-au.org.nasdaqomx.com:9400"
        NADQ_SSL_PROXY="http://vzen-au.org.nasdaqomx.com:9400"
    elif [[ $1 == "se" ]]; then
        NADQ_PROXY="http://vzen-se.org.nasdaqomx.com:9400"
        NADQ_SSL_PROXY="http://vzen-se.org.nasdaqomx.com:9400"
    elif [[ $1 == "us" ]]; then
        NADQ_PROXY="http://vzen-us.org.nasdaqomx.com:9400"
        NADQ_SSL_PROXY="http://vzen-us.org.nasdaqomx.com:9400"
    elif [[ $1 == "cloud" ]]; then
        NADQ_PROXY="http://185.46.212.92:9400/"
        NADQ_SSL_PROXY="http://185.46.212.92:9400/"
    else
        echo "No region selected, using cloud (zscaler us) as proxy"
        NADQ_PROXY="http://vzen-us.org.nasdaqomx.com:9400"
        NADQ_SSL_PROXY="http://vzen-us.org.nasdaqomx.com:9400"
    fi

    NADQ_NO_PROXY="localhost,127.0.0.1,*.nasdaq.com,nexus.exchsys.nasdaq.com,registry.git.nasdaq.com,git.nasdaq.com,159.79.212.69,159.79.212.70,159.79.212.71,tfe.ops.nadq2universalservices.gi.nadq.ci,cyber.nasdaq.com,git-pages.nasdaq.com,10.112.97.100,10.44.242.225,psregistry.ndaquniversalservices.com,cloudplatform.git-pages.nasdaq.com,feeds.ndaquniversalservices.com,jira.global.org.nasdaqomx.com"

    export HTTP_PROXY=${NADQ_PROXY}
    export HTTPS_PROXY=${NADQ_SSL_PROXY}
    export http_proxy=${NADQ_PROXY}
    export https_proxy=${NADQ_SSL_PROXY}
    export NO_PROXY=${NADQ_NO_PROXY}
    export no_proxy=${NADQ_NO_PROXY}
    proxy_status
}

proxy_disable() {
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset http_proxy
    unset https_proxy
    unset NO_PROXY
    unset no_proxy
    proxy_status
}

DEFAULT_PROXY="us"
proxy_enable ${DEFAULT_PROXY}
