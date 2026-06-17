const express = require("express");
const words = require("../data/words.json");

const router = express.Router();

router.get("/", (req, res) => {
  try {
    return res.json({
      success: true,
      data: words
    });
  } catch (error) {
    return res.status(500).json({
      success: false,
      message: "Failed to fetch words"
    });
  }
});

module.exports = router;
