module Entities
  class Error < Grape::Entity
    expose :error, documentation: {type: String, desc: '错误原因'}
  end
end
