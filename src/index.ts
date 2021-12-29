// @ts-ignore
import * as fetch from "node-fetch";

// @ts-ignore
if (!globalThis.fetch) {
  // @ts-ignore
  globalThis.fetch = fetch;
  // @ts-ignore
  globalThis.Headers = fetch.Headers;
  // @ts-ignore
  globalThis.Request = fetch.Request;
  // @ts-ignore
  globalThis.Response = fetch.Response;
}

import { PingServiceClient } from "./ping.client";
import { GrpcWebFetchTransport } from "@protobuf-ts/grpcweb-transport";

const transport = new GrpcWebFetchTransport({
  baseUrl: "http://localhost:5000",
});

const client = new PingServiceClient(transport);

(async () => {
  const { response } = await client.ping({});
  console.log(`Hello ${response}`);
})();
