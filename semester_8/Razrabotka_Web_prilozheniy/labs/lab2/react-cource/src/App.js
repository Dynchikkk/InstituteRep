import React, { useState, useEffect, useRef } from 'react';
import logo from './logo.svg';
import './App.css';
import List from './components/List';
import SearchInput from './components/SearchInput';
import useFilter from './hooks/useFilter';

const INITIAL_ARRAY = [
  { id: 1, content: 'Belyaev' },
  { id: 2, content: 'Demin' },
  { id: 3, content: 'Sergunov' }
];

function App() {
  const [searchTerm, setSearchTerm] = useState('');
  const filteredArray = useFilter(INITIAL_ARRAY, searchTerm);
  const hasSearched = useRef(false);

  useEffect(() => {
    document.title = !hasSearched.current 
      ? 'helloworld'
      : searchTerm.trim() === ''
        ? 'useEffect hook example'
        : `Найдено элементов: ${filteredArray.length}`;
  }, [searchTerm, filteredArray]);

  useEffect(() => {
    if (searchTerm.trim() !== '') {
      hasSearched.current = true;
    }
  }, [searchTerm]);

  const handleSearchChange = (e) => {
    setSearchTerm(e.target.value);
  };

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>Lab rab 2</p>

        <SearchInput 
          value={searchTerm} 
          onChange={handleSearchChange} 
        />

        <List value={filteredArray} />
      </header>
    </div>
  );
}

export default App;