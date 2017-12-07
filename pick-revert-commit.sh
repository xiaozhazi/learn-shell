#! /bin/bash

set -xe

:${ACTION:?ACTION is not given.}
:${BUILD_GROUP:?BUILD_GROUP is not given.}
:${REPOSITORY_URL:?REPOSITORY_URL is not given.}
:${TARGET_TAG:?TARGET_TAG is not given.}
:${TARGET_COMMIT_LIST:?TARGET_COMMIT_LIST is not given.}
:${HUE_RELEASE_BRANCH:=develop}

if [[ "${PUSH_TAG}" == false ]]; then
  :${TARGET_BRANCH:?TARGET_BRANCH must be specified if not PUSH_TAG.}
fi

PUSH_BRANCH=false
if [[ -z ${TARGET_BRANCH} ]]; then
  TARGET_BRANCH=${BUILD_TAG}
  else
    PUSH_BRANCH=true
fi

REPO_LIST=${BUILD_GROUP}.release
RETRY_INTERVAL=2

GIT_CACHE_DIR="/home/jenkins/git_cache/${BUILD_GROUP}"

git_clone(){
  local git_repository_url=${1:?is not given.}
  local base_dir=${2:?is not given.}
  local git_cache_dir=${3:?is not given.}
  local repository=$(echo ${git_repository_url} | sed "s|.*/\(.*\).git|\1|")
  local retry_interval=1

  if [[ ! -d "${git_cache_dir}/${repository}" ]]; then
    for i in {0..4}; do
      git clone "${git_repository_url}" "${git_cache_dir}/${repository}" &&
        break || {
      [[ $i -ge 4 ]] && exit 1
      echo "clone ${repository} $i"
      sleep ${retry_interval}
    }
    done
  else
    cd ${git_cache_dir}/${repository}
    git reset HEAD --hard && git clean -fdx
    git checkout develop || true
    for i in {0..4}; do
      git pull && break || {
      [[ $i -ge 4 ]] && exit 1
      echo "pull ${repository} $i"
      sleep ${retry_interval}
    }
    done 
  fi

  if [[ ! -d "${base_dir}/${repository}" ]]  ; then 
    cp -r "${git_cache_dir}/${repository}" "${base_dir}/${repository}"
  fi
}

if [[ "${ACTION}" != "cherry-pick" && "${ACTION}" != "revert" ]]; then
  echo "ACTION ${ACTION} is invalid, must be cherry-pick or revert"
  exit 1;
fi

for i in {0..4}; do
  curl -LKsSfO
  http://product-ci/tools/hue-release/raw/${HUE_RELEASE_BRANCH}/release_modules/${REPO_LIST} \
  > ${REPO_LIST} && break || {
    [[ $i -ge 4 ]] && exit 1
    sleep ${RETRY_INTERVAL}
  }
done

# exit if it's not in release list
if [[ -z $(grep "${REPOSITORY_URL}" "${REPO_LIST}") ]]; then
  echo "${REPOSITORY_URL} is not a ${BUILD_GROUP} repository"
  exit 1
fi

# git clone
repository=$(echo ${REPOSITORY_URL} | sed "s|.*/\(.*\).git|\1|")
if [[ !-d "${WORKSPACE}/${repository}/.git" ]]; then
  # NOTE: if error occured, retry clone
  git clone "${REPOSITORY_URL}" "${WORKSPACE}" "${GIT_CACHE_DIR}"
fi

cd "${WORKSPACE}/${repository}" && {
  git reset HEAD --hard
  git fetch --tags

  if [ -n "$(git branch | sed -e "s/ //g" | grep -x ${TARGET_BRANCH})" ]; then
    git branch -D ${TARGET_BRANCH} || true 
  fi
  git checkout ${TARGET_TAG}
  git reset HEAD^ --hard
  git checkout -b ${TARGET_BRANCH}

  echo -e "${TARGET_COMMIT_LIST}" | while read commit; do
    git ${ACTION} ${commit}
  done

  if [[ "${PUSH_BRANCH}" == true ]]; then
    git push -u origin ${TARGET_BRANCH} 
  fi

  if [[ "${PUSH_TAG}" == true ]]; then
    if [[ "${BUILD_GROUP}" == "bt" ]]; then
      SET_VERSION=${WORKSPACE}/set-version.sh
      curl --retry 3 -LksSf
      https://scm*****/operation/release-build/raw/${RELEASE_BUILD_BRANCH}/resources/scripts/release/scripts/release/build/set-version.sh
      > ${SET_VERSION}
      
      NEW_VERSION=${TARGET_TAG}
      SERVICE_GROUP_VERSIONS="bt:${TARGET_TAG}"
      PROJECT_CODE=${BUILD_GROUP}
      WORKSPACE=${WORKSPACE}/${repository}
      source ${SET_VERSION}
    else
      git push -u origin ${TARGET_BRANCH}
      sed +x
      echo "==============================================================="
      echo "Does not support set-version for product side ${BUILD_GROUP} group!"
      echo "Please run ${BUILD_URL%/*/*/*}/${BUILF_GROUP}/job/set-version-trigger"
      echo "for target revision ${TARGET_BRANCH} manually!"
    fi
  fi

}
