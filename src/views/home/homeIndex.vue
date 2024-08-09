<script lang="ts">
  import { defineComponent } from 'vue';
  import About from './modal/aboutModal.vue';

  export default defineComponent({
    name: 'HomeIndex',
    components: {
      About,
    },
    data() {
      return {
        message: {
          quote: '',
          author: '',
        },
        quotes: [
          {
            quote: 'Still crushing on you.',
            author: 'Ralph Maron Eda',
          },
        ],
        usedQuotes: [] as { quote: string; author: string }[],
        showModal: false,
      };
    },
    mounted() {
      this.defaultQuote();
      this.fetchQuotes();
    },
    methods: {
      fetchQuotes() {
        this.quotes.push(
          {
            quote: 'The only way to do great work is to love what you do.',
            author: 'Steve Jobs',
          },
          {
            quote: 'In the middle of every difficulty lies opportunity.',
            author: 'Albert Einstein',
          },
          {
            quote: 'The best way to predict the future is to invent it.',
            author: 'Alan Kay',
          },
          {
            quote: 'Sometimes the heart sees what is invisible to the eye.',
            author: 'H. Jackson Brown Jr.',
          },
          {
            quote: 'You can’t blame gravity for falling in love.',
            author: 'Albert Einstein',
          },
          {
            quote:
              'When you have a crush on someone, you get to know them in your mind before you even meet them in person.',
            author: 'Unknown',
          },
          {
            quote:
              'The most beautiful things in the world cannot be seen or even touched, they must be felt with the heart.',
            author: 'Helen Keller',
          },
          {
            quote:
              'Love is not about how many days, months, or years you have been together, it’s all about how much you love each other every single day.',
            author: 'Unknown',
          },
          {
            quote:
              'If you’re afraid to be yourself, you’ll never know what you’re capable of.',
            author: 'Unknown',
          },
          {
            quote:
              'The hardest part of dreaming about someone you love is waking up.',
            author: 'Unknown',
          },
          {
            quote:
              'It’s tough to see someone you love with someone else, but it’s even harder to see them unhappy with you.',
            author: 'Unknown',
          },
          {
            quote:
              'You can’t force someone to love you, but you can try to be the best version of yourself for the right person to come along',
            author: 'Unknown',
          },
          {
            quote:
              'It’s difficult to watch someone else fall for the person you secretly wanted, but sometimes you have to let it be and move on',
            author: 'Unknown',
          },
          {
            quote:
              'Loving someone from afar is painful, but sometimes it’s the only way to keep a piece of them with you.',
            author: 'Unknown',
          }
        );
      },
      defaultQuote() {
        this.message = {
          quote: 'Still have feelings for the girl I shared a PE class with last year.',
          author: 'Ralph Maron Eda',
        };
      },
      generateQuote() {
        if (this.quotes.length === 1) {
          this.quotes = [...this.usedQuotes];
          this.usedQuotes = [];
        }

        const randomInt = Math.floor(
          Math.random() * (this.quotes.length - 1) + 1
        );

        const selectedQuote = this.quotes[randomInt];
        this.message = selectedQuote;

        this.usedQuotes.push(selectedQuote);
        this.quotes.splice(randomInt, 1);
      },
      openModal() {
        this.showModal = true;
      },
      closeModal() {
        this.showModal = false;
      },
    },
  });
</script>
<template>
  <div>
    <header>
      <div class="logo">Quote Generator</div>
      <div class="action" @click="openModal">About</div>
    </header>
    <main>
      <form class="card" @submit.prevent="generateQuote">
        <div class="quote-container">
          <p>{{ message.quote }}</p>
          <span>-- {{ message.author }}</span>
        </div>
        <div class="button-container">
          <button type="submit">Generate</button>
        </div>
      </form>
    </main>
    <footer>
      <p>© 2024 Ralph Maron Eda. All rights reserved.</p>
      <p>Made with ❤️ using Vue.js</p>
    </footer>

    <About :showModal="showModal" @close="closeModal" />
  </div>
</template>
