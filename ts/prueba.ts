import { 
    validate , 
    validateOrReject,
    IsEmail,
    IsString,
    MinLength,
    MaxLength,
    Contains } from "class-validator";

class BaseContent {
  @IsEmail()
  email: string;

  @IsString()
  password: string;
}

class User extends BaseContent {
  @MinLength(10)
  @MaxLength(20)
  name: string;

  @Contains("hello")
  welcome: string;

  @MinLength(20)
  password: string;
}

let user = new User();

user.email = "invalid email"; // inherited property
user.password = "too short"; // password wil be validated not only against IsString, but against MinLength as well
user.name = "not valid";
user.welcome = "helo";

validateOrReject(user).catch((errors) => {
  for (const error of errors) {
    console.log(
      "Promise rejected (validation failed). Errors: ",
      error.property,
      error.constraints
    );
  }
});
