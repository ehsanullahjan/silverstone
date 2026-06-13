# AGENTS.md

## Build & Deploy Commands

- **Build container image**: `just build $target_image $tag` (default: `silverstone:44`)
- **Build VM image (qcow2)**: `just build-qcow2` or `just build-vm`
- **Build ISO**: `just build-iso`
- **Run VM**: `just run-vm-qcow2` (web UI at http://localhost:8006)
- **Spawn VM with systemd-vmspawn**: `just spawn-vm rebuild="1" type="qcow2" ram="6G"`

## Critical Constraints

- **Cosign signing required**: Builds fail without `cosign.key` in repo (never commit it). Set `SIGNING_SECRET` GitHub secret.
- **Image naming**: Default image name is `silverstone`, default tag is `44` (Fedora version).
- **Rootful podman**: VM/ISO builds require rootful podman via `just sudoif` helper in Justfile:56.
- **BIB image**: Bootc Image Builder uses `quay.io/centos-bootc/bootc-image-builder:latest` (configurable via `BIB_IMAGE` env).

## Project Structure

- **Containerfile**: Entrypoint for container builds; uses `build_files/build.sh` for modifications
- **build_files/**: Shell scripts for package installation, cleanup, and customization
- **disk_config/**: TOML configs for disk/ISO builds (`disk.toml`, `iso-gnome.toml`, `iso-kde.toml`)
- **Justfile**: All build/run commands; uses `just` (pre-installed on Universal Blue images)

## Build Order & Verification

1. Build container: `just build`
2. Lint Bash scripts: `just lint` (requires `shellcheck`)
3. Format Bash scripts: `just format` (requires `shfmt`)
4. Check Just syntax: `just check` / `just fix`

## Key Dependencies

- **Container runtime**: Podman (user and rootful)
- **VM running**: QEMU via `qemux/qemu` container or `systemd-vmspawn`
- **Build tools**: `just`, `podman`, `bootc-image-builder`, `cosign`
- **Package manager**: DNF with RPM Fusion repos enabled by default

## Package Installation Pattern

All packages installed via `build_files/install/*.sh` scripts:
- 1Password, BCompare, VSCode, Docker, Podman, Libvirt, ROCm
- System tools: `bat`, `btop`, `carapace-bin`, `chezmoi`, `eza`, `fd-find`, `neovim`, `ripgrep`, `tmux`, `zsh`, `zoxide`
- Disable third-party/COPR repos after install (see `cleanup.sh`)

## GitHub Actions

- **build.yml**: Container image builds on schedule/push; publishes to GHCR
- **build-disk.yml**: Disk/ISO builds via `bootc-image-builder-action`; optional S3 upload
- **ArtifactHub**: Optional indexing via `artifacthub-repo.yml` (set `repositoryID`)
