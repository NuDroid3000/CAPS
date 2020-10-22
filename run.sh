MIRROR=https://raw.githubusercontent.com/Colean128/CAPS/master
#MIRROR=https://ap.colean.cc/m
PART1OPTIONS=

curl -L ${MIRROR}/install-part1-${PART1OPTIONS}.sh >> install-part1.sh
rm -r run.sh
echo Run install-part1.sh to begin!
