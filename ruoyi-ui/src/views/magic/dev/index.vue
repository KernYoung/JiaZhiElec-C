<template>
  <div id="pps">
    <iFrame
      :src="url"
      class="map-frame"
    />
  </div>
</template>

<script>
export default {
  name: 'MagicDev',
  data() {
    return {
      url: process.env.VUE_APP_BASE_API + "/magic/web/",
    }
  },
}
</script>

<style scoped lang="scss">
#pps {
  height: calc(100vh - 84px);
  width: 100%;
  background: #fff;

  .map-frame {
    height: 100%;
    width: 100%;
    border: 0
  }
}
</style>
