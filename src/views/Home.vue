<template>
  <div>
    <slot/>
    <div class="home container">

      <h1 class="text-center">Dados do orçamento da cidade de São Paulo em tempo real</h1>
      <p class="text-center">Aqui explicamos qual é a fonte dos dados públicos que utilizamos, a porcentagem dos gastos que conseguimos colocar no mapa da cidade e informações sobre os gastos que não estão no mapa, mas também podem ser explorados.</p>

      <div class="text-center">
        <h2>Quantidade e distribuição de recursos por tipo em {{ year }}</h2>
        <p>Aqui estão todas as informações sobre os gastos públicos na cidade de São Paulo. Elas são obtidas através do <a href="https://orcamento.prefeitura.sp.gov.br/orcamento/execucao.php" target="_blank">portal de transparência</a>. Nossa equipe buscou por termos para poder realizar a geolocalização dos mesmos, mas nem sempre isso é possível. Nessa página mostramos as estatísticas do que está mapeado e do que não está tanto em termos absolutos (número de atividades) ou relativos à quantidade de recursos. Na tabela abaixo estão relacionados todos os gastos e clicando sobre a linha correspondente você poderá obter mais detalhes e também solicitar as informações que deseja.</p>
      </div>
      <year-charts/>

      <dynamic-table/>

      <div class="row">
          <div class="col-lg-12">
              <a class="btn btn-color-sec block-center download-table"
              href="http://devcolab.each.usp.br/dadosorcamentarios"
              target="_blank">
                  <span class="download-arrow"/>
                  {{ $t("Download table") }}
              </a>
          </div>
      </div>

      <recent-activities/>

    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import RecentActivities from '@/components/RecentActivities.vue'
import DynamicTable from '@/components/DynamicTable.vue'
import YearCharts from '@/components/chart/YearCharts.vue'

export default {
  name: 'home-view',
  components: {
    RecentActivities,
    YearCharts,
    DynamicTable
  },
  computed: mapState({
    year: state => state.route.params.year
  })
}
</script>
