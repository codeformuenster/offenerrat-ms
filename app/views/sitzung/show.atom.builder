atom_feed do |feed|
  feed.title("#{@sitzung.gremium} am #{@sitzung.formatted_datetime}")
  feed.updated(@sitzung.updated_at)

  @sitzung.vorlagen.each do |vorlage|
    feed.entry(vorlage) do |entry|
      entry.title("Neue Vorlage: #{vorlage}")
      entry.content(vorlage.description, :type => 'html')
      entry.link href: vorlage_url(vorlage)
      entry.author do |author|
        author.name("or")
      end
    end
  end
end