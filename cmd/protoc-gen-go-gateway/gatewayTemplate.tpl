{{$svrType := .ServiceType}}
{{$svrName := .ServiceName}}

type {{.ServiceType}}GatewayServer struct{
	cc {{.ServiceType}}Client
}

func New{{.ServiceType}}GatewayServer (client {{.ServiceType}}Client) {{.ServiceType}}HTTPServer {
	return &{{.ServiceType}}GatewayServer{client}
}

{{range .MethodSets}}
{{.Comment}}
func (g *{{$svrType}}GatewayServer) {{.Name}}(ctx context.Context, in *{{.Request}}) (*{{.Reply}}, error) {
	if err := in.Validate(); err != nil {
		return nil, err
	}
	return g.cc.{{.Name}}(ctx, in)
}
{{end}}
