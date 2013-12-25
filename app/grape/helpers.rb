# coding: utf-8
module KeKe
  module APIHelpers
    
    def render_json(data)
      body ( { code: 0, message:'ok', data:data } )
    end
    
    def render_success
      { code: 0, message: 'ok' }
    end
    
    def render_success_with_data(data)
      { code: 0, message: 'ok', data: data }
    end
    
    def render_success_with_body(data)
      body ( { code: 0, message:'ok', data: data } )
    end
    
    def render_404_json
      render_error_json(2001, '数据为空')
    end
    
    def render_error_json(code, message)
      { code: code, message: message, data: [] }
    end
    
    def render_error_json_no_data(code, message)
      { code: code, message: message }
    end
  
  end
end