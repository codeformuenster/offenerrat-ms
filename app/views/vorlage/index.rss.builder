xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Offenerrat Münster"
    xml.description "Vorlagen der Stadt Münster für die Beratung und Entscheidung in den Gremien der Stadt Münster."
    xml.link vorlage_index_url

    for vorlage in @vorlagen
      xml.item do
        xml.title vorlage.title
        xml.pubDate vorlage.datum.to_s(:rfc822)
        xml.link vorlage_url(vorlage)
        xml.guid vorlage_url(vorlage)
      end
    end
  end
end
