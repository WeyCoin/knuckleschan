module KnucklesChan::Helper
  class Res
    def self.json(data=nil, status=200,)
      return { 
        "status" => status,
        "data" => data
      }.to_json
    end

    def self.error(error=nil, status=500)
      return { 
        "status" => status,
        "error" => error
      }.to_json
    end
  end
end