default: platform.flatpak sdk.flatpak

export FLATPAK_SYSTEM_DIR = ${CURDIR}/flatpak
export FLATPAK_USER_DIR = ${FLATPAK_SYSTEM_DIR}

setup-flathub:
	flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo

.PHONY: default setup-flathub

export VERSION = 1.6

platform.flatpak: setup-flathub
	flatpak install --user -y flathub org.freedesktop.Platform//${VERSION}
	flatpak build-bundle --runtime ${FLATPAK_USER_DIR}/repo $@ org.freedesktop.Platform ${VERSION}

sdk.flatpak: setup-flathub
	flatpak install --user -y flathub org.freedesktop.Sdk//${VERSION}
	flatpak build-bundle --runtime ${FLATPAK_USER_DIR}/repo $@ org.freedesktop.Sdk ${VERSION}
