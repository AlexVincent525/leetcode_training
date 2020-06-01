///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/06/01 21:32
///
import 'dart:math' as math;

extension CharAtExtension on String {
  String chatAt(int index) => this.substring(index, index + 1);
}

class Solution {
  int lengthOfLongestSubstring(String s) {
    /// Return zero when nothing in the string.
    if (s.isEmpty) {
      return 0;
    }

    /// Create a `Set` to unique the character in the string;
    final Set<String> set = <String>{};
    final int l = s.length;

    /// Defined right cursor for selection. Start with -1 means
    /// the cursor hasn't been moved.
    int rc = -1;
    int max = 0;
    for (int i = 0; i < l; i++) {
      if (i != 0) {
        /// Remove the character at last position.
        set.remove(s.chatAt(i - 1));
      }

      /// Move the cursor continually, start from 0.
      /// Stop the loop when detected the same character.
      while (rc + 1 < l && !set.contains(s.chatAt(rc + 1))) {
        set.add(s.chatAt(rc + 1));
        ++rc;
      }

      /// Update the max value according the last loop.
      max = math.max(max, rc - i + 1);
    }
    return max;
  }
}

void main() {
  print(Solution().lengthOfLongestSubstring('aaaaaaaa'));
  print(Solution().lengthOfLongestSubstring('abcabcaa'));
}
