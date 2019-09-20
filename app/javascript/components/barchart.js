import * as d3 from "d3";

const barchart = () => {
  const jsonURL = document.querySelector("#barchart").dataset.url
  const baseURL = "http://localhost:3000"
  console.log(jsonURL)
  const height = 400;
  const width = 500;
  const margin = {left: 50, right: 50, top: 40, bottom: 0};

  const svg = d3.select("#barchart")
    .append("svg")
      .attr("width", width)
      .attr("height", height)
      .attr("class", "svg");

  const barChart = svg
    .append("g")
      .attr("transform", "translate("+margin.left+","+margin.top+")")
      .attr("class", "barChart")

  d3.json(jsonURL)
    .then(data => {
      console.log(data);
  });
}

export { barchart };

