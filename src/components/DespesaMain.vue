<template>
  <div>
    <div class="row">
        <div class="col-sm-12">
            <h2>{{ $t('Program') }}: {{ this.pointInfo.ds_programa }}</h2>
            <h2>{{ $t('Expense') }}: {{ this.pointInfo.ds_projeto_atividade }}</h2>
            <!-- <spinner class="dark-spinner" if="{ !this.pointInfo }" scale="0.25"/> -->
        </div>
    </div>

    <div v-if="this.pointInfo" class="row">
        <div v-for="(cat, i) in categories" :key="i" class="col-sm-4 category">
            <div class="subtitle">{{ $t(cat) }}</div>
            <span :class="['moedas', cat]" v-html="$assets.moedas"/>
            <div v-if="values[cat] !== undefined" class="value">R$ {{ formatCur(values[cat]) }}</div>
        </div>
    </div>

    <div v-if="this.pointInfo && updateTime" class="row text-right">
        <div class="col-sm-12 padded-col">
            {{ $t('data updated at') }}: {{ updateTime }}
        </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import { formatCur } from '@/utils'
export default {
  name: 'despesa-main',
  data () {
    return {
      categories: ['planejado', 'empenhado', 'liquidado']
    }
  },
  computed: {
    // mainKeys () {
    //   let mainKeysNames = [
    //     ['ds_despesa', 'Despesa'],
    //     ['ds_fonte', 'Fonte'],
    //     ['ds_funcao', 'Função']
    //   ]
    //   let mainKeys = []
    //   for (let name of mainKeysNames) {
    //     let value = this.pointInfo[name[0]]
    //     if (value) mainKeys.push([name[1], value])
    //   }
    //   return mainKeys
    // },
    // keys () { return Object.keys(this.pointInfo) },
    values () {
      var values = {}
       values.planejado = this.pointInfo.sld_orcado_ano ? this.pointInfo.sld_orcado_ano : this.pointInfo.vl_orcado_ano
      if (this.pointInfo.vl_atualizado) values.planejado = this.pointInfo.vl_atualizado
      values.empenhado = this.pointInfo.vl_empenhadoliquido
      values.liquidado = this.pointInfo.vl_liquidado
      return values
    },
    updateTime () {
      if (this.pointInfo) {
        if (this.pointInfo.dataextracao) return this.pointInfo.dataextracao
        if (this.pointInfo.datafinal) return this.pointInfo.datafinal
        if (this.pointInfo['cd_anoexecucao']) return this.pointInfo['cd_anoexecucao']
        if (this.pointInfo['cd_exercicio']) return this.pointInfo['cd_exercicio']
      }
      return undefined
    },
    ...mapState({
      pointInfo: state => state.money.pointInfo
      // empenhos: state => state.empenhos.empenhos
    })
  },
  methods: {
    formatCur
  }
}
</script>
