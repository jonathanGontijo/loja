const mongoose = require("mongoose");

const uri =
  "mongodb+srv://jonathan:SUA_SENHA@cluster0.x2cj4oj.mongodb.net/?appName=Cluster0";

(async () => {
  try {
    await mongoose.connect(uri);
    console.log("Conectado!");
    process.exit(0);
  } catch (err) {
    console.error("Erro completo:");
    console.error(err);
    console.error("Nome:", err.name);
    console.error("Código:", err.code);
    console.error("Mensagem:", err.message);
    console.error("Causa:", err.cause);
    process.exit(1);
  }
})();