# Flatpak

The Flatpak wraps the electron-builder Linux output. The Chromium sandbox runs through
zypak from `org.electronjs.Electron2.BaseApp`.

## Build locally

```sh
yarn install
yarn gen:version && yarn vue:electron-build electron:build --linux dir
mv dist_electron/linux*-unpacked dist_electron/flatpak-unpacked

flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak-builder --user --install-deps-from=flathub --force-clean --install \
  build-dir flatpak/com.emqx.MQTTX.yml
flatpak run com.emqx.MQTTX
```

## Make a bundle

```sh
flatpak-builder --user --install-deps-from=flathub --force-clean --repo=repo \
  build-dir flatpak/com.emqx.MQTTX.yml
flatpak build-bundle repo MQTTX.flatpak com.emqx.MQTTX \
  --runtime-repo=https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --user MQTTX.flatpak
```

CI builds the bundles in `.github/workflows/build_flatpak.yaml`.

## Limits

- In-app update and "Install CLI" don't work in the sandbox. Update with `flatpak update`.
