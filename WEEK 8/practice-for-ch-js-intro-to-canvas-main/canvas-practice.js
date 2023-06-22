document.addEventListener("DOMContentLoaded", function() {
  const canvas = document.getElementById("myCanvas");
  canvas.height = 500;
  canvas.width = 500;
  const ctx = canvas.getContext('2d');

  ctx.fillStyle = "pink";
  ctx.fillRect(100, 100, 100, 200);

  ctx.beginPath();
  ctx.arc(300, 400, 50, 0, 2*Math.PI);
  ctx.strokeStyle = "green";
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = "yellow";
  ctx.fill();
});