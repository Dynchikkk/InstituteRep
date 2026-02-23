import { useState, useEffect } from 'react';

function useFilter(initialArray, searchTerm) {
  const [filteredArray, setFilteredArray] = useState(initialArray);

  useEffect(() => {
    const filtered = initialArray.filter(item =>
      item.content.toLowerCase().includes(searchTerm.toLowerCase())
    );
    setFilteredArray(filtered);
  }, [initialArray, searchTerm]);

  return filteredArray;
}

export default useFilter;