import { plainToClass } from "class-transformer";
import { DateDTO } from "../DTO/date.js";
import { IdsDTO } from "../DTO/ids.js";

const Validar_fecha_id = (req, res, next) => {



  const validacion_fecha = plainToClass(DateDTO, req.params, {
    excludeExtraneousValues: true,
  });

  const validacion_id = plainToClass(IdsDTO, req.params, {
    excludeExtraneousValues: true,
  });


  for (let key in validacion_fecha) {
    if (validacion_fecha[key] == false) {
      return res.status(403).json({ error: "Datos no permitidos" });
    }else{
        continue;
    }
  }

  for (let key in validacion_id) {
    if (validacion_id[key] == false) {
      return res.status(403).json({ error: "Datos no permitidos" });
    }else{
        continue;
    }
  }

  next();
};

export default Validar_fecha_id;
