const { PinataSDK } = require("pinata")
//use your api keys
const PINATA_JWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySW5mb3JtYXRpb24iOnsiaWQiOiIwNjk0MDllNC0wM2RhLTQzMjUtYjYxZC01OWNmOGRkY2Q0NTIiLCJlbWFpbCI6ImxpbTAwN0B1Y3NkLmVkdSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJwaW5fcG9saWN5Ijp7InJlZ2lvbnMiOlt7ImRlc2lyZWRSZXBsaWNhdGlvbkNvdW50IjoxLCJpZCI6IkZSQTEifSx7ImRlc2lyZWRSZXBsaWNhdGlvbkNvdW50IjoxLCJpZCI6Ik5ZQzEifV0sInZlcnNpb24iOjF9LCJtZmFfZW5hYmxlZCI6ZmFsc2UsInN0YXR1cyI6IkFDVElWRSJ9LCJhdXRoZW50aWNhdGlvblR5cGUiOiJzY29wZWRLZXkiLCJzY29wZWRLZXlLZXkiOiJhYWI4MmI1MjUwZTA3NDkyNzVkNyIsInNjb3BlZEtleVNlY3JldCI6ImIyYjA3NTc2YTdiZDNmMjA3M2UyYWI1YmIzNzUxNDdlODgxMmU3ZDBjNmUyNDRiNzllYzQ1ZTlkYzBjNzQ3MTciLCJleHAiOjE3NjIyMzUwOTN9.7cJQmeSAT9ancCMSMskuWvoX4ZcdqgFaG624RxJym58";
const GATEWAY_URL = "magenta-total-bison-971.mypinata.cloud";

//put the cid of file you want to fetch here
const cid='bafkreiatkubvbkdidscmqynkyls3iqawdqvthi7e6mbky2amuw3inxsi3y';

const pinata = new PinataSDK({
  pinataJwt: PINATA_JWT,
  pinataGateway: GATEWAY_URL
})

async function main() {
  try {
    const { data, contentType } = await pinata.gateways.get(cid);
    console.log(await pinata.gateways.get(cid));
    console.log("File retrieved:", data);
    console.log("Content type:", contentType);
    return { data, contentType };

  } catch (error) {
    console.log(error);
  }
}

main()

