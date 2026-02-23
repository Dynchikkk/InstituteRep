import React from 'react';
import Element from './Element';

function List({ value }) {
  return (
    <ul>
      {value.map((elementValue) => (
        <Element
          key={elementValue.id}
          value={elementValue.content}
        />
      ))}
    </ul>
  );
}

export default List;