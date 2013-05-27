xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Offenerrat Münster"
    xml.description "Sitzungen der Gremien der Stadt Münster."
    xml.link sitzung_index_url

    for sitzung in @sitzungen
      xml.item do
        xml.title "#{sitzung.formatted_datetime} #{sitzung.gremium.title}" if sitzung.gremium
        xml.description sitzung.raum
        xml.pubDate 1.day.ago(sitzung.datum).to_s(:rfc822)
        xml.link sitzung_url(sitzung)
        xml.guid sitzung_url(sitzung)
      end
    end
  end
end
