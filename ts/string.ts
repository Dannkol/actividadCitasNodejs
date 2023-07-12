import { Expose, Transform } from "class-transformer";


export class InventarioPost {

    @Expose({ name: "esp" })
    @Transform(({ obj }) => {
      return /^[a-z A-Z]+$/.test(obj.esp) ? obj.esp : false;
    })
    esp: string;

  
}