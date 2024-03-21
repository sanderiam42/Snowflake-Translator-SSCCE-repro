CREATE OR REPLACE SECURE FUNCTION "SAMPLE_DATABASE"."SAMPLE_SCHEMA"."SAMPLE_REQUEST_TRANSLATOR"
(EVENT OBJECT)
RETURNS OBJECT
LANGUAGE JAVASCRIPT
RETURNS NULL ON NULL INPUT
VOLATILE
COMMENT = 'v1.0.0.'
AS $$
    const inputData = EVENT.body.data;
    const metadatum = inputData[0];
    const metadata = new Array(metadatum.length - 1);
    for (let i = metadatum.length - 1; i >= 2; i--) {
        metadata[i - 1] = metadatum[i];
    }
    metadata[0] = metadatum[0];
    const request = new Array(inputData.length);
    for (let i = inputData.length - 1; i >= 0; i--) {
        const inputDatum = inputData[i];
        inputDatum.splice(2);
        const value = inputDatum[1];
        request[i] = value;
    }
    return {
        body: {
            request: request,
            metadata: metadata
        },
        translatorData: inputData
    };
$$;

CREATE OR REPLACE SECURE FUNCTION "SAMPLE_DATABASE"."SAMPLE_SCHEMA"."SAMPLE_RESPONSE_TRANSLATOR"
(EVENT OBJECT)
RETURNS OBJECT
LANGUAGE JAVASCRIPT
RETURNS NULL ON NULL INPUT
VOLATILE
COMMENT = 'v1.0.0'
AS $$
    const inputData = EVENT.body.data;
    const translatorData = EVENT.translatorData;
    for (let i = translatorData.length - 1; i >= 0; i--) {
      const row = inputData[i];
      translatorData[i][1] = { key: row[1], value: row[2] };
    }

    return {
      body: {
        data: translatorData
      }
    };
$$;