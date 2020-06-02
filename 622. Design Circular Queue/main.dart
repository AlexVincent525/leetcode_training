///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/02 23:30
///
void main() {
  final MyCircularQueue obj = MyCircularQueue(3);
  final bool param_1 = obj.enQueue(1);
  print(param_1);
  final bool param_2 = obj.enQueue(2);
  print(param_2);
  final bool param_3 = obj.enQueue(3);
  print(param_3);
  final bool param_4 = obj.enQueue(4);
  print(param_4);
  final bool param_5 = obj.deQueue();
  print(param_5);
  final int param_6 = obj.front();
  print(param_6);
  final int param_7 = obj.rear();
  print(param_7);
  final bool param_8 = obj.isEmpty();
  print(param_8);
  final bool param_9 = obj.isFull();
  print(param_9);
}

class MyCircularQueue {
  /// Initialize your data structure here. Set the size of the queue to be k.
  MyCircularQueue(this.k) {
    _queue = List<int>(k);
  }

  final int k;

  int head = -1, tail = -1;

  List<int> _queue;

  List<int> get queue => _queue;

  /// Insert an element into the circular queue. Return true if the operation is successful.
  bool enQueue(int value) {
    if (isFull()) {
      return false;
    }
    if (head == -1) {
      head = 0;
    }
    if (tail != k - 1) {
      tail++;
    } else {
      tail = 0;
    }
    queue[tail] = value;
    return queue.elementAt(tail) == value;
  }

  /// Delete an element from the circular queue. Return true if the operation is successful.
  bool deQueue() {
    if (isEmpty()) {
      return false;
    }
    queue[head] = null;
    if (isEmpty()) {
      head = -1;
      tail = -1;
    } else {
      if (head != k - 1) {
        head++;
      } else {
        head = 0;
      }
    }
    return true;
  }

  /// Get the front item from the queue.
  int front() {
    if (head == -1) return -1;
    return queue.elementAt(head) ?? -1;
  }

  /// Get the last item from the queue.
  int rear() {
    if (tail == -1) return -1;
    return queue.elementAt(tail) ?? -1;
  }

  /// Checks whether the circular queue is empty or not.
  bool isEmpty() {
    return !queue.any((int it) => it == null);
  }

  /// Checks whether the circular queue is full or not.
  bool isFull() {
    return !queue.contains(null);
  }
}
