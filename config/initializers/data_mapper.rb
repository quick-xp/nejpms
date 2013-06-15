# coding: utf-8

module DataMapper
  class Collection < LazyArray

    def select_statement(repository_name = :default)
      DataMapper.repository(repository_name).adapter.__send__(:select_statement, self.query)
    end

  end
end

