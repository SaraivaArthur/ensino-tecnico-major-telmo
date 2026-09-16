import { createStore, applyMiddleware } from 'redux';
import cartReducer from './cartReducer';
import { composeWithDevTools } from '@redux-devtools/extension';
import { createLogger } from 'redux-logger';
const logger = createLogger();
const store = createStore(
    cartReducer,
    composeWithDevTools(applyMiddleware(logger))
);
export default store;