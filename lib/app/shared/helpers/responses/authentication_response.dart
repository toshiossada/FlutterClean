const loginResponseSuccess = '''
{
    "value": 
    {
            "id_usuario": 15407,
            "nome_usuario": "MARCELO AMENDOLA",
            "login_usuario": "marceloamendola1",
            "email_usuario": "marcelo.oliveira@ao3tech.com",
            "cnpJ_CPF": "43217850000159",
            "status_login": 1,
            "id_contrato": 1398409,
            "qtde_ncms": 300
    },
    "success": true,
    "statusCode": 200,
    "message": null,
    "validation": null
}
''';
const loginResponseFailure = '''
{
    "value": null,
    "success": false,
    "statusCode": 400,
    "message": "Usuário não encontrado.",
    "validation": null
}
''';

const recoveryPasswordRecovery = '''
{"result": true}
''';
