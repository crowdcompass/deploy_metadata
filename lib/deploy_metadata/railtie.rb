class DeployMetadata::Railtie < Rails::Railtie

  initializer "deploy_metadata" do

    def DeployMetadata.current
      {}.tap { |h|
        h["Instance started"] = Started.to_s
        h["App deployed"] = Deployed.to_s
        h["Current revision"] = Revision.to_s
      }
    end

    Started = DeployMetadata::Cache.new lambda {
      Time.now.in_time_zone('Pacific Time (US & Canada)').strftime('%c')
    }

    Deployed = DeployMetadata::Cache.new lambda {
      Time.parse(Rails.root.split.last.to_s).in_time_zone('Pacific Time (US & Canada)').strftime('%c')
    }

    Revision = DeployMetadata::Cache.new lambda {
      version = nil
      [ Rails.root.join("../../shared/cached-copy/.git"), Rails.root.join(".git") ].each do |appdir|
        if Dir.exists?(appdir)
          version = `git --git-dir #{appdir} describe --tags`.chomp
          break
        end
      end
      version
    }

  end

end
