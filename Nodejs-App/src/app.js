const express = require("express");

const app = express();

// Serve frontend files from the public directory
app.use(express.static("public"));

app.get("/", (req, res) => {
  res.sendFile("index.html", { root: "public" });
});

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

module.exports = app;

if (require.main === module) {
  const port = process.env.PORT || 3000;

  app.listen(port, () => {
    console.log(`Server running on port ${port}`);
  });
}

