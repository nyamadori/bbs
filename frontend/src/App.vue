<template>
  <div class="main-container">
    <aside class="ui vertical inverted sidebar visible menu">
      <section class="item">
        <h1 class="header">Channels</h1>
        <div class="menu">
          <a class="item">dev</a>
          <a class="active item">general</a>
          <a class="item">icpc</a>
          <a class="item">general</a>
          <a class="item">icpc</a>
          <a class="item">general</a>
          <a class="item">icpc</a>
          <a class="item">general</a>
          <a class="item">icpc</a>
          <a class="item">general</a>
          <a class="item">icpc</a>
          <a class="item">general</a>
          <a class="item">icpc</a>
          <a class="item">general</a>
          <a class="item">icpc</a>
          <a class="item">general</a>
          <a class="item">icpc</a>
          <a class="item">general</a>
          <a class="item">icpc</a>
          <a class="item">general</a>
          <a class="item">icpc</a>
        </div>
      </section>

      <section class="item">
        <h1 class="header">Direct Messages</h1>
        <div class="menu">
          <a class="item">slackbot</a>
          <a class="item">nyamadori</a>
          <a class="item">awaryu</a>
        </div>
      </section>
    </aside>

    <article class="channel-container">
      <div class="ui top fixed borderless menu channel-menu">
        <div class="header item">#general</div>
      </div>

      <div class="ui basic segment">
        <timeline></timeline>

        <div class="ui bottom fixed borderless menu channel-menu">
          <div class="item" style="width: 100%">
            <div class="ui input">
              <input type="text">
            </div>
          </div>
        </div>
      </div>
    </article>
  </div>

</template>

<script>
import Hello from './components/Hello'
import Timeline from './components/Timeline'

export default {
  components: {
    Hello, Timeline
  }
}
</script>

<style>
html, body {
  overflow: hidden;
}

html, body, .main-container, .channel-container {
  height: 100%;
}

.main-container {
  overflow: hidden;
}

.main-container {
  display: flex;
}

.channel-list-container {
  height: 100%;
}

.channel-container {
  margin-left: 15rem;
  padding-top: 2rem;
  padding-bottom: 3rem;
  overflow: scroll;
  width: 100%;
  height: 100%;
}

.channel-menu {
  // margin-left: 15rem !important;
  left: 15rem !important;
  right: 0 !important;
  width: auto !important;
}

</style>
