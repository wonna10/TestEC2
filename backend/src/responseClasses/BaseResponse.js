class BaseResponse {
    constructor(message) {
        this._name = "BaseResponse";
        this._message = message;
        this._statusCode = 200;
    }

    get json() {
        return {
            "name": this._name,
            "message": this._message,
            "statusCode": this._statusCode,
        }
    }

    get name() {
        return this._name;
    }

    get message() {
        return this._message;
    }

    get statusCode() {
        return this._statusCode;
    }
}

module.exports = BaseResponse;