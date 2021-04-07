module Codebreaker
  class Statistics
    def statistics
      @statistics ||= Codebreaker::DB.load_file('statistics')
    end

    def statistics_for_output
      sort_st_records(statistics)
      create_new_st_record(statistics)
    end

    def create_new_st_record(statistics)
      statistics.map do |record|
        "#{record[:name]}, '#{record[:difficulty]}'' difficulty, attempts total #{record[:attempts_total]},
        attempts used #{record[:attempts_used]}, hints used #{record[:hints_used]}"
      end
    end

    def sort_st_records(statistics)
      levels = %w[hard medium easy]
      statistics.sort_by! do |record|
        [levels.index(record[:difficulty]), -record[:attempts_used], -record[:hints_used]]
      end
    end
  end
end
