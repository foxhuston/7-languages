
#print the contents of an array of 16 numbers, 4 at a time

numbers = *(1..16)

numbers.each { |n|
    print "#{n} "
    puts "" if n % 4 == 0
}

# Same with each_slice from enumerable

(1..16).each_slice(4) { |a| puts a.inject("") { |acc, x| acc + "#{x} " } }


class Tree
    attr_accessor :children, :node_name

    def initialize (name, children=[])
        @children = children
        @node_name = name
    end

    def visit_all (&block)
        visit &block
        children.each { |c| c.visit_all &block }
    end

    def visit(&block)
        block.call self
    end
end


#Better tree initialization
class Hash
    def to_tree
        _to_tree.first
    end

    def _to_tree
        self.map { |name, children| Tree.new(name, children._to_tree) }
    end
end

t = {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => { 'child 3' => {}, 'child 4' => {} } } }.to_tree

# Grep a file
def grep(file_name, expr)
    IO.foreach(file_name) { |x| puts x if expr =~ x }
end
