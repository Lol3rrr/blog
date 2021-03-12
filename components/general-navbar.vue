<template>
  <div class="navbar">
    <a class="item" href="/"> Posts </a>
  </div>
</template>

<style scoped>
a {
  text-decoration: none;
}

.navbar {
  position: fixed;
  width: 20%;
}

.item {
  display: block;
  width: 100%;
  text-align: left;
  font-size: calc(14px + 0.75vw);

  padding: 0.5vw 1vh;
}

.item:nth-child(2n) {
  background-color: #010101;
}
.item:nth-child(2n + 1) {
  background-color: #212121;
}
</style>
