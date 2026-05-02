# Disable third-party repos
for repo in 1password scootersoftware fedora-cisco-openh264; do
	if [[ -f "/etc/yum.repos.d/${repo}.repo" ]]; then
		sed -i 's@enabled=1@enabled=0@g' "/etc/yum.repos.d/${repo}.repo"
	fi
done

# Disable all COPR repos
for i in /etc/yum.repos.d/_copr:*.repo; do
	if [[ -f "$i" ]]; then
		sed -i 's@enabled=1@enabled=0@g' "$i"
	fi
done

# Disable ublue-os/akmods
if [[ -f "/etc/yum.repos.d/_copr_ublue-os-akmods.repo" ]]; then
	sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_ublue-os-akmods.repo
fi

# # Disable RPM Fusion repos
# for i in /etc/yum.repos.d/rpmfusion-*.repo; do
# 	if [[ -f "$i" ]]; then
# 		sed -i 's@enabled=1@enabled=0@g' "$i"
# 	fi
# done
