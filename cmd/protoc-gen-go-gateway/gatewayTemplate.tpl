{{$svrType := .ServiceType}}
{{$svrName := .ServiceName}}

type {{.ServiceType}}GatewayServer struct{
	cc {{.ServiceType}}Client
}

func New{{.ServiceType}}GatewayServer (client {{.ServiceType}}Client) {{.ServiceType}}HTTPServer {
	return &{{.ServiceType}}GatewayServer{client}
}

{{range .MethodSets}}
func (g *{{$svrType}}GatewayServer) {{.Name}}(ctx context.Context, in *{{.Request}}) (*{{.Reply}}, error) {
	return g.cc.{{.Name}}(ctx, in)
}
{{end}}
