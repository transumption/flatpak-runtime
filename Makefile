default: base-platform.flatpak base-sdk.flatpak

setup-flathub:
	flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo

.PHONY: default setup-flathub

export FLATPAK_SYSTEM_DIR = ${CURDIR}/flatpak
export FLATPAK_USER_DIR = ${FLATPAK_SYSTEM_DIR}

export VERSION = 1.6

base-platform.flatpak: setup-flathub
	flatpak install --user -y flathub org.freedesktop.BasePlatform//${VERSION}
	flatpak build-bundle --runtime ${FLATPAK_USER_DIR}/repo $@ org.freedesktop.BasePlatform ${VERSION}

base-sdk.flatpak: setup-flathub
	flatpak install --user -y flathub org.freedesktop.BaseSdk//${VERSION}
	flatpak build-bundle --runtime ${FLATPAK_USER_DIR}/repo $@ org.freedesktop.BaseSdk ${VERSION}
