atom_feed do |feed|
  feed.title("Offenerrat Münster")
  feed.updated(1.day.ago(@sitzungen.first.datum)) if @sitzungen.length > 0

  @sitzungen.each do |sitzung|
    feed.entry(sitzung) do |entry|
      entry.title(sitzung)
      entry.content(sitzung.description, :type => 'html')
      entry.url sitzung_url(sitzung)
    end
  end
end