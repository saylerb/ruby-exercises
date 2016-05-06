class Children
  def initialize
    @all_children = []
  end

  def <<(child)
    @all_children << child
  end

  def eldest
    @all_children.max_by { |child| child.age}
  end
end
