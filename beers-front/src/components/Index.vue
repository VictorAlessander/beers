<template>
  <div class="index">
    <a class="button is-primary" @click="fetchBeers()">Fetch</a>
    <ul style="margin-top: 30px">
      <li v-for="beer in beers.data">
        <p><strong>{{ beer.attributes.name }}</strong></p>
        <p>{{ beer.attributes.brand }}</p>
        <p>R$ {{ beer.attributes.price }}</p>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'index',
  data () {
    return {
      beers: {},
      errors: []
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
