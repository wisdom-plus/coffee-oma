import Chart from "chart.js/auto";

$(document).on("turbolinks:load", function () {
  // チャートの表示
  if ($("#chart").length) {
    const evaluations = $("#chart").data("evaluations");
    const ctx = document.getElementById("chart").getContext("2d");
    const myChart = new Chart(ctx, {
      type: "radar",
      data: {
        labels: ["酸味", "苦味", "甘み", "コク", "香り"],
        datasets: [
          {
            label: "",
            data: evaluations,
            backgroundColor: "rgba(123,85,68,0.6)",
          },
        ],
      },
      options: {
        scale: {
          ticks: {
            suggestedMin: 0,
            suggestedMax: 5,
            stepSize: 1,
          },
        },
      },
    });
  }
});
