<template>
  <div class="index">
    <a class="button is-primary" @click="fetchBeers()">Fetch</a>
    <a class="button is-primary" @click="form_seen = !form_seen">Create</a>

    <form v-if="form_seen">
      <div class="field">
        <label class="label" for="name">Name</label>
        <input class="input" type="text" id="name" name="name" placeholder="Name" v-model="form_data.v1_beer.name">
      </div>

      <div class="field">
        <label class="label" for="brand">Brand</label>
        <input class="input" type="text" id="brand" name="brand" placeholder="Brand" v-model="form_data.v1_beer.brand">
      </div>

      <div class="field">
        <label class="label" for="price">Price</label>
        <input class="input" type="text" name="price" placeholder="Price" v-model="form_data.v1_beer.price">
      </div>

      <div class="field">
        <label class="label" for="store">Store</label>
        <input class="input" type="text" name="store" placeholder="Store" v-model="form_data.v1_beer.store">
      </div>

      <div class="field">
        <button class="button is-link" @click="createBeer()">Submit</button>
      </div>

    </form>

    <ul style="margin-top: 50px">
      <li v-for="beer in beers.data">
        <p><strong>Name: {{ beer.attributes.name }}</strong></p>
        <p>Brand: {{ beer.attributes.brand }}</p>
        <p>Cost: R$ {{ beer.attributes.price }}</p>
        <p>Store: {{ beer.attributes.store }}</p>
      </li>
    </ul>

    <div class="errors">
      <p v-for="error in errors">{{ error }}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'index',
  data () {
    return {
      beers: {},
      errors: [],

      form_seen: false,
      form_data: {
        'v1_beer': {
          name: '',
          brand: '',
          price: '',
          store: ''
        }
      }
    }
  },

  methods: {
    fetchBeers () {
      axios.get('http://localhost:3000/v1/beers')
      .then(response => {
        this.beers = response.data
      })
      .catch(e => {
        this.errors.push(e)
      })
    },

    createBeer () {
      axios.post('http://localhost:3000/v1/beers', this.form_data)
      .then(response => {})
      .catch(e => {
        this.errors.push(e)
      })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
