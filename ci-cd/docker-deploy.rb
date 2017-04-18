#!/usr/bin/env ruby

$LOAD_PATH.unshift File.join(File.dirname(__FILE__))

require 'helpers'

module CICD
  class DockerDeploy
    include Helpers::Travis
    include Helpers::General

    def initialize
      @root = File.dirname(File.expand_path(File.join(__FILE__, '..')))
    end

    def start
      if environment = is_release
        puts "Building image for environment: #{environment} with tag #{tag}"
        in_environment(environment) do
          deploy_command = "scp -i id_rsa_#{environment} -o StrictHostKeyChecking=no docker-compose-#{environment}.yml docker-deploy@imimaps-#{environment}.dev-sector.net:~  && \
            ssh  -i id_rsa_#{environment} -o StrictHostKeyChecking=no docker-deploy@imimaps-#{environment}.dev-sector.net \"export TAG=#{tag}; docker-compose -f ~/docker-compose-#{environment}.yml\" up -d"
            system(deploy_command)
        end
      else
        puts "Current build environment is neither master branch nor a tagged release. Exiting."
        exit 0
      end
    end
  end
end

CICD::DockerDeploy.new.start
