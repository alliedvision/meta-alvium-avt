
AVT_GIT_HOST ?= "github.com/alliedvision"
AVT_GIT_REPO ??= "${PN}"
AVT_GIT_PROTOCOL ?= "https"


SRC_URI = "git://git@${AVT_GIT_HOST}/${AVT_GIT_REPO};branch=${AVT_GIT_BRANCH};protocol=${AVT_GIT_PROTOCOL}"

