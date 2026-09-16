<template>
    <div>
        <h2>Carrinho</h2>
        <button @click="addProduct">Adicionar Produto</button>
        <p>Total: {{ cartItemCount }}</p>
    </div>
</template>
<script>
import { mapActions, mapGetters } from 'vuex';
export default {
    computed: {
        ...mapGetters(['cartItemCount'])
    },
    methods: {
        ...mapActions(['addToCart']),
        addProduct() {
            this.addToCart({ name: 'Produto', price: 10 });
        }
    }
};
</script>
