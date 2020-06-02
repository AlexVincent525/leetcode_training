class MyCircularQueue(private val k: Int) {
    private var head: Int = -1
    private var tail: Int = -1
    var queue: Array<Int?>
    /** Initialize your data structure here. Set the size of the queue to be k. */

    init {
        this.queue = arrayOfNulls<Int>(k)
    }
    
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    fun enQueue(value: Int): Boolean {
        if (isFull()) {
            return false
        }
        if (head == -1) {
            head = 0
        }
        if (tail != k - 1) {
            tail++
        } else {
            tail = 0
        }
        queue.set(tail, value)
        return queue.get(tail) == value
    }

    /** Delete an element from the circular queue. Return true if the operation is successful. */
    fun deQueue(): Boolean {
		if (isEmpty()) {
            return false
        }
        if (queue.get(head) == null) {
            return false
        }
        queue.set(head, null)
        if (isEmpty()) {
            head = -1
            tail = -1
        } else {
            if (head != k - 1) {
                head++
            } else {
                head = 0
            }
        }
        return true
    }

    /** Get the front item from the queue. */
    fun Front(): Int? {
        if (head == -1) return -1
        return queue.get(head) ?: -1
    }

    /** Get the last item from the queue. */
    fun Rear(): Int? {
        if (tail == -1) return -1
		return queue.get(tail) ?: -1
    }

    /** Checks whether the circular queue is empty or not. */
    fun isEmpty(): Boolean {
		return queue.all { it == null }
    }

    /** Checks whether the circular queue is full or not. */
    fun isFull(): Boolean {
		return !queue.contains(null)
    }

}
