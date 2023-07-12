import { plainToClass } from "class-transformer";
import { EspDTO } from "../DTO/string.js";

const Validar_especialistas = (req, res, next) => {
  const validaciones = plainToClass(EspDTO, req.params, {
    excludeExtraneousValues: true,
  });

  for (let key in validaciones) {
    if (validaciones[key] == false) {
      return res.status(403).json({ error: "Datos no permitidos" });
    }
  }

  next();
};

export default Validar_especialistas;
