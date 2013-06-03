atom_feed do |feed|
  feed.title("Offenerrat Münster: #{@subject.title}")
  feed.updated(@subject.vorlagen.first.created_at)

  @subject.vorlagen.each do |vorlage|
    feed.entry(vorlage) do |entry|
      entry.title(vorlage)
      entry.content(vorlage.description, :type => 'html')
      entry.link href: vorlage_url(vorlage)
      entry.author do |author|
        author.name("or")
      end
    end
  end
end
