require_relative "../ruby_data_structures/poly_tree_node.rb"
require_relative "../ruby_data_structures/queue.rb"

class KnightPathFinder
  attr_reader :starting_pos
  def initialize(starting_pos)
    @starting_pos = starting_pos
    @visited_positions = [starting_pos]
    build_move_tree(@starting_pos)
  end

  def find_path(end_pos)
    trace_path_back(@root_node.bfs(end_pos))
  end

  private
  attr_accessor :visited_positions, :root_node

  # --------------------------------------------------------------------
  def new_move_positions(pos)
    all_moves = get_all_moves(pos).select do |move|
      on_board?(move) && !@visited_positions.include?(move)
    end
    @visited_positions += all_moves unless all_moves.nil?

    all_moves
  end

  def on_board?(pos)
    pos.all? {|el|  el >= 0 && el <= 7}
  end

  def get_all_moves(pos)
    all_moves = []
    [-2,2].each do |two|
      [-1,1].each do |one|
        all_moves << [pos[0] + two, pos[1] + one]
        all_moves << [pos[0] + one, pos[1] + two]
      end
    end
    all_moves
  end

  # --------------------------------------------------------------------
  def build_move_tree(root_pos)
    @root_node = PolyTreeNode.new(root_pos)

    queue = Queue.new.enqueue(@root_node)
    until queue.empty?
      current_node = queue.dequeue
      next_moves = new_move_positions(current_node.value)

      next_moves.each do |move|
        new_node = PolyTreeNode.new(move)
        current_node.add_child(new_node)
        queue.enqueue(new_node)
      end
    end

  end

  # ---------------------------------------------------------------------
  def trace_path_back(node)
    path = []
    until node.parent.nil?
      path << node.value
      node = node.parent
    end

    path.reverse.unshift(@starting_pos)
  end
end
