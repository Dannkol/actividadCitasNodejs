import { plainToClass } from "class-transformer";
import { DateDTO } from "../DTO/date.js";

const Validar_fecha = (req, res, next) => {
  const validaciones = plainToClass(DateDTO, req.params, {
    excludeExtraneousValues: true,
  });

  for (let key in validaciones) {
    if (validaciones[key] == false) {
      return res.status(403).json({ error: "Datos no permitidos" });
    }
  }

  next();
};

export default Validar_fecha;
