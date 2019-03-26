require "pronto"
require "pronto/prettier/version"

module Pronto
  class Prettier < Runner
    VERSION = "0.1.0"
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
        .map(&:new_file_full_path)
        .select { |file| EXTNAMES.include?(File.extname(file))  }
    end

    def run_prettier_check!
      msg = `prettier --check #{javascript_files.join(' ')}`

      if $CHILD_STATUS.success?
        []
      else
        [Message.new(nil, nil, :error, msg, nil, self.class)]
      end
    end
  end
end
