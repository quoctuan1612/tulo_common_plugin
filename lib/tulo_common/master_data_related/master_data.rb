# frozen_string_literal: true

require 'csv'

module TuloCommon
  module MasterDataRelated
    module MasterData
      MASTER_DATA_DIR = "db/#{ENV.fetch('MASTER_DATA_DIR', 'master_data')}"

      def self.sorted_file_list
        files = Dir.glob(File.join(TuloCommon::MasterDataRelated::MasterData::MASTER_DATA_DIR, '*.csv'))
        dependents = files.each_with_object({}) do |path, seed|
          refs = ::CSV.table(path).headers
                                  .select { |h| h =~ /.*_id\z/ }
                                  .map { |h| h.to_s.gsub(/_ids?/, '') }
                                  .map(&:pluralize)
          weight = refs.length * 0.1
          refs.each do |table|
            seed[table] = (seed[table] || 0) + 1 - weight
          end
        end
        files.sort_by { |f| dependents[File.basename(f, '.csv')] || 0 }.reverse
      end
    end
  end
end
