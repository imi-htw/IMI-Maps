#!/usr/bin/env ruby

module CICD

  module Helpers

    module Travis
      # determines, whether the current build is a tagged release or not
      def is_release
        if ENV["TRAVIS_TAG"] && ENV["TRAVIS_BRANCH"] == "master"
          :staging
        elsif ENV["TRAVIS_TAG"] && (ENV["TRAVIS_BRANCH"] == ENV["TRAVIS_TAG"])
          :production
        else
          # not on branch master + no tagged release
          # => no need to build
          false
        end
      end

      def tag
        if ENV["TRAVIS_TAG"] && ENV["TRAVIS_COMMIT"]
          ENV["TRAVIS_TAG"]
        elsif ENV["TRAVIS_TAG"].nil? && ENV["TRAVIS_COMMIT"]
          ENV["TRAVIS_COMMIT"]
        else
          puts "This does not feel like travis. Exiting."
          exit 1
        end
      end
    end

    module General

      # copy files for the environment to root, execute block, clean up when done
      def in_environment(environment, *extra_files)
        environment_files = [
          ".env-#{environment}",
          "docker-compose-#{environment}.yml",
         'docker-entrypoint.sh',
         'Dockerfile'
        ].concat(extra_files)

        environment_files.each do |file|
          puts "copying #{file} to root"
          `cp #{path('.docker', environment.to_s, file)} #{File.dirname(File.expand_path(File.join(__FILE__, '..')))}`
        end

        begin
          yield
        rescue
        ensure
          environment_files.each do |file|
            puts "removing #{file}"
            `rm #{path(file)}`
          end
        end

      end

      def path(root = File.dirname(File.expand_path(File.join(__FILE__, '..'))), *path)
        File.join(root, *path)
      end


      def system_call(command)
        PTY.spawn(command) do |stdout, stdin, pid|
          stdout.each do |line|
            puts line
          end
        end
      end
    end
  end
end

#CICD::Helpers::is_release
