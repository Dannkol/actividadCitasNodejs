import { Transform, Expose } from 'class-transformer';

export class DateDTO {
  @Expose()
  @Transform(({ value }) => {
    // Validar la fecha
    const date = new Date(value);
    if (isNaN(date.getTime())) {
      return false;
    }
    return date;
  })
  date: Date;
}

