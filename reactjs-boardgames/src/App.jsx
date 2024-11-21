import React, { useState, useEffect } from 'react';
import './App.css';
import boardGamesImg from "./assets/bgames.jpg";

export function getInitialBoardGames() {
  return [
    { name: "Catan", origin: "react App", played: false },
    { name: "Splendor", origin: "react App", played: false },
  ];
}

function App() {
  const [boardGames, setBoardGames] = useState(getInitialBoardGames());
  const [totalPlayed, setTotalPlayed] = useState(0);
  const [nodeJsServerError, setNodeJsServerError] = useState(false);
  const [pythonServerError, setPythonServerError] = useState(false);
  const [javaServerError, setJavaServerError] = useState(false);

  useEffect(() => {
    totalPlayedGames();
  }, [boardGames]);

  useEffect(() => {
    handleNodeAPILoad();
  }, []);

  useEffect(() => {
    handlePythonAPILoad();
  }, []);

  useEffect(() => {
    handleJavaAPILoad();
  }, []);

  const totalPlayedGames = () => {
    const total = boardGames.filter(game => game.played).length;
    setTotalPlayed(total);
  }

  const handleChekAGame = (gameName, event) =>{
    const checkValue = event.target.checked;
    const updatedGames = boardGames.map((game) => {
      if (game.name == gameName.name) {
        game.played = checkValue;
      }
      return game;
    });
    setBoardGames(updatedGames);
  }

  
  const handleNodeAPILoad = () => handleAPILoad('/node-api/boardgames', setNodeJsServerError);
  const handlePythonAPILoad = () => handleAPILoad('http://localhost:3000/boardgames', setPythonServerError);
  const handleJavaAPILoad = () => handleAPILoad('http://localhost:8082/boardgames', setJavaServerError);

  const handleAPILoad = async (apiUrl, setErrorState) => {
    try {
      const response = await fetch(apiUrl);
      const data = await response.json();
      setErrorState(false);
      console.log(`Games to add from the ${apiUrl} application:`, data);
      updateBoardGamesNoDuplicate(data);
    } catch (error) {
      console.error(`Error fetching boardgames from ${apiUrl}:`, error);
      setErrorState(true);
    }
  }

  const updateBoardGamesNoDuplicate = (newGames) => {
    setBoardGames(prevBoardGames => {
      const gameMap = new Map();
      [...prevBoardGames, ...newGames].forEach(game => gameMap.set(game.name, game));
      return Array.from(gameMap.values());
    });
  }

  const renderGames = () => {
    return boardGames.map((game, index) => {
      return (
        <li key={index}>
          <div className="container">
            <p>{game.name} from {game.origin}</p>
            <input type="checkbox"
            onChange={(event)=> handleChekAGame(game, event)} />
          </div>
        </li>
      );
    });
  };

  return <div className="App">
    
    <div>
     <div>
        <h4 className="played">Played {totalPlayed}</h4>
        {nodeJsServerError && <h4 className="played">NodeJS Boardgames Sever Not Available. Check logs in browser for more details</h4>}
        {pythonServerError && <h4 className="played">Python Boardgames Sever Not Available. Check logs in browser for more details</h4>}
        {javaServerError && <h4 className="played">Java Boardgames Sever Not Available. Check logs in browser for more details</h4>}  
        <div className="Header">
          <h1>Boardgames List</h1>
          <img src={boardGamesImg} alt="" /> 
        </div>
      </div>
      <ul>{renderGames()}</ul>
    </div>

  </div>;
}

export default App
