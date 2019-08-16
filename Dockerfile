#
# Copyright (C) 2011-2018 Red Hat, Inc. (https://github.com/Commonjava/indy)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM indy-binary-base

MAINTAINER John Casey <jdcasey@commonjava.org>

ADD $tarball_url /tmp/indy-launcher.tar.gz
RUN	tar -zxvf /tmp/indy-launcher.tar.gz -C /opt

RUN mkdir -p /indy/storage /indy/data /indy/logs /indy/etc /indy/ssh /opt/indy-git-etc
RUN chown -R indy:indy /indy/storage /indy/data /indy/logs /indy/etc /indy/ssh /opt/indy /opt/indy-git-etc
VOLUME /indy/storage /indy/data /indy/logs /indy/etc

ADD deployments/docker/scripts/start-indy.py /usr/local/bin/start-indy.py
RUN chmod 755 /usr/local/bin/*

USER 1001

ENTRYPOINT ["/usr/local/bin/dumb-init", "/usr/local/bin/start-indy.py"]
