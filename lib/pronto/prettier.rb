require "pronto"
require "pronto/prettier/version"

module Pronto
  class Prettier < Runner
    EXTNAMES = %w[.jsx .js].freeze

    def run
      if javascript_files.any?
        run_prettier_check!
      else
        []
      end
    end

    private

    def javascript_files
       @patches
        .select { |patch| patch.additions > 0 }
        .map(&:new_file_full_path)
        .select { |file| EXTNAMES.include?(File.extname(file))  }
    end

    def run_prettier_check!
      status = false

      if ENV['LOG_PRONTO']
        Logger.new(STDOUT).info("prettier --check #{javascript_files.join(' ')}")
        status = system("prettier --check #{javascript_files.join(' ')}")
      else
        status = system("prettier --check #{javascript_files.join(' ')} &> /dev/null")
      end

      if status
        []
      else
        msg = 'Code style issues found in the file. Forgot to run `yarn format`?'
        javascript_files.map { |js| Message.new(js, nil, :warning, msg, nil, self.class) }
      end
    end
  end
end
