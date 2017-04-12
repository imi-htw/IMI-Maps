#!/usr/bin/env ruby

$LOAD_PATH.unshift File.join(File.dirname(__FILE__))

require 'helpers'

module CICD
  class DockerBuild
    include Helpers::General
    include Helpers::Travis

    def initialize
      @root = File.dirname(File.expand_path(File.join(__FILE__, '..')))
    end

    def start
      if environment = is_release
        puts "Building image for environment: #{environment} with tag #{tag}"
        in_environment(environment) do
          system("cd #{@root} && docker build . -t imimaps-#{environment}:#{tag}")
          system("docker images | grep imimaps")
        end
      else
        puts "Current build environment is neither master branch nor a tagged release. Exiting."
        exit 0
      end
    end

    def push
    end

    def deploy
    end
  end
end

CICD::DockerBuild.new.start

