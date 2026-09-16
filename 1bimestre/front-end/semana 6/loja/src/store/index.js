import { createStore } from 'vuex';
export default createStore({
    state: {
        cart: []
    },
    mutations: {
        ADD_TO_CART(state, product) {
            state.cart.push(product);
        }
    },
    actions: {
        addToCart({ commit }, product) {
            commit('ADD_TO_CART', product);
        }
    },
    getters: {
        cartItemCount: (state) => state.cart.length
    }
});