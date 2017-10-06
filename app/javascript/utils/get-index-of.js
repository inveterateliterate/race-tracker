const getIndexOf = (array, func) => {
  for (let i=0; i < array.length; i++) {
    if(func(array[i])) return i
  }
  return -1
}

export default getIndexOf
