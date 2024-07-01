// AUTO-GENERATED FILE.
// This file is auto-generated by the Ballerina OpenAPI tool.

import ballerina/http;
// import ballerina/os;

// boolean isBalBuild = os:getEnv("IS_BAL_BUILD") == "true";
boolean isBalBuild = true;
string certPathPostFix = isBalBuild ? "../" : "/home/ballerina/ballerina/";

listener http:Listener ep0 = new (9090,
    secureSocket = {
        key: {
            certFile: certPathPostFix + "resources/public.crt",
            keyFile: certPathPostFix + "resources/private.key"
        }
    }
);

service /sap/opu/odata/sap/API_CV_ATTACHMENT_SRV on ep0 {

     resource function head .() returns http:Response {
        http:Response res = new;
        res.statusCode = 200;
        res.setHeader("X-CSRF-TOKEN", "SAP-InfoRecord-Process");
        return res;
    }

    # Reads the document info records.
    #
    # + \$top - Show only the first n items, see [Paging - Top](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=66)
    # + \$skip - Skip the first n items, see [Paging - Skip](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    # + \$filter - Filter items by property values, see [Filtering](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=64)
    # + \$inlinecount - Include count of items, see [Inlinecount](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=67)
    # + \$orderby - Order items by property values, see [Sorting](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    # + \$select - Select properties to be returned, see [Select](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=68)
    # + \$expand - Expand related entities, see [Expand](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=63)
    # + return - returns can be any of following types 
    # http:Ok (Retrieved entities)
    # http:Response (Error)
    resource function get A_DocumentInfoRecordAttch(int? \$top, int? \$skip, string? \$filter, "allpages"|"none"? \$inlinecount, A_DocumentInfoRecordAttchOrderByOptions? \$orderby, A_DocumentInfoRecordAttchSelectOptions? \$select, A_DocumentInfoRecordAttchExpandOptions? \$expand) returns CollectionOfA_DocumentInfoRecordAttchWrapper|http:Response {
         return {
            d: {
                results: [
                    {
                        DocumentInfoRecordDocNumber: "12345"
                    }
                ]
            }
        };
    }

    # Returns a URL and token to upload an attachment to a given SAP Object Type or SAP Object Node Type.
    #
    # + payload - New entity 
    # + return - returns can be any of following types 
    # http:Created (Created entity)
    # http:Response (Error)
    resource function post AttachmentHarmonizedOperationSet(@http:Payload CreateAttachmentHarmonizedOperation payload) returns AttachmentHarmonizedOperation_1|http:Response {
        http:Response res = new;
        res.statusCode = 500;
        return res;
    }
}
