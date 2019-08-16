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

FROM centos

MAINTAINER John Casey <jdcasey@commonjava.org>

EXPOSE 8080 8081 8000

ADD https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 /usr/local/bin/dumb-init

USER root

RUN chmod +x /usr/local/bin/*
RUN	yum -y update
RUN	yum -y install wget git tar which curl tree java-1.8.0-openjdk-devel
RUN	yum clean all
RUN	groupadd -g 1000 indy
RUN	useradd -u 1000 -g indy --no-create-home -s /bin/false -d /opt/indy indy

