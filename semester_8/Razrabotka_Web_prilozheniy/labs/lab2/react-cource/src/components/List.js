import React from 'react';
import Element from './Element';

function List({ value }) {
  return (
    <ul>
      {value.map((item, index) => (
        <li key={index}>
          <Element value={item} />
        </li>
      ))}
    </ul>
  );
}

export default List;