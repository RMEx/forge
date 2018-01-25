const fetchHead = function(array) {
  if (!array || array.length <= 0) {
    return null
  } return array[0]
}

export default {
  fetchHead: fetchHead
}
