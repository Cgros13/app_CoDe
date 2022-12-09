import { Controller } from "@hotwired/stimulus"
import ApexCharts from 'apexcharts'

// Connects to data-controller="graph"
export default class extends Controller {
  static targets = ["chart"]

  connect() {
    if (isNaN(this.chartTarget.dataset.green)) return;

    this.getOptions();
    this.chart = new ApexCharts(this.chartTarget, this.options);
    this.chart.render();
  }

  getOptions() {
    this.options = {
      chart: {
        height: 280,
        type: "radialBar",
        animations: {
          enabled: true,
          easing: 'easeinout',
          speed: 800,
          animateGradually: {
              enabled: true,
              delay: 150
          },
          dynamicAnimation: {
              enabled: true,
              speed: 350
          }
      }
      },
      series: [this.chartTarget.dataset.green],
      colors: ["#008000"],
      plotOptions: {
        radialBar: {
          hollow: {
            margin: 0,
            size: "70%",
            background: "#CFE1B9"
          },
          track: {
            dropShadow: {
              enabled: true,
              top: 2,
              left: 0,
              blur: 4,
              opacity: 0.15
            }
          },
          dataLabels: {
            name: {
              offsetY: -10,
              color: "#52796F",
              fontSize: "13px"
            },
            value: {
              color: "#52796F",
              fontSize: "30px",
              show: true
            }
          }
        }
      },
      fill: {
        type: "gradient",
        gradient: {
          shade: "dark",
          type: "horizontal",
          shadeIntensity: 0.5,
          gradientToColors: ["#ABE5A1"],
          inverseColors: true,
          opacityFrom: 1,
          opacityTo: 1,
          stops: [0, 100]
        }
      },
      stroke: {
        lineCap: "round"
      },
      labels: ["Renewable energy"]
    };
  }
}
