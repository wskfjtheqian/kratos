{{$svrType := .ServiceType}}
{{$svrName := .ServiceName}}


func New{{.ServiceType}}GatewayServer(c UserClient) *{{.ServiceType}}GatewayServer {
	return &{{.ServiceType}}GatewayServer{c: c}
}

type {{.ServiceType}}GatewayServer struct {
	c
}

func (g userGatewayServer) CreateUser(ctx context.Context, req *CreateUserRequest) (*CreateUserReply, error) {
	return g.CreateUser(ctx, req)
}


type {{.ServiceType}}GatewayServerImpl struct{
	cc {{.ServiceType}}Client
}

func New{{.ServiceType}}GatewayServer (client *http.Client) {{.ServiceType}}GatewayServer {
	return &{{.ServiceType}}GatewayServerImpl{client}
}

{{range .MethodSets}}
func (g *{{$svrType}}GatewayServerImpl) {{.Name}}(ctx context.Context, in *{{.Request}}) (*{{.Reply}}, error) {
	return g.cc.{{.Name}}(ctx, req)
}
{{end}}
