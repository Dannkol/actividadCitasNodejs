import { Expose, Transform } from 'class-transformer';


export class IdsDTO {

  @Expose({name: 'id'})
  @Transform(({ obj }) => {return (Math.floor(obj.id)) ? obj.id : false})
  id: number;

  
}