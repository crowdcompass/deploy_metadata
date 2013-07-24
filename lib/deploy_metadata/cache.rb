class DeployMetadata::Cache

  def initialize(p)
    @str = p.call rescue 'n/a'
    @str = @str ? @str.dup.freeze : ''
    freeze
  end

  def to_s
    @str || ''
  end

end
