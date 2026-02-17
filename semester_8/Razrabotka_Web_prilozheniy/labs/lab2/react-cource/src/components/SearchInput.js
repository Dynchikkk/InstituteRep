import React from 'react';

function SearchInput({ value, onChange }) {
  return (
    <div style={{ margin: '20px' }}>
      <input
        type="text"
        placeholder="Поиск..."
        value={value}
        onChange={onChange}
      />
    </div>
  );
}

export default SearchInput;