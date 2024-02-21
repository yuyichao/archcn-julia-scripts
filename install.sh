#!/bin/bash -e

srcdir=$(dirname ${BASH_SOURCE})
pkgdir=$1
ver_short=$2

mkdir -p "${pkgdir}/usr/lib/julia/"

install -Dm644 "${srcdir}/julia-compile-pkgs.jl" "${pkgdir}/usr/lib/julia/"
install -Dm755 "${srcdir}/julia-preinstall.sh" "${pkgdir}/usr/lib/julia/"
install -Dm755 "${srcdir}/julia-postinstall.sh" "${pkgdir}/usr/lib/julia/"
sed -e "s|@VER@|$ver_short|g" "${srcdir}/julia-preinstall.hook" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/julia-preinstall.hook"
sed -e "s|@VER@|$ver_short|g" "${srcdir}/julia-postinstall.hook" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/julia-postinstall.hook"
