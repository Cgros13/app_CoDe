import { Controller } from "@hotwired/stimulus"
import ApexCharts from 'apexcharts'

// Connects to data-controller="all-graph"
export default class extends Controller {
  static targets = ["container"]
  static values = {
    "urls": Array,
    "co2s": Array,
  }

  connect() {
    if (this.urlsValue.length == 0 || this.co2sValue.length == 0) return

    this.getCo2sOptions();
    this.chart = new ApexCharts(this.containerTarget, this.options);
    this.chart.render();
  }

  getCo2sOptions() {
    this.options = {
      series: [{
        data: this.co2sValue
      }],
      chart: {
        type: 'bar',
        height: 350
      },
      plotOptions: {
        bar: {
          borderRadius: 0,
          horizontal: true,
        }
      },
      dataLabels: {
        enabled: false
      },
      xaxis: {
        categories: this.urlsValue
      }
    };
  }
}
