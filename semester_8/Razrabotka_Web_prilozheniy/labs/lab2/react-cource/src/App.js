import React, { useState, useEffect } from 'react';
import logo from './logo.svg';
import './App.css';
import List from './components/List';
import SearchInput from './components/SearchInput';
import useFilter from './hooks/useFilter';

const INITIAL_ARRAY = ['Belyaev', 'Demin', 'Sergunov'];

function App() {
  const [searchTerm, setSearchTerm] = useState('');
  const filteredArray = useFilter(INITIAL_ARRAY, searchTerm);

  // Title update
  useEffect(() => {
    if (searchTerm.trim() === '') {
      document.title = 'useEffect hook example';
    } else {
      document.title = `Найдено элементов: ${filteredArray.length}`;
    }
  }, [searchTerm, filteredArray]);

  const handleSearchChange = (e) => {
    setSearchTerm(e.target.value);
  };

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>Lab rab 2</p>
        <a className="App-link" href="https://www.youtube.com/watch?v=dQw4w9WgXcQ" target="_blank" rel="noopener noreferrer" >
          Learn React
        </a>

        <SearchInput value={searchTerm} onChange={handleSearchChange} />

        <List value={filteredArray} />
      </header>
    </div>
  );
}

export default App;