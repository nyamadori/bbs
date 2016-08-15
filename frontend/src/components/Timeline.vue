<template>
<div class="ui comments">
  <message v-for="message in messages" :message="message"></message>
</div>
</template>

<script>
import Message from './Message'

export default {
  components: { Message },

  data () {
    return {
      messages: [
        { body: 'hogehoge', user: { name: 'nyamadori' } },
        { body: 'hogehoge', user: { name: 'nyamadori' } },
        { body: 'hogehoge', user: { name: 'nyamadori' } }
      ]
    }
  }
}
</script>
