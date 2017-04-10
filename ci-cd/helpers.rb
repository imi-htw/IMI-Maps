#!/usr/bin/env ruby

module CICD
  module Helpers
    # determines, if we're running in travis
    def is_travis
      if ENV["TRAVIS"].nil?
        false
      else
        true
      end
    end

    # determines, if the current build is a tagged release or not
    def is_release
      if ENV["TRAVIS_TAG"] && ENV["TRAVIS_BRANCH"] == "master"
        puts "STAGING RELEASE "
        true
      elsif ENV["TRAVIS_TAG"] && (ENV["TRAVIS_BRANCH"] == ENV["TRAVIS_TAG"])
        puts "PRODUCTION / TAGGED RELEASE"
        true
      else
        puts "NOT A STAGING OR PRODUCTION RELEASE"
        false
      end
    end
  end
end

#CICD::Helpers::is_release
