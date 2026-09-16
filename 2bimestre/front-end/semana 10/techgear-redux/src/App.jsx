import { useDispatch, useSelector } from 'react-redux';
function App() {
  const dispatch = useDispatch();
  const cart = useSelector((state) => state.cart);
  const products = [
    { id: 1, name: 'Mouse Gamer', price: 120 },
    { id: 2, name: 'Teclado Mecânico', price: 250 },
    { id: 3, name: 'Headset', price: 180 }
  ];
  function addToCart(product) {
    dispatch({
      type: 'ADD_TO_CART',
      payload: product
    });
  }
  function removeFromCart(index) {
    dispatch({
      type: 'REMOVE_FROM_CART',
      payload: index
    });
  }
  return (
    <div className="container">
      <h1>TechGear</h1>
      <h2>Carrinho de Compras com Redux</h2>
      <section>
        <h3>Produtos</h3>
        {products.map((product) => (
          <div className="card" key={product.id}>
            <p>{product.name}</p>
            <p>R$ {product.price}</p>
            <button onClick={() => addToCart(product)}>
              Adicionar ao carrinho
            </button>
          </div>
        ))}
      </section>
      <section>
        <h3>Carrinho</h3>
        {cart.length === 0 ? (
          <p>O carrinho está vazio.</p>
        ) : (
          cart.map((item, index) => (
            <div className="card" key={index}>
              <p>{item.name}</p>
              <p>R$ {item.price}</p>
              <button onClick={() => removeFromCart(index)}>
                Remover
              </button>
            </div>
          ))
        )}
      </section>
    </div>
  );
}
export default App;