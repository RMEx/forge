const key = "forge-priv-data-"
const mkKey = (value) => key + value

const store = function(key, value) {
  const k = mkKey(key)
  const obj = JSON.stringify(value)
  localStorage.setItem(k, obj)
}

const fetch = function(key) {
  const k = mkKey(key)
  return JSON.parse(localStorage.getItem(k))
}

const remove = function(key) {
  const k = mkKey(key)
  localStorage.removeItem(k)
}

const clear = function(key) {
  localStorage.clear()
}

const hasKey = function(key) {
  const value = fetch(key)
  return value !== null
}

export default {store, fetch, remove, clear, hasKey}
