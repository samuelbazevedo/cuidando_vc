<template>
    <nav class="navbar navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button"
                        class="navbar-toggle collapsed"
                        @click="isExpanded = !isExpanded"
                        data-toggle="collapse"
                        data-target="#navbar"
                        :aria-expanded="isExpanded"
                        aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <router-link id="home-button"
                   class="navbar-brand"
                   to="/">
                    <img :src="$assets.logo">
                    <span class="beta-mark">2.0</span>
                </router-link>
            </div>

            <div id="navbar"
                 :class="{ collapse: true, 'navbar-collapse': true, in: isExpanded }">
                <ul class="nav navbar-nav navbar-right">
                  <li>
                    <router-link :to="{ name: 'about'}">{{ $t('About') }}</router-link>
                  </li>

                  <li>
                    <router-link :to="{ name: 'analises'}">{{ $t('Analysis') }}</router-link>
                  </li>

                  <li><a href="http://blog.cuidando.vc" target="_blank">Blog</a></li>
                  
                    <li v-if="username">
                        <router-link :to="{ name: 'pessoa', params: { viewingUser: username } }">
                        {{ username }}
                        </router-link>
                    </li>
                    <li v-if="!username">
                        <a @click="openLoginModal">
                        {{ $t("Login") }}
                        </a>
                    </li>
                    <li v-if="username"><a @click="sendLogout">
                        {{ $t("Logout") }}
                    </a></li>

                    <!-- <li>
                      <styled-select :options="langs" :value="$i18n.locale" @input="selectedLang"/>
                    </li> -->
                </ul>
            </div>
        </div>

      <modal-box modal-id="login">
          <login-form/>
      </modal-box>

    </nav>
</template>

<script>
import { mapState, mapMutations, mapActions } from 'vuex'
import LoginForm from '@/components/LoginForm.vue'
export default {
  name: 'main-menu',
  components: {
    LoginForm
  },
  data () {
    return {
      langs: [
        { key: 'pt-br', value: 'Português' },
        { key: 'en', value: 'English' }
      ],
      isExpanded: false
    }
  },
  computed: {
    shareLink () {
      let page = encodeURIComponent(location.origin + this.$route.fullPath)
      return `http://www.facebook.com/sharer.php?u=${page}`
    },
    ...mapState({
      username: state => state.auth.username
    })
  },
  methods: {
    closeExpanded () {
      this.isExpanded = false
    },
    openLoginModal (event) {
      this.closeExpanded()
      this.openModal('login')
    },
    selectedLang (lang) {
      this.closeExpanded()
      this.$i18n.locale = lang
    },
    sendLogout () {
      this.closeExpanded()
      this.logout()
    },
    ...mapActions(['logout']),
    ...mapMutations(['openModal'])
  }
}
</script>
