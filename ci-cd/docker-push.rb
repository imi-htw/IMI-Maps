#!/usr/bin/env ruby

$LOAD_PATH.unshift File.join(File.dirname(__FILE__))

require 'helpers'

module CICD
  class DockerPush
    include Helpers::Travis

    def initialize
      @root = File.dirname(File.expand_path(File.join(__FILE__, '..')))
    end

    def start
      if environment = is_release
        push_command = "docker login -u #{ENV["DOCKER_USERNAME"]} -p #{ENV["DOCKER_PASSWORD"]} && \
          docker push imimaps/#{environment}:#{tag}"
          system(push_command)
      else
        puts "Current build environment is neither master branch nor a tagged release. Exiting."
        exit 0
      end
    end
  end
end

CICD::DockerPush.new.start

