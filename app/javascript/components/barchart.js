import * as d3 from "d3";

const barchart = () => {
  const jsonURL = document.querySelector("#barchart").dataset.url
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
      console.log(data)

    // y axis domain min & max:
      const minYear = data["minYear"]
      const maxYear = data["maxYear"]
      const y = d3.scaleTime()
        .domain([minYear, maxYear])
        .range([height, 0])

    // x axis domain min & max:
      const minRead = data["minRead"];
      const maxRead = data["maxRead"];
      const x = d3.scaleLinear()
        .domain([minRead, maxRead])
        .range([0, width])

      const yAxis = d3.axisLeft(y);
      const xAxis = d3.axisBottom(x);

      barChart.selectAll("rect")
        .data(data["data"])
        .enter().append("rect")
            .attr("class", "bar")
            .attr("x", "20")
            .attr("y", function(d,i) { return 45*i;})
            .attr("width", function(d,i) { return 100* d.books.length})
            .attr("height", "40")
            .attr("fill", "#bcc6d0")
  });
}

export { barchart };

