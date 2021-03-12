<template>
  <div class="content">
    <blog-title>Posts</blog-title>
    <div class="post-list">
      <div v-for="post in posts" :key="post.title" class="post-list-item">
        <a class="item-content" :href="post.path">
          <h4>{{ post.title }}</h4>
          <p>{{ post.description }}</p>
        </a>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

import BlogTitle from '@/components/title.vue'

export default Vue.extend({
  components: {
    BlogTitle,
  },

  data() {
    return {
      posts: [
        {
          title: 'Tunneload - Part 0',
          path: '/tunneload_0/',
          description:
            "A Basic conceptual overview of my Load-Balancer 'Tunneload'",
        },
      ],
    }
  },

  head: {
    title: 'Posts',
    meta: [
      {
        hid: 'description',
        name: 'description',
        content: 'A simple overview of all my Blog-Posts',
      },
    ],
  },
})
</script>

<style scoped>
.post-list {
  width: 100%;
  margin: auto;
}
.post-list-item {
  margin: auto;
  width: 100%;
  position: relative;
}

.item-content {
  position: relative;
  display: inline-block;

  width: 100%;
  height: 100%;
  margin: auto;

  text-align: center;
  border-radius: 1vw;
  padding: 1vh 0.1vw;
  margin: 0.5vh 0px;

  box-shadow: 0.5vmin 0.5vmin 8px black;

  background-color: #262626;

  transition: 250ms all ease-out;
}
.item-content:hover {
  transform: scale(1.05);
  background-color: #2a2a2a;
}

h4 {
  font-size: calc(16px + 0.6vw);
}
a {
  text-decoration: none;
}
</style>
