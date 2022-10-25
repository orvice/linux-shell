

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" |sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install containerd



apt install containerd


echo "Install nerdctl"
NERDCTL_VERSION=1.0.0

archType="amd64"
if test "$(uname -m)" = "aarch64"
then
    archType="arm64"
fi

wget -q "https://github.com/containerd/nerdctl/releases/download/v${NERDCTL_VERSION}/nerdctl-full-${NERDCTL_VERSION}-linux-${archType}.tar.gz" -O /tmp/nerdctl.tar.gz
mkdir -p ~/.local/bin
tar -C ~/.local/bin/ -xzf /tmp/nerdctl.tar.gz --strip-components 1 bin/nerdctl

mv ~/.local/bin/nerdctl /usr/local/bin/
chmod +x /usr/local/bin/nerdctl


tar -C ~/.local -xzf /tmp/nerdctl.tar.gz libexec
echo 'export CNI_PATH=~/.local/libexec/cni' >> ~/.bashrc
source ~/.bashrc

tar -C ~/.local/bin/ -xzf /tmp/nerdctl.tar.gz --strip-components 1 bin/buildkitd bin/buildctl
