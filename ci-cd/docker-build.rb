#!/usr/bin/env ruby

$LOAD_PATH.unshift File.join(File.dirname(__FILE__))

require 'helpers'

module CICD
  class DockerBuild
    include Helpers

    def initialize
      is_release
    end
  end
end

CICD::DockerBuild.new

