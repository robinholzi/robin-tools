# quantco
export PRE_COMMIT_USE_MICROMAMBA=1
export GCR_PAT=
export CR_PAT=
# echo $GCR_PAT | docker login ghcr.io -u USERNAME --password-stdin

# Artifactory
export ARTIFACTORY_TOKEN=
# pixi auth login quantco.jfrog.io --username robin.holzinger@quantco.com --password $ARTIFACTORY_TOKEN
export ARTIFACTORY_USERNAME_ENC=robin.holzinger%40quantco.com
export ARTIFACTORY_USERNAME="robin.holzinger%40quantco.com"
export ARTIFACTORY_USERNAME="robin.holzinger@quantco.com"

export ARTIFACTORY_PASSWORD=""
