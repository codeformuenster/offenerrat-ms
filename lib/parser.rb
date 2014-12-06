require 'wombat'
require 'pry'

module Parser
  class Vorlagen
    attr_reader :parser
    def initialize
      @parser = VorlageParser.new
    end

    def new_vorlagen
      vorlagen.each do |vorlage|
        create_or_update_vorlage(vorlage)
      end
    end

    def create_or_update_vorlage(vorlagen_result)
      v = Vorlage.find_by_stadt_id( vorlagen_result["stadt_id"]) || Vorlage.create(stadt_id: vorlagen_result["stadt_id"])
      v.title = vorlagen_result["title"]
      v.detail_url = vorlagen_result["detail_url"]
      v.save
    end

    def result
      @result ||= @parser.crawl
    end

    def vorlagen
      result["vorlagen"]
    end

    class VorlageParser
      include Wombat::Crawler

      base_url "https://www.stadt-muenster.de"
      path "/sessionnet/sessionnetbi/vo0042.php"

      vorlagen "xpath=//div[@id='smccontent']/table/tbody/tr", :iterator do
        title xpath: "./td/a/@title" do |e|
          e.gsub(/Vorlage anzeigen: /,'') if e
        end
        detail_url xpath: "./td/a/@href"
        detail "xpath=./td/a", :follow do
          testsre xpath: '//*[@id="smccontent"]/h1'
          name xpath: '//*[@id="smctablevorgang"]/tbody/tr[1]/td[2]'
          datum xpath: '//*[@id="smctablevorgang"]/tbody/tr[3]/td[2]'
          long_name xpath: '//*[@id="smctablevorgang"]/tbody/tr[4]/td[2]'
          beratungen 'xpath=//*[@id="smccontent"]/table[@summary="Inhalt der Tabelle: Beratungen der Vorlage"]/tbody/tr[1]', :iterator do
            datum xpath: './td[1]/a'
            sitzungs_link xpath: './td[1]/a/@href'
            gremium xpath: './td[2]'
            top xpath: './td[3]'
            type xpath: './td[4]'
            entscheidung xpath: './td[5]'
          end
          naechste_beratungen 'xpath=//*[@id="smccontent"]/table[@summary="Inhalt der Tabelle: Weitere Beratungsfolge der Vorlage"]/thead/tr[2]', :iterator do
            datum xpath: './td[1]/a'
            sitzungs_link xpath: './td[1]/a/@href'
            gremium xpath: './td[2]'
            entscheidung xpath: './td[4]'
          end
        end
        stadt_id xpath: "./td/a/@href" do |e|
          e.split("kvonr=")[1] if e
        end
      end
    end
  end
end
