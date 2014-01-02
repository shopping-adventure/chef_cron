##
# Cookbook Name:: cron
# Recipe:: default
#
# Copyright 2012, Kbrw adventure
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#Retrieve all cron from the cron attribut
if (node["cron"])
  node["cron"].each do |name,crontab|
    cronmn=crontab["minute"]
    cronhr=crontab["hour"]
    cronday=crontab["day"]
    cronmon=crontab["month"]
    cronjr=crontab["jour"]
    cronuser=crontab["user"]
    cronshell=crontab["shell"]
    cronpath=crontab["path"] || ""
    croncommand=crontab["command"]
    cron "#{name}" do
      hour "#{cronhr}" || "1"
      minute "#{cronmn}" || "*"
      day "#{cronday}" || "*"
      month "#{cronmon}" || "*"
      weekday "#{cronjr}" || "*"
      mailto "root"
      shell "#{cronshell}" || "/bin/bash"
      user "#{cronuser}" || "root"
      command "#{croncommand}"
      path "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin#{cronpath}"
      if crontab["active"] == "true" 
        Chef::Log.info("Cron : Create")
        action :create
      else
        Chef::Log.info("Cron : Delete")
        action :delete
      end
    end
  end
end
