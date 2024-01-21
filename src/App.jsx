import { useState } from "react";
import reactLogo from "./assets/react.svg";
import aleoLogo from "./assets/aleo.svg";
import "./App.css";
import helloworld_program from "../helloworld/build/main.aleo?raw";
import battleship from "../battleship/build/main.aleo?raw";
import board from "../battleship/build/imports/board.aleo?raw";
import move from "../battleship/build/imports/move.aleo?raw";
import verify from "../battleship/build/imports/verify.aleo?raw";

import { AleoWorker } from "./workers/AleoWorker.js";

const aleoWorker = AleoWorker();
function App() {
  const [count, setCount] = useState(0);
  const [account, setAccount] = useState(null);
  const [executing, setExecuting] = useState(false);
  const [deploying, setDeploying] = useState(false);

  const generateAccount = async () => {
    const key = await aleoWorker.getPrivateKey();
    setAccount(await key.to_string());
  };

  async function initialize_board() {
    const inputValue = prompt(
      "Enter a carrier value (e.g., 34084860461056u64):"
    );
    const inputValue2 = prompt(
      "Enter a battleship value (e.g.,551911718912u64):"
    );
    const inputValue3 = prompt("Enter a cruiser value (e.g., 7u64):");
    const inputValue4 = prompt(
      "Enter a destroyer value (e.g., 1157425104234217472u64):"
    );
    const inputValue5 = prompt(
      "Enter a player value (e.g., aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry~):"
    );

    setExecuting(true);
    const result = await aleoWorker.localProgramExecution(
      battleship,
      "initialize_board",
      [inputValue, inputValue2, inputValue3, inputValue4, inputValue5]
    );
    setExecuting(false);

    alert(JSON.stringify(result));
  }

  async function deploy() {
    setDeploying(true);
    try {
      const result = await aleoWorker.deployProgram(battleship);
      console.log("Transaction:");
      console.log("https://explorer.hamp.app/transaction?id=" + result);
      alert("Transaction ID: " + result);
    } catch (e) {
      console.log(e);
      alert("Error with deployment, please check console for details");
    }
    setDeploying(false);
  }

  return (
    <>
      <div>
        <a href="https://aleo.org" target="_blank">
          <img src={aleoLogo} className="logo" alt="Aleo logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Aleo + React</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          <button onClick={generateAccount}>
            {account
              ? `Account is ${JSON.stringify(account)}`
              : `Click to generate account`}
          </button>
        </p>
        <p>
          <button disabled={executing} onClick={initialize_board}>
            {executing
              ? `Executing...check console for details...`
              : `initialize_board battleship.aleo`}
          </button>
        </p>
        <p>
          Edit <code>src/App.jsx</code> and save to test HMR
        </p>
      </div>

      {/* Advanced Section */}
      <div className="card">
        <h2>Advanced Actions</h2>
        <p>
          Deployment on Aleo requires certain prerequisites like seeding your
          wallet with credits and retrieving a fee record. Check README for more
          details.
        </p>
        <p>
          <button disabled={deploying} onClick={deploy}>
            {deploying
              ? `Deploying...check console for details...`
              : `Deploy battleship.aleo`}
          </button>
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Aleo and React logos to learn more
      </p>
    </>
  );
}

export default App;
