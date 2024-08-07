// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.org).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerinax/sap;

#

#

# The service enables you to create, read, update, and delete locations through an API call. You can perform these activities from a source system outside SAP S/4HANA Cloud.

# The service is based on the OData protocol.

public isolated client class Client {
    final sap:Client clientEp;

    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string hostname, int port = 443) returns error? {
        string serviceUrl = string `https://${hostname}:${port}/sap/opu/odata4/sap/api_managelocation/srvd_a2x/sap/managelocation/0001`;
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        sap:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }

    # Add new entity to Location
    #
    # + headers - Headers to be sent with the request 
    # + payload - New entity 
    # + return - Created entity 
    remote isolated function createLocation(CreateLocation payload, map<string|string[]> headers = {}) returns Location|error {
        string resourcePath = string `/Location`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Add new entity to related _LocationTextTP
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + headers - Headers to be sent with the request 
    # + payload - New entity 
    # + return - Created entity 
    remote isolated function createLocationTextTPOfLocation(string LocationUUID, CreateLocationText payload, map<string|string[]> headers = {}) returns LocationText|error {
        string resourcePath = string `/Location/${getEncodedUri(LocationUUID)}/_LocationTextTP`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Delete entity from Location
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + headers - Headers to be sent with the request 
    # + return - Success 
    remote isolated function deleteLocation(string LocationUUID, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/Location/${getEncodedUri(LocationUUID)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Delete entity from LocationText
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + Language - Language Key
    # + headers - Headers to be sent with the request 
    # + return - Success 
    remote isolated function deleteLocationText(string LocationUUID, string Language, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/LocationText/${getEncodedUri(LocationUUID)}/${getEncodedUri(Language)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Get entity from Location by key
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getLocation(string LocationUUID, map<string|string[]> headers = {}, *GetLocationQueries queries) returns Location|error {
        string resourcePath = string `/Location/${getEncodedUri(LocationUUID)}`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get entity from LocationAddress by key
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + AddressPersonID - Person Number
    # + AddressRepresentationCode - Version ID for International Addresses
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getLocationAddress(string LocationUUID, string AddressPersonID, string AddressRepresentationCode, map<string|string[]> headers = {}, *GetLocationAddressQueries queries) returns LocationAddress|error {
        string resourcePath = string `/LocationAddress/${getEncodedUri(LocationUUID)}/${getEncodedUri(AddressPersonID)}/${getEncodedUri(AddressRepresentationCode)}`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get related _LocationAddressTP
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getLocationAddressTPOfLocation(string LocationUUID, map<string|string[]> headers = {}, *GetLocationAddressTPOfLocationQueries queries) returns LocationAddress|error {
        string resourcePath = string `/Location/${getEncodedUri(LocationUUID)}/_LocationAddressTP`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get related _LocationTP
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + AddressPersonID - Person Number
    # + AddressRepresentationCode - Version ID for International Addresses
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getLocationTPOfLocationAddress(string LocationUUID, string AddressPersonID, string AddressRepresentationCode, map<string|string[]> headers = {}, *GetLocationTPOfLocationAddressQueries queries) returns Location|error {
        string resourcePath = string `/LocationAddress/${getEncodedUri(LocationUUID)}/${getEncodedUri(AddressPersonID)}/${getEncodedUri(AddressRepresentationCode)}/_LocationTP`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get related _LocationTP
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + Language - Language Key
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getLocationTPOfLocationText(string LocationUUID, string Language, map<string|string[]> headers = {}, *GetLocationTPOfLocationTextQueries queries) returns Location|error {
        string resourcePath = string `/LocationText/${getEncodedUri(LocationUUID)}/${getEncodedUri(Language)}/_LocationTP`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get entity from LocationText by key
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + Language - Language Key
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getLocationText(string LocationUUID, string Language, map<string|string[]> headers = {}, *GetLocationTextQueries queries) returns LocationText|error {
        string resourcePath = string `/LocationText/${getEncodedUri(LocationUUID)}/${getEncodedUri(Language)}`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get entities from LocationAddress
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listLocationAddresses(map<string|string[]> headers = {}, *ListLocationAddressesQueries queries) returns CollectionOfLocationAddress|error {
        string resourcePath = string `/LocationAddress`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get entities from related _LocationTextTP
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listLocationTextTPsOfLocation(string LocationUUID, map<string|string[]> headers = {}, *ListLocationTextTPsOfLocationQueries queries) returns CollectionOfLocationText|error {
        string resourcePath = string `/Location/${getEncodedUri(LocationUUID)}/_LocationTextTP`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get entities from LocationText
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listLocationTexts(map<string|string[]> headers = {}, *ListLocationTextsQueries queries) returns CollectionOfLocationText|error {
        string resourcePath = string `/LocationText`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get entities from Location
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listLocations(map<string|string[]> headers = {}, *ListLocationsQueries queries) returns CollectionOfLocation|error {
        string resourcePath = string `/Location`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Update entity in Location
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + headers - Headers to be sent with the request 
    # + payload - New property values 
    # + return - Success 
    remote isolated function patchLocation(string LocationUUID, UpdateLocation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/Location/${getEncodedUri(LocationUUID)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, headers);
    }

    # Update entity in LocationAddress
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + AddressPersonID - Person Number
    # + AddressRepresentationCode - Version ID for International Addresses
    # + headers - Headers to be sent with the request 
    # + payload - New property values 
    # + return - Success 
    remote isolated function patchLocationAddress(string LocationUUID, string AddressPersonID, string AddressRepresentationCode, UpdateLocationAddress payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/LocationAddress/${getEncodedUri(LocationUUID)}/${getEncodedUri(AddressPersonID)}/${getEncodedUri(AddressRepresentationCode)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, headers);
    }

    # Update entity in LocationText
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + Language - Language Key
    # + headers - Headers to be sent with the request 
    # + payload - New property values 
    # + return - Success 
    remote isolated function patchLocationText(string LocationUUID, string Language, UpdateLocationText payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/LocationText/${getEncodedUri(LocationUUID)}/${getEncodedUri(Language)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, headers);
    }

    # Send a group of requests
    #
    # + headers - Headers to be sent with the request 
    # + request - Batch request 
    # + return - Batch response 
    remote isolated function performBatchOperation(http:Request request, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/$batch`;
        // TODO: Update the request as needed;
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Invoke action ToglMnlGeoCoordinatesMaint
    #
    # + LocationUUID - Internal Location Number (Customer, Supplier, or Plant)
    # + headers - Headers to be sent with the request 
    # + return - Success 
    remote isolated function toglMnlGeoCoordinatesMaint(string LocationUUID, map<string|string[]> headers = {}) returns Location|error {
        string resourcePath = string `/Location/${getEncodedUri(LocationUUID)}/SAP__self.ToglMnlGeoCoordinatesMaint`;
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }
}
