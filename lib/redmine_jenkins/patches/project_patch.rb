require_dependency 'project'

module RedmineJenkins
  module Patches
    module ProjectPatch

      def self.included(base)
        base.class_eval do
          unloadable

          has_one :jenkins_setting, dependent: :destroy
        end
      end

    end
  end
end

unless Project.included_modules.include?(RedmineJenkins::Patches::ProjectPatch)
  Project.send(:include, RedmineJenkins::Patches::ProjectPatch)
end
