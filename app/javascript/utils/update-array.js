import { cloneDeep } from 'lodash'

const updateArray = (array, value, index) => {
  const clonedArray = cloneDeep(array)
  clonedArray[index] = value
  return clonedArray
}

export default updateArray
