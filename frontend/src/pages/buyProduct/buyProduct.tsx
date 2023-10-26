import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';

interface City {
  id: number;
  name: string;
}

interface Path {
  id: number;
  name: string;
}

const BuyProduct= () => {
  const id = useParams().id;
  const [count, setCount] = useState<number>(1);
  const [address, setAddress] = useState<string>('');
  const [city, setCity] = useState<City | null>(null);
  const [path, setPath] = useState<Path | null>(null);
  const [successMessage, setSuccessMessage] = useState<string>('');
  const [cities, setCities] = useState<City[]>([]);
  const [paths, setPaths] = useState<Path[]>([]);
  const [cityError, setCityError] = useState<string>('');

  useEffect(() => {
    const fetchCities = async () => {
      // const response = await fetch('/cities');
      // if (response.ok) {
      //   const cities = await response.json();
      //   setCities(cities);
      // }

      setCities([{id: 1, name: 'City 1'}, {id: 2, name: 'City 2'}]);
    };

    fetchCities();
  }, []);

  useEffect(() => {
    const fetchPaths = async () => {
      if (city) {
        // const response = await fetch(`/paths?cityId=${city.id}`);
        // if (response.ok) {
        //   const paths = await response.json();
        //   setPaths(paths);
        // }

        setPaths([{id: 1, name: 'Path 1'}, {id: 2, name: 'Path 2'}]);
      } else {
        setPaths([]);
      }
    };

    fetchPaths();
  }, [city]);

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    if (!city) {
      setCityError('Please select a city');
      return;
    }

    const response = await fetch('/buy', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({id, count, address, cityId: city.id, pathId: path?.id })
    });
    if (response.ok) {
      setSuccessMessage('Purchase successful!');
    }
  };

  return (
    <div>
      <h1>Buy {id}</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="count">Count:</label>
        <input type="number" id="count" name="count" value={count} onChange={(event) => setCount(parseInt(event.target.value))} required /><br /><br />
        <label htmlFor="address">Address:</label>
        <input type="text" id="address" name="address" value={address} onChange={(event) => setAddress(event.target.value)} required /><br /><br />
        <label htmlFor="city">City:</label>
        <select id="city" name="city" value={city?.id} onChange={(event) => {
          setCity(cities.find(city => city.id === parseInt(event.target.value)) || null);
          setPath(null);
          setCityError('');
        }} required>
          <option value="">Select a city</option>
          {cities.map(city => <option key={city.id} value={city.id}>{city.name}</option>)}
        </select>
        {cityError && <div style={{ color: 'red' }}>{cityError}</div>}
        <br /><br />
        {city && (
          <>
            <label htmlFor="path">Path:</label>
            <select id="path" name="path" value={path?.id} onChange={(event) => setPath(paths.find(path => path.id === parseInt(event.target.value)) || null)} required>
              <option value="">Select a path</option>
              {paths.map(path => <option key={path.id} value={path.id}>{path.name}</option>)}
            </select>
            <br /><br />
          </>
        )}
        <button type="submit">Buy</button>
      </form>
      {successMessage && <div>{successMessage}</div>}
    </div>
  );
};

export default BuyProduct;

  
