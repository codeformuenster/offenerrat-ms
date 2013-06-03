class PgSearch::Document
  def self.wildcard_search(query)
    return {} if query.nil? || query.empty?
    records = self.where(["(content ILIKE ?) OR (content ILIKE ?) OR (content ILIKE ?)", "%#{query}%", "#{query}%","%#{query}"]).map{ |d| d.searchable }
    records_hash = records.group_by{ |s| s.class }.delete_if{ |klass, _| klass == NilClass }
    order_records_hash(records_hash)
  end

  def self.order_records_hash(records_hash)
    preferred_order = [Vorlage, Sitzung]
    result = {}
    preferred_order.each do |klass|
      result[klass] = records_hash.delete(klass) if records_hash.has_key?(klass)
    end
    result.merge(records_hash)
  end
end
