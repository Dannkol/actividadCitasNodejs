var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import { validateOrReject, IsEmail, IsString, MinLength, MaxLength, Contains } from "class-validator";
class BaseContent {
}
__decorate([
    IsEmail()
], BaseContent.prototype, "email", void 0);
__decorate([
    IsString()
], BaseContent.prototype, "password", void 0);
class User extends BaseContent {
}
__decorate([
    MinLength(10),
    MaxLength(20)
], User.prototype, "name", void 0);
__decorate([
    Contains("hello")
], User.prototype, "welcome", void 0);
__decorate([
    MinLength(20)
], User.prototype, "password", void 0);
let user = new User();
user.email = "invalid email"; // inherited property
user.password = "too short"; // password wil be validated not only against IsString, but against MinLength as well
user.name = "not valid";
user.welcome = "helo";
validateOrReject(user).catch((errors) => {
    for (const error of errors) {
        console.log("Promise rejected (validation failed). Errors: ", error.property, error.constraints);
    }
});
