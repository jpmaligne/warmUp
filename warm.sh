cp .bash_aliases ~/.bash_aliases &&
cp .gitconfig ~/.gitconfig &&
mkdir ~/workspace &&
sudo apt install -y vim git curl &&
git clone https://github.com/nojhan/liquidprompt.git ~/liquidprompt &&
echo "[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt" >> ~/.bashrc &&
source ~/.bashrc &&
sudo snap install code --classic &&
sudo snap install node --classic &&
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash &&
touch ~/.ssh/id_rsa &&
touch ~/.ssh/id_rsa.pub &&
chmod 600 ~/.ssh/id_rsa &&
chmod 644 ~/.ssh/id_rsa.pub &&
echo "When you're done with SSH keys : " &&
echo "eval $(ssh-agent)"
echo "Slack  : https://slack.com/intl/fr-fr/downloads/linux"
echo "Chrome : https://www.google.com/intl/fr_fr/chrome/"