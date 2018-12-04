<template>
  <v-app id="app">
    <router-view/>
  </v-app>
</template>

<script>
export default {
  name: 'App',
};
</script>


<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;

  /* Set to resize with view port */
  width: 100vw;
  height: 100vh;
  /* Align the text and set its color */
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  /* Background Img */
  background-image: url('./assets/arcade.jpeg');
  /* background: #48dbfb; */
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
  background-attachment: fixed;
}
#nav {
  padding: 30px;
  a {
    font-weight: bold;
    color: #2c3e50;
    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
