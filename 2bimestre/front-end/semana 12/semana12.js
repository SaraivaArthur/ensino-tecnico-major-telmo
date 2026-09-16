import React, { useCallback, useState } from "react";
import { List } from "react-window";

const UserItem = React.memo(({ user }) => {
  return <div>{user}</div>;
});

class AddUserButton extends React.PureComponent {
  render() {
    return <button onClick={this.props.onClick}>Adicionar</button>;
  }
}

function Row({ index, style, users }) {
  return (
    <div style={style}>
      <UserItem user={users[index]} />
    </div>
  );
}

function App() {
  const [users, setUsers] = useState([
    "Alice",
    "Bob",
    "Charlie",
    "Daniel",
    "Eduarda",
    "Fernanda",
    "Gabriel",
    "Helena",
    "Igor",
    "Julia"
  ]);

  const [newUser, setNewUser] = useState("");

  const addUser = useCallback(() => {
    if (newUser.trim() !== "") {
      setUsers((prevUsers) => [...prevUsers, newUser]);
      setNewUser("");
    }
  }, [newUser]);

  return (
    <div>
      <h1>Lista de Usuários</h1>

      <input
        type="text"
        value={newUser}
        onChange={(e) => setNewUser(e.target.value)}
        placeholder="Adicionar usuário"
      />

      <AddUserButton onClick={addUser} />

      <List
        style={{ height: 150, width: 300 }}
        rowCount={users.length}
        rowHeight={35}
        rowComponent={Row}
        rowProps={{ users }}
      />
    </div>
  );
}

export default App;