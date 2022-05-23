<template>
  <div>
    <div class="top-bar orgao-box">
        <span class="block-decorator"/>
        <span class="key">{{ $t('Accountable body') }}: </span>
        <span class="value subtitle_orgao">{{ pointInfo.ds_orgao }}</span>
    </div>

    <ul class="list-bare top-bar bottom-bar despesa-details-list">
        <li v-for="el of mainKeys" :key="el[0]">
            <span class="key">{{ el[0] }}: </span>
            <span>{{ el[1] }}</span>
        </li>

        <li v-for="empenho of empenhos" :key="empenho.codEmpenho">
          <a :href="'http://sfemp.prefeitura.sp.gov.br/extrato_empenho.aspx?Empenho=' + empenho.codEmpenho + '&Ano=' + empenho.anoEmpenho" target="_blank">Nota de empenho</a>
        </li>

        <li><a href="http://e-negocioscidadesp.prefeitura.sp.gov.br/BuscaLicitacao.aspx" target="_blank">Licitações - Pesquise aqui</a></li>
        <li><a href="http://transparencia.prefeitura.sp.gov.br/contratos-convenios-e-compras-publicas/#tipo" target="_blank">Contratos - Pesquise aqui</a></li>
        <li><a :href="'https://www.instantstreetview.com/@' + pointInfo.geometry.coordinates[1] + ',' + pointInfo.geometry.coordinates[0] + ',0h,0p,1z'" target="_blank">Visão da rua</a></li>

        <a v-if="!showAllInfo"
            class="small-font"
            @click="showAllInfo = true">
            mais
        </a>

    </ul>

    <ul v-if="showAllInfo && pointInfo"
        class="list-bare bottom-bar despesa-details-list">
        <li v-for="key of keys" :key="key">
            <span class="key">{{ key }}: </span>
            <span>{{ pointInfo[key] }}</span>
        </li>
        <a v-if="showAllInfo"
            class="small-font"
            @click="showAllInfo = false">
            esconder
        </a>
    </ul>
  </div>
</template>

<script>
import { mapState } from 'vuex'
export default {
  name: 'despesa-details',
  data () {
    return {
      showAllInfo: false
    }
  },
  computed: {
    mainKeys () {
      let mainKeysNames = [
        ['ds_despesa', 'Despesa'],
        ['ds_fonte', 'Fonte'],
        ['ds_funcao', 'Função']
      ]
      let mainKeys = []
      for (let name of mainKeysNames) {
        let value = this.pointInfo[name[0]]
        if (value) mainKeys.push([name[1], value])
      }
      return mainKeys
    },
    keys () { return Object.keys(this.pointInfo) },
    ...mapState({
      pointInfo: state => state.money.pointInfo,
      empenhos: state => state.empenhos.empenhos
    })
  },
  methods: {
  }
}
</script>

<style lang="scss">
  .subtitle_orgao {
    color: #6c6c6c;
  }
</style>