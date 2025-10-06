#!/bin/bash -e

srcdir=$(dirname ${BASH_SOURCE})
pkgdir=$1

mkdir -p "${pkgdir}/usr/lib/julia/"

install -Dm644 "${srcdir}/julia-compile-pkgs.jl" "${pkgdir}/usr/lib/julia/"
install -Dm755 "${srcdir}/julia-preinstall.sh" "${pkgdir}/usr/lib/julia/"
install -Dm755 "${srcdir}/julia-postinstall.sh" "${pkgdir}/usr/lib/julia/"
