class Tree2
    attr_accessor :children, :node_name
    
    def initialize(tree = {})
        @children = []
        # assume a single key (name) & value (which will be another map)
        @node_name = tree.keys[0]
        tree_children = tree.values[0] 
        # hash values are array types, but in this case it's really 
        # a hash map - flatten and convert back to a hash map
        tree_children.each do |child|
            children.push(Tree2.new(Hash[*child.flatten]))
        end
    end

    def visit_all(&block)
        visit(&block)
        children.each {|child| child.visit_all &block}
    end
    
    def visit(&block)
        block.call self
    end
end

ruby_tree = Tree2.new({'grandpa' => {'dad' => {'child1' => {}, 'child2' => {}}, 'uncle' => {'child3' => {}, 'child4' => {}}}})

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
