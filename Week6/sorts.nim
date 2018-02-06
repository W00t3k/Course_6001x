import algorithm, random

proc bogoSort[T](s: var seq[T]) =
   while not isSorted(s, cmp):
      shuffle(s)

proc swapSort[T](s: var seq[T]) =
   for i in 0 ..< len(s):
      for j in i + 1 ..< len(s):
         if s[j] < s[i]:
            swap(s[i], s[j])

proc bubbleSort[T](s: var seq[T]) =
   var swap = false
   var n = len(s)
   while not swap:
      swap = true
      for j in 1 ..< n:
         if s[j-1] > s[j]:
            swap = false
            swap(s[j-1], s[j])
      dec(n)

proc selSort[T](s: var seq[T]) =
   for i in 0 ..< len(s):
      var minIndex = i
      var minVal = s[i]
      # searches for the smallest of all following items
      for j in i + 1 ..< len(s):
         if minVal > s[j]:
            minIndex = j
            minVal = s[j]
      swap(s[i], s[minIndex])

proc merge[T](left, right: seq[T]): seq[T] =
   result = @[]
   var i, j = 0
   while i < len(left) and j < len(right):
      if left[i] < right[j]:
         result.add(left[i])
         inc(i)
      else:
         result.add(right[j])
         inc(j)
   while i < len(left):
      result.add(left[i])
      inc(i)
   while j < len(right):
      result.add(right[j])
      inc(j)

proc mergeSort[T](s: seq[T]): seq[T] =
   if len(s) < 2:
      return s
   else:
      var middle = len(s) div 2
      var left = mergeSort(s[0 ..< middle])
      var right = mergeSort(s[middle ..< ^1])
      return merge(left, right)


var l = @[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
shuffle(l)

#bogoSort(l)
#swapSort(l)
#bubbleSort(l)
#selSort(l)
echo mergeSort(l)
