from sonora.asgi import grpcASGI
from quart import Quart
import ping_pb2_grpc
import ping_pb2

application = Quart(__name__)
application.asgi_app = grpcASGI(application.asgi_app)


class PingServicer(ping_pb2_grpc.PingServiceServicer):
    async def Ping(self, req, context):
        return ping_pb2.PingResponse()


ping_pb2_grpc.add_PingServiceServicer_to_server(PingServicer(), application.asgi_app)


application.run()
