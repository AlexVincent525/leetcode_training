///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/03 23:40
///
void main() {
  final Node nodeG = Node('G');
  final Node nodeF = Node('F', siblings: <Node>[nodeG]);
  final Node nodeE = Node('E');
  final Node nodeD = Node('D', siblings: <Node>[nodeG]);
  final Node nodeC = Node('C', siblings: <Node>[nodeF]);
  final Node nodeB = Node('B', siblings: <Node>[nodeE]);
  final Node nodeA = Node('A', siblings: <Node>[nodeB, nodeC, nodeD]);

  final List<Node> queue = <Node>[];
  int step = 0;
  queue.add(nodeA);
  while (queue.isNotEmpty) {
    ++step;
    final int currentNodes = queue.length;
    for (int i = 0; i < currentNodes; i++) {
      final Node currentNode = queue.first;
      if (currentNode.name == nodeG.name) {
        print('Finished: $step');
        return;
      }
      for (final Node node in currentNode.siblings ?? []) {
        queue.add(node);
      }
      queue.removeAt(0);
    }
  }
}

class Node {
  Node(this.name, {this.siblings});

  final String name;
  final List<Node> siblings;
  
  @override
  String toString() {
    return 'Node($name)';
  }
}
