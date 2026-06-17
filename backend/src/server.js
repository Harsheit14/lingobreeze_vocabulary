const express = require("express");
const wordsRouter = require("./routes/words");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.use("/words", wordsRouter);

app.get("/", (req, res) => {
  res.json({
    success: true,
    message: "LingoBreeze Vocabulary API Running"
  });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
