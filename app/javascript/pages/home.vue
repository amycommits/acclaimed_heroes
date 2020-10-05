<template>
  <div>
    <div class="row top-section">
      <div class="col-12 panel-1">
        <h2 class="centered">The world needs a HERO</h2>
        <img class="panel-1-image row" :src="BackgroundCircuit" />
      </div>
    </div>
    <div class="row section-2">
      <h1 class="col-12 text-center">We'll help you find yours</h1>
    </div>
  </div>
</template>
<script>
  import BackgroundCircuit from 'images/circuits_two_color.jpeg'
  export default {
    name: 'Home',
    data() {
      return {
        BackgroundCircuit
      }
    }
  }
</script>
<style>
  .panel-1-image {
    height: 80vh;
    min-width: 100vw;
    object-fit: fill !important;
    z-index: 1;
  }

  /* Centered text */
.centered {
  position: absolute;
  font-weight: bold;
  font-size: 3em;
  top: 35vh;
  left: 50vw;
  transform: translate(-50%, -50%);
  color: white;
  text-shadow: 2px 2px black;
  z-index: 2;
}
</style>