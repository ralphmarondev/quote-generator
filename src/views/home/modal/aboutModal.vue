<script lang="ts">
  import { defineComponent, PropType } from 'vue';

  export default defineComponent({
    name: 'AboutModal',
    props: {
      showModal: {
        type: Boolean as PropType<boolean>,
        required: true,
      },
    },
    data() {
      return {
        githubUrl: 'https://github.com/ralphmarondev', // Your GitHub profile URL
      };
    },
    methods: {
      closeModal() {
        this.$emit('close');
      },
    },
  });
</script>

<template>
  <div v-if="showModal" class="modal-overlay" @click="closeModal">
    <div class="modal-content" @click.stop>
      <h2>About This Application</h2>
      <h3>
        This is a cute quote generator app created by
        <a :href="githubUrl" target="_blank" rel="noopener noreferrer"
          >Ralph Maron Eda</a
        >..
      </h3>
      <button @click="closeModal">Close</button>
    </div>
  </div>
</template>
