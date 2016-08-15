<template>
  <div class="comment">
    <a class="avatar">
      <img src="http://placehold.it/300x300">
    </a>
    <div class="content">
      <a class="author">{{ message.user.name }}</a>
      <div class="metadata">
        <span class="date">{{ message.created_at }}</span>
      </div>

      <div class="text">{{ message.body }}</div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['message']
}
</script>

<style scoped>

</style>
