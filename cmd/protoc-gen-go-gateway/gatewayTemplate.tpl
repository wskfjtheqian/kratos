{{$svrType := .ServiceType}}
{{$svrName := .ServiceName}}

type {{.ServiceType}}GatewayServer struct{
	Client {{.ServiceType}}Client
}

func New{{.ServiceType}}GatewayServer (client {{.ServiceType}}Client) {{.ServiceType}}HTTPServer {
	return &{{.ServiceType}}GatewayServer{Client:client}
}

{{range .MethodSets}}
{{.Comment}}
func (g *{{$svrType}}GatewayServer) {{.Name}}(ctx context.Context, in *{{.Request}}) (*{{.Reply}}, error) {
	if err := in.Validate(); err != nil {
		return nil, err
	}
	return g.Client.{{.Name}}(ctx, in)
}
{{end}}
