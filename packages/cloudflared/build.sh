TERMUX_PKG_HOMEPAGE=https://github.com/cloudflare/cloudflared
TERMUX_PKG_DESCRIPTION="A tunneling daemon that proxies traffic from the Cloudflare network to your origins"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="2024.3.0"
TERMUX_PKG_SRCURL=https://github.com/cloudflare/cloudflared/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=6e5fda072d81b2d40208a0d244b44aaf607f26709711e157e23f44f812594e93
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_golang
}

termux_step_make_install() {
	make install \
		VERSION=$TERMUX_PKG_VERSION \
		DATE=$(date -u +"%Y-%m-%dT%H:%M") \
		PACKAGE_MANAGER=pkg \
		PREFIX=$TERMUX_PREFIX
}
